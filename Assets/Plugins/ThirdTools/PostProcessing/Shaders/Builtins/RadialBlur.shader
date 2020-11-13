Shader "Hidden/PostProcessing/RadialBlur"
{
    HLSLINCLUDE

        #include "../StdLib.hlsl"
        #include "../Colors.hlsl"

        TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
        TEXTURE2D_SAMPLER2D(_RadialBlurSpectralLut, sampler_RadialBlurSpectralLut);
        uniform float _RadialBlurOffset;
        uniform float _RadialBlurFilter;
        uniform float2 _RadialBlurCenter;

        // Normal
        float4 FragNormal(VaryingsDefault i) : SV_Target
        {
            int samples = 30;
            float diff = 1.0 / float(samples);
            float2 delta = _RadialBlurCenter.xy - i.texcoordStereo.xy;
            delta = delta * diff * _RadialBlurOffset;

            float2 coord = i.texcoordStereo.xy;
            float4 color = (0.0).xxxx;
            for (int i = 0; i < samples; i++)
            {
                float4 tex = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, coord);
                color += tex * diff;
                coord += delta;
            }

            return color;
        }
        
        // Chromatic Aberration
        float4 FragChromaticAberration(VaryingsDefault i) : SV_Target
        {
            int samples = 50;
            float diff = 1.0 / float(samples);
            float2 delta = _RadialBlurCenter.xy - i.texcoordStereo.xy;
            delta = delta * diff * _RadialBlurOffset;

            float2 coord = i.texcoordStereo.xy;
            float4 sum = (0.0).xxxx;
            float4 filterSum = (0.0).xxxx;
            for (int i = 0; i < samples; i++)
            {
                half t = i * diff;
                float4 tex = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, coord);
                float4 filter = SAMPLE_TEXTURE2D_LOD(_RadialBlurSpectralLut, sampler_RadialBlurSpectralLut, float2(t, 0.0), 0);
                filter.a = 1.0;

                sum += tex * filter;
                filterSum += filter;
                coord += delta;
            }

            return sum / filterSum;
        }

        // Filter
        float4 FragFilter(VaryingsDefault i) : SV_Target
        {
            int samples = 7;
            float diff = 1.0 / float(samples);
            float2 delta = _RadialBlurCenter.xy - i.texcoordStereo.xy;
            delta = delta * diff * _RadialBlurOffset;

            float2 coord = i.texcoordStereo.xy;
            float4 color = (0.0).xxxx;
            float filterSum = 0;
            for (int i = 0; i < samples; i++)
            {
                float4 tex = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, coord);
                float filter = step(_RadialBlurFilter, Luminance(tex));

                color += tex * filter * pow(0.5, i);
                filterSum += filter;
                coord += delta;
            }

            return color / filterSum;
        }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragNormal

            ENDHLSL
        }

        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragChromaticAberration

            ENDHLSL
        }

        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragFilter

            ENDHLSL
        }
    }
}
