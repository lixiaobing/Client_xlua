Shader "Hidden/PostProcessing/MyDepthOfField"
{
    HLSLINCLUDE

    #include "../StdLib.hlsl"

    TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
    float4 _MainTex_TexelSize;

    TEXTURE2D_SAMPLER2D(_DepthOfFieldTex, sampler_DepthOfFieldTex);
    float4 _DepthOfFieldTex_TexelSize;

    TEXTURE2D_SAMPLER2D(_MyCameraDepth, sampler_MyCameraDepth);

    float2 _BlurDir;
    float _Distance;

    // ----------------------------------------------------------------------------------------
    // Downsample

    float Coc(float4 color) 
    {
        float4 kDecodeDot = float4(1.0, 1 / 255.0, 1 / 65025.0, 1 / 16581375.0);
        float depth = LinearEyeDepth(dot(color, kDecodeDot));
        half coc = (depth - _Distance) / max(depth, 1e-5);
        return saturate(coc);
    }

    half4 FragDownsample(VaryingsDefault i) : SV_Target
    {
        float3 duv = _MainTex_TexelSize.xyx * float3(0.5, 0.5, -0.5);
        float2 uv0 = UnityStereoTransformScreenSpaceTex(i.texcoord - duv.xy);
        float2 uv1 = UnityStereoTransformScreenSpaceTex(i.texcoord - duv.zy);
        float2 uv2 = UnityStereoTransformScreenSpaceTex(i.texcoord + duv.zy);
        float2 uv3 = UnityStereoTransformScreenSpaceTex(i.texcoord + duv.xy);

        // Sample source colors
        half3 color;
        color  = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, uv0).rgb;
        color += SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, uv1).rgb;
        color += SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, uv2).rgb;
        color += SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, uv3).rgb;
        color /= 4.0;

        // Sample CoCs
        float2 uv = UnityStereoTransformScreenSpaceTex(i.texcoord);
        half coc = Coc(SAMPLE_TEXTURE2D(_MyCameraDepth, sampler_MyCameraDepth, uv));

        return half4(color, coc);
    }

    // ----------------------------------------------------------------------------------------
    // Blur

    half4 FragBlur(VaryingsDefault i) : SV_Target
    {
        half4 c0 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoord));
        float2 texelSize = UnityStereoAdjustedTexelSize(_MainTex_TexelSize).xy;
        float2 d = _BlurDir * texelSize * c0.a;

        half4 c1 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoord + d * float2(-3.0, -3.0)));
        half4 c2 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoord + d * float2(-1.5, -1.5)));
        half4 c3 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoord + d * float2( 1.5,  1.5)));
        half4 c4 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoord + d * float2( 3.0,  3.0)));

        half4 color = (c1 * 0.0545) * c1.a + (c2 * 0.2442) * c2.a + (c0 * 0.4026) + (c3 * 0.2442) * c3.a + (c4 * 0.0545) * c4.a;
        return half4(color.rgb, c0.a);
    }

    // ----------------------------------------------------------------------------------------
    // Combine

    half4 FragCombine(VaryingsDefault i) : SV_Target
    {
        half4 dof = SAMPLE_TEXTURE2D(_DepthOfFieldTex, sampler_DepthOfFieldTex, i.texcoordStereo);
        half4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoordStereo);
        half4 result = lerp(color, dof, dof.a);

        return half4(result.rgb, color.a);
    }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        // 0: Downsample
        Pass
        {
            Name "Downsample"

            HLSLPROGRAM
                #pragma vertex VertDefault
                #pragma fragment FragDownsample
            ENDHLSL
        }

        // 1: Blur
        Pass
        {
            Name "Blur"

            HLSLPROGRAM
                #pragma vertex VertDefault
                #pragma fragment FragBlur
            ENDHLSL
        }

        // 2: Combine
        Pass
        {
            Name "Combine"

            HLSLPROGRAM
                #pragma vertex VertDefault
                #pragma fragment FragCombine
            ENDHLSL
        }
    }
}
