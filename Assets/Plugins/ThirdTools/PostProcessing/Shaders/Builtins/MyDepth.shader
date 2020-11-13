Shader "Hidden/MyDepth"
{
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        Pass 
        {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct v2f {
                float4 pos : SV_POSITION;
                float2 depth : TEXCOORD0;
            };

            v2f vert(appdata_base v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.depth = o.pos.zw;
                return o;
            }

            half4 frag(v2f i) : SV_Target {
                float4 kEncodeMul = float4(1.0, 255.0, 65025.0, 16581375.0);
                float kEncodeBit = 1.0 / 255.0;
                float4 enc = kEncodeMul * (i.depth.x / i.depth.y);
                enc = frac(enc);
                enc -= enc.yzww * kEncodeBit;
                return enc;
            }

            ENDCG
        }
    }
}
