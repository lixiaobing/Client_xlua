Shader "Hidden/PostProcessing/MyLut2DBaker"
{
    HLSLINCLUDE

        #pragma target 3.0
        #include "../StdLib.hlsl"
        #include "../Colors.hlsl"
        #include "../ACES.hlsl"

        TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
        float4 _Lut2D_Params;

        //
        // Tonemapping
        //
        float3 Tonemapping(float3 color)
        {
            float a = 278.5085;
            float b = 10.7772;
            float c = 293.6045;
            float d = 88.7122;
            float e = 80.6889;

            color = (color * (a * color + b)) / (color * (c * color + d) + e);
            return color;
        }

        //
        // LDR Grading process
        //
        float3 ColorGradeLDR(float3 colorLinear)
        {
            colorLinear = Tonemapping(colorLinear);
            return saturate(colorLinear);
        }

        float4 FragLDR(VaryingsDefault i) : SV_Target
        {
            float3 colorLinear = GetLutStripValue(i.texcoordStereo, _Lut2D_Params);
            float3 graded = ColorGradeLDR(colorLinear);
            return float4(graded, 1.0);
        }

        //
        // HDR Grading process
        //
        float3 ColorGradeHDR(float3 colorLutSpace)
        {
            float3 colorLinear = LUT_SPACE_DECODE(colorLutSpace);
            colorLinear = Tonemapping(colorLinear);
            return colorLinear;
        }

        float4 FragHDR(VaryingsDefault i) : SV_Target
        {
            float3 colorLutSpace = GetLutStripValue(i.texcoord, _Lut2D_Params);
            float3 graded = ColorGradeHDR(colorLutSpace);
            return float4(max(graded, 0.0), 1.0);
        }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragLDR

            ENDHLSL
        }

        Pass
        {
            HLSLPROGRAM

                #pragma vertex VertDefault
                #pragma fragment FragHDR

            ENDHLSL
        }
    }
}
