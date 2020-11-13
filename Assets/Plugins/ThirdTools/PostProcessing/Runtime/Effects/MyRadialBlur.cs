using System;
using UnityEngine.Serialization;

namespace UnityEngine.Rendering.PostProcessing
{
    /// <summary>
    /// This class holds settings for the Bloom effect.
    /// </summary>
    [Serializable]
    [PostProcess(typeof(MyRadialBlurRenderer), "Unity/My Radial Blur")]
    public sealed class MyRadialBlur : PostProcessEffectSettings
    {
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
    }

    [UnityEngine.Scripting.Preserve]
    internal sealed class MyRadialBlurRenderer : PostProcessEffectRenderer<MyRadialBlur>
    {
        public override void Init()
        {
            _myRadialBlurId = Shader.PropertyToID("_myRadialBlurId");
        }

        public override void Render(PostProcessRenderContext context)
        {
            var cmd = context.command;
            cmd.BeginSample("MyRadialBlur");

            context.GetScreenSpaceTemporaryRT(cmd, _myRadialBlurId, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, context.width, context.height);

            var offset = settings.offset.value;
            var center = settings.center.value;
            var param = new Vector4(center.x, center.y, offset, 0.0f);

            var sheet = context.propertySheets.Get(context.resources.shaders.myRadialBlur);
            sheet.properties.SetVector(ShaderIDs.MyRadialBlurParam, param);
            cmd.BlitFullscreenTriangle(context.source, _myRadialBlurId, sheet, 0);
            param.z = param.z / 2.0f;
            sheet.properties.SetVector(ShaderIDs.MyRadialBlurParam, param);
            cmd.BlitFullscreenTriangle(_myRadialBlurId, context.source, sheet, 0);

            cmd.ReleaseTemporaryRT(_myRadialBlurId);

            cmd.EndSample("MyRadialBlur");
        }

        public override void Release()
        {
        }

        private int _myRadialBlurId;
    }
}
