using System;
using UnityEngine.Serialization;

namespace UnityEngine.Rendering.PostProcessing
{
    public enum RadialBlurMode
    {
        Normal = 0,
        ChromaticAberration = 1,
        Filter = 2
    }

    [Serializable]
    public sealed class RadialBlurModeParameter : ParameterOverride<RadialBlurMode> { }

    /// <summary>
    /// This class holds settings for the Bloom effect.
    /// </summary>
    [Serializable]
    [PostProcess(typeof(RadialBlurRenderer), "Unity/RadialBlur")]
    public sealed class RadialBlur : PostProcessEffectSettings
    {
        /// <summary>
        /// The mode of the effect.
        /// </summary>
        [DisplayName("Mode"),Tooltip("Mode of the effect.")]
        public RadialBlurModeParameter radialBlurMode = new RadialBlurModeParameter { value = RadialBlurMode.Normal };
        /// <summary>
        /// The strength of the combine.
        /// </summary>
        [Range(0f, 1f), Tooltip("Strength of the combine.")]
        public FloatParameter intensity = new FloatParameter { value = 0f };

        /// <summary>
        /// The offset of the blur.
        /// </summary>
        [Range(0f, 0.3f), Tooltip("Offset of the blur.")]
        public FloatParameter offset = new FloatParameter { value = 0.1f };

        /// <summary>
        /// The center of effect.
        /// </summary>
        [Range(0f, 1f), Tooltip("The center of the effect.")]
        public Vector2Parameter center = new Vector2Parameter { value = Vector2.zero };

        /// <summary>
        /// The luminance of filter.
        /// </summary>
        [Range(0f, 1f), Tooltip("The center of the effect.")]
        public FloatParameter filter = new FloatParameter { value = 0f };

        /// <inheritdoc />
        public override bool IsEnabledAndSupported(PostProcessRenderContext context)
        {
            return enabled.value && (intensity.value > 0.0f);
        }
    }

#if UNITY_2017_1_OR_NEWER
    [UnityEngine.Scripting.Preserve]
#endif
    internal sealed class RadialBlurRenderer : PostProcessEffectRenderer<RadialBlur>
    {
        public override void Init()
        {
            m_RadialBlurId = Shader.PropertyToID("_RadialBlurTemp");
        }

        public override void Render(PostProcessRenderContext context)
        {
            if (m_InternalSpectralLut == null)
            {
                m_InternalSpectralLut = CreateInternalLut();
            }

            var cmd = context.command;
            cmd.BeginSample("RadialBlur");

            context.GetScreenSpaceTemporaryRT(cmd, m_RadialBlurId);

            var mode = settings.radialBlurMode.value;
            var intensity = settings.intensity.value;
            var offset = settings.offset.value;
            var center = settings.center.value;
            var filter = settings.filter.value;

            var sheet = context.propertySheets.Get(context.resources.shaders.radialBlur);
            sheet.properties.SetFloat(ShaderIDs.RadialBlurOffset, offset);
            sheet.properties.SetVector(ShaderIDs.RadialBlurCenter, center);
            sheet.properties.SetFloat(ShaderIDs.RadialBlurFilter, filter);
            sheet.properties.SetTexture(ShaderIDs.RadialBlurSpectralLut, m_InternalSpectralLut);
            cmd.BlitFullscreenTriangle(context.source, m_RadialBlurId, sheet, (int)mode);

            var uberSheet = context.uberSheet;
            string keyword = (mode == RadialBlurMode.Filter) ? "RADIAL_BLUR_FAST" : "RADIAL_BLUR";
            uberSheet.EnableKeyword(keyword);
            var param = new Vector4(center.x, center.y, intensity, 0);
            uberSheet.properties.SetVector(ShaderIDs.RadialBlurParams, param);
            cmd.SetGlobalTexture(ShaderIDs.RadialBlurTex, m_RadialBlurId);

            cmd.EndSample("RadialBlur");

            context.radialBufferNameID = m_RadialBlurId;
        }

        private Texture2D CreateInternalLut()
        {
            Texture2D result = null;
            result = new Texture2D(3, 1, TextureFormat.RGB24, false)
            {
                name = "Chromatic Aberration Spectrum Lookup",
                filterMode = FilterMode.Bilinear,
                wrapMode = TextureWrapMode.Clamp,
                anisoLevel = 0,
                hideFlags = HideFlags.DontSave
            };

            result.SetPixels(new[]
            {
                new Color(1f, 0f, 0f),
                new Color(0f, 1f, 0f),
                new Color(0f, 0f, 1f)
            });

            result.Apply();

            return result;
        }

        public override void Release()
        {
            RuntimeUtilities.Destroy(m_InternalSpectralLut);
            m_InternalSpectralLut = null;
        }

        private int m_RadialBlurId;
        private Texture2D m_InternalSpectralLut;
    }
}
