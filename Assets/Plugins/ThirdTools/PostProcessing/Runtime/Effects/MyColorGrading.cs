using System;

using UnityEngine.Experimental.Rendering;

namespace UnityEngine.Rendering.PostProcessing
{
    public enum MyGradingMode
    {
        LowDefinitionRange,
        HighDefinitionRange
    }

    [Serializable]
    public sealed class MyGradingModeParameter : ParameterOverride<MyGradingMode> { }

    [Serializable]
    [PostProcess(typeof(MyColorGradingRenderer), "Unity/My Color Grading")]
    public sealed class MyColorGrading : PostProcessEffectSettings
    {
        [DisplayName("Mode"), Tooltip("Select a color grading mode that fits your dynamic range and workflow. Use HDR if your camera is set to render in HDR and your target platform supports it. Use LDR for low-end mobiles or devices that don't support HDR.")]
        public MyGradingModeParameter gradingMode = new MyGradingModeParameter { value = MyGradingMode.HighDefinitionRange };

        [DisplayName("Post-exposure (EV)"), Tooltip("Adjusts the overall exposure of the scene in EV units. This is applied after the HDR effect and right before tonemapping so it won't affect previous effects in the chain.")]
        public FloatParameter postExposure = new FloatParameter { value = 0f };
    }

    [UnityEngine.Scripting.Preserve]
    internal sealed class MyColorGradingRenderer : PostProcessEffectRenderer<MyColorGrading>
    {
        enum Pass
        {
            LutGenLDR,
            LutGenHDR
        }

        RenderTexture m_InternalLdrLut;
        const int k_Lut2DSize = 32;

        public override void Render(PostProcessRenderContext context)
        {
            var gradingMode = settings.gradingMode.value;

            if (gradingMode == MyGradingMode.HighDefinitionRange)
                RenderHDRPipeline2D(context);
            else
                RenderLDRPipeline2D(context);
        }

        void RenderHDRPipeline2D(PostProcessRenderContext context)
        {
            {
                CheckInternalStripLut();

                // Lut setup
                var lutSheet = context.propertySheets.Get(context.resources.shaders.myLut2DBaker);
                lutSheet.ClearKeywords();

                lutSheet.properties.SetVector(ShaderIDs.Lut2D_Params, new Vector4(k_Lut2DSize, 0.5f / (k_Lut2DSize * k_Lut2DSize), 0.5f / k_Lut2DSize, k_Lut2DSize / (k_Lut2DSize - 1f)));

                // Generate the lut
                context.command.BeginSample("HdrColorGradingLut2D");
                context.command.BlitFullscreenTriangle(BuiltinRenderTextureType.None, m_InternalLdrLut, lutSheet, (int)Pass.LutGenHDR);
                context.command.EndSample("HdrColorGradingLut2D");
            }

            var lut = m_InternalLdrLut;
            var uberSheet = context.uberSheet;
            uberSheet.EnableKeyword("COLOR_GRADING_HDR_2D");
            uberSheet.properties.SetVector(ShaderIDs.Lut2D_Params, new Vector3(1f / lut.width, 1f / lut.height, lut.height - 1f));
            uberSheet.properties.SetTexture(ShaderIDs.Lut2D, lut);
            uberSheet.properties.SetFloat(ShaderIDs.PostExposure, RuntimeUtilities.Exp2(settings.postExposure.value));
        }

        void RenderLDRPipeline2D(PostProcessRenderContext context)
        {
            {
                CheckInternalStripLut();

                // Lut setup
                var lutSheet = context.propertySheets.Get(context.resources.shaders.myLut2DBaker);
                lutSheet.ClearKeywords();

                lutSheet.properties.SetVector(ShaderIDs.Lut2D_Params, new Vector4(k_Lut2DSize, 0.5f / (k_Lut2DSize * k_Lut2DSize), 0.5f / k_Lut2DSize, k_Lut2DSize / (k_Lut2DSize - 1f)));

                // Generate the lut
                context.command.BeginSample("LdrColorGradingLut2D");
                context.command.BlitFullscreenTriangle(BuiltinRenderTextureType.None, m_InternalLdrLut, lutSheet, (int)Pass.LutGenLDR);
                context.command.EndSample("LdrColorGradingLut2D");
            }

            var lut = m_InternalLdrLut;
            var uberSheet = context.uberSheet;
            uberSheet.EnableKeyword("COLOR_GRADING_LDR_2D");
            uberSheet.properties.SetVector(ShaderIDs.Lut2D_Params, new Vector3(1f / lut.width, 1f / lut.height, lut.height - 1f));
            uberSheet.properties.SetTexture(ShaderIDs.Lut2D, lut);
        }

        void CheckInternalStripLut()
        {
            if (m_InternalLdrLut == null || !m_InternalLdrLut.IsCreated())
            {
                RuntimeUtilities.Destroy(m_InternalLdrLut);

                var format = GetLutFormat();
                m_InternalLdrLut = new RenderTexture(k_Lut2DSize * k_Lut2DSize, k_Lut2DSize, 0, format, RenderTextureReadWrite.Linear)
                {
                    name = "Color Grading Strip Lut",
                    hideFlags = HideFlags.DontSave,
                    filterMode = FilterMode.Bilinear,
                    wrapMode = TextureWrapMode.Clamp,
                    anisoLevel = 0,
                    autoGenerateMips = false,
                    useMipMap = false
                };
                m_InternalLdrLut.Create();
            }
        }

        static bool IsRenderTextureFormatSupportedForLinearFiltering(RenderTextureFormat format)
        {
            var gFormat = GraphicsFormatUtility.GetGraphicsFormat(format, RenderTextureReadWrite.Linear);
            return SystemInfo.IsFormatSupported(gFormat, FormatUsage.Linear);
        }

        static RenderTextureFormat GetLutFormat()
        {
            var format = RenderTextureFormat.ARGBHalf;

            if (!IsRenderTextureFormatSupportedForLinearFiltering(format))
            {
                format = RenderTextureFormat.ARGB2101010;

                if (!IsRenderTextureFormatSupportedForLinearFiltering(format))
                    format = RenderTextureFormat.ARGB32;
            }

            return format;
        }

        public override void Release()
        {
            RuntimeUtilities.Destroy(m_InternalLdrLut);
            m_InternalLdrLut = null;
        }
    }
}
