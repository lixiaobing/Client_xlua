Shader "Hidden/MyDistort"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
    }

    CGINCLUDE

    #include "UnityCG.cginc"

    struct appdata
    {
        float4 vertex : POSITION;
        float2 uv : TEXCOORD0;
    };

    struct v2f
    {
        float2 uv : TEXCOORD0;
        float4 vertex : SV_POSITION;
    };

    sampler2D _MainTex;
    float4 _MainTex_ST;

    sampler2D _MyDistort;

    v2f vert(appdata v)
    {
        v2f o;
        o.vertex = UnityObjectToClipPos(v.vertex);
        o.uv = TRANSFORM_TEX(v.uv, _MainTex);
        return o;
    }

    fixed4 frag(v2f i) : SV_Target
    {
        fixed3 distort = tex2D(_MyDistort, i.uv).xyz;
        distort.xy = distort.xy * 2.0 - 1;
        distort.xy *= distort.z;
        fixed4 col = tex2D(_MainTex, i.uv + distort.xy);
        return col;
    }

    ENDCG

    SubShader
    {
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM

                #pragma vertex vert
                #pragma fragment frag

            ENDCG
        }
    }
}
