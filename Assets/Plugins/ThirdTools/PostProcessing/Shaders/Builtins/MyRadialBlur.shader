Shader "Hidden/PostProcessing/MyRadialBlur"
{
    HLSLINCLUDE

    #include "../StdLib.hlsl"

    TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
    uniform float4 _MyRadialBlurParam;

    /* From Z2
    float4 FragTest(VaryingsDefault i) : SV_Target
    {
        float2 delta = _RadialBlurCenter.xy - i.texcoordStereo.xy;
        float4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoordStereo.xy);
        
        float _radius = 0.0;
        float _gradient = 0.593;
        float _interval = 0.493;

        float3 x00 = (0.0).xxx;
        float3 x01 = (0.0).xxx;
        float3 x02 = (0.0).xxx;
        float3 x03 = (0.0).xxx;
        float3 x04 = (0.0).xxx;
        float2 x06 = (0.0).xx;
        float  x11 = 0.0;
        float  x16 = 0.0;

        x00.xy = _RadialBlurCenter.xy - i.texcoordStereo.xy;
        x01.x = saturate((length(x00.xy) - _radius) * _gradient);
        x06.xy = 0.3334 * _interval * x00.xy;
        x01.xy = x01.xx * x06.xy;
        x02.xy = max(1.0 - abs(x00.xy), 0.0);
        x16 = x02.x * x02.y;
        x16 = (x16 * 0.3334) / (x16 * 0.6669 + x16 * 0.3334 + 1.0);
        x04.x = (x16 * 0.6669) / (x16 * 0.6669 + 1.0);
        x11 = 1.0;

        x01.xy = x11 * x01.xy + i.texcoordStereo.xy;
        x00 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, x01.xy);
        x01.xy = 2.0 * x02.xy + i.texcoordStereo.xy;
        x03 = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, x01.xy);
        x01 = x00 - color;
        x01 = (x04.xxx * x01) + color;
        x04 = x03 - x01;

        return float4(x16 * x04.xyz + x01.xyz, color.a);
    }
    */

    // UV distort
    inline float2 UVDistort(float2 uv, float offset)
    {
        float2 distance = uv - _MyRadialBlurParam.xy;
        float scale = 1.0 - offset * length(distance);
        return scale * distance + _MyRadialBlurParam.xy;
    }

    // Frag
    float4 Frag(VaryingsDefault i) : SV_Target
    {
        int samples = 3;
        float4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoordStereo.xy);
        float2 delta = (_MyRadialBlurParam.xy - i.texcoordStereo.xy) * _MyRadialBlurParam.z / float(samples);
        float distort = length(delta) * samples;

        float4 r = (0.0).xxxx;
        float2 uv = i.texcoordStereo.xy;
        float offset = 0.0;

        for (int i = 0; i < samples; i++)
        {
            float4 s = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, UVDistort(uv, offset));
            float factor = float(samples - i) / samples;
            r = pow(factor, 3) * (s - r) + r;

            uv = uv + delta;
            offset = offset + distort;
        }

        return float4(r.xyz, color.a);
    }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment Frag

            ENDHLSL
        }
    }
}
