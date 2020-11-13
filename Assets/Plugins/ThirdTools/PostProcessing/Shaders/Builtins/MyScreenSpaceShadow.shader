Shader "Hidden/MyScreenSpaceShadow"
{
    HLSLINCLUDE

    #include "UnityCG.cginc"
    
    sampler2D _MyShadowMap;
    sampler2D _MyCameraDepth;

    float4x4 _gWorldToShadow;
    float4x4 _gCameraToWorld;

    struct Input
    {
        float4 texcoord : TEXCOORD0;
        float4 vertex : POSITION;
    };

    struct Output
    {
        float4 pos : SV_POSITION;
        float2 uv : TEXCOORD0;
    };

    Output Vert(Input i)
    {
        Output o;
        o.pos = UnityObjectToClipPos(i.vertex);
        o.uv = i.texcoord;

        return o;
    }

    half4 Frag(Output i) : SV_Target{
        float cameraDepth = DecodeFloatRGBA(tex2D(_MyCameraDepth, i.uv));

        float4 clipPos = float4(0, 0, cameraDepth, 1);
        clipPos.xy = i.uv * 2 - 1;

        float4 shadowPos = mul(_gWorldToShadow, mul(_gCameraToWorld, clipPos));
        float depth = shadowPos.z / shadowPos.w;
        float2 uv = shadowPos.xy / shadowPos.w;

        float shadowDepth = DecodeFloatRGBA(tex2D(_MyShadowMap, uv * 0.5 + 0.5));

        float shadow = 0;
    #if defined (UNITY_REVERSED_Z)
        shadow = shadowDepth > depth ? 0.5 : 1;
    #else
        shadow = shadowDepth < depth ? 0.5 : 1;
    #endif
        return shadow;
    }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM

            #pragma vertex Vert
            #pragma fragment Frag

            ENDHLSL
        }
    }
}
