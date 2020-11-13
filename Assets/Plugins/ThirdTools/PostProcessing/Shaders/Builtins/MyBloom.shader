Shader "Hidden/PostProcessing/MyBloom"
{
    HLSLINCLUDE
        
    #include "../StdLib.hlsl"
    #include "../Colors.hlsl"
    #include "../Sampling.hlsl"

    TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
    TEXTURE2D_SAMPLER2D(_MyBloomTex, sampler_MyBloomTex);

    float4 _MainTex_TexelSize;
    float2 _BlurDir;
    float  _FilterThreshold;
    float  _FilterScaler;
    float  _BloomSaturation;

    // ----------------------------------------------------------------------------------------
    // Prefilter

    half4 FragPrefilter(VaryingsDefault i) : SV_Target
    {
        half4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoordStereo);
        color = max(color, 0.0);
        color.rgb = _FilterScaler * (color.rgb - _FilterThreshold);
        half3 luminance = Luminance(color.rgb).xxx;
        color.rgb = lerp(luminance, color.rgb, _BloomSaturation);
        color = color * color.a;
        color.rgb = max(color.rgb, 0.0);
        return color;
    }

    // ----------------------------------------------------------------------------------------
    // Downsample

    half4 FragDownsample(VaryingsDefault i) : SV_Target
    {
        half4 color = DownsampleBox4Tap(TEXTURE2D_PARAM(_MainTex, sampler_MainTex), i.texcoord, UnityStereoAdjustedTexelSize(_MainTex_TexelSize).xy);
        return color;
    }

    // ----------------------------------------------------------------------------------------
    // Upsample & combine

    half4 Combine(half4 bloom, float2 uv)
    {
        half4 color = SAMPLE_TEXTURE2D(_MyBloomTex, sampler_MyBloomTex, uv);
        return bloom + color;
    }

    half4 FragUpsample(VaryingsDefault i) : SV_Target
    {
        half4 bloom = UpsampleBox(TEXTURE2D_PARAM(_MainTex, sampler_MainTex), i.texcoord, UnityStereoAdjustedTexelSize(_MainTex_TexelSize).xy, 0.0);
        return Combine(bloom, i.texcoordStereo);
    }

    // ----------------------------------------------------------------------------------------
    // Blur

    half4 FragBlur(VaryingsDefault i) : SV_Target
    {
        float2 texelSize = UnityStereoAdjustedTexelSize(_MainTex_TexelSize).xy;
        float2 d = _BlurDir * texelSize;
        half4 t1 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoordStereo + d * float2(-2.0, -2.0)));
        half4 t2 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoordStereo + d * float2(-1.0, -1.0)));
        half4 t3 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoordStereo + d * float2(0.0,  0.0)));
        half4 t4 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoordStereo + d * float2(1.0,  1.0)));
        half4 t5 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UnityStereoTransformScreenSpaceTex(i.texcoordStereo + d * float2(2.0,  2.0)));

        half4 color = (t1 * 0.0545) + (t2 * 0.2442) + (t3 * 0.4026) + (t4 * 0.2442) + (t5 * 0.0545);
        return color;
    }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        // 0: Downsample
        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragPrefilter

            ENDHLSL
        }

        // 1: Prefilter
        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragDownsample

            ENDHLSL
        }

        // 2: Upsample
        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragUpsample

            ENDHLSL
        }

        // 3: Blur
        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragBlur

            ENDHLSL
        }
    }
}
