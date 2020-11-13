using System;

namespace UnityEngine.Rendering.PostProcessing
{
    /// <summary>
    /// This class holds settings for the Depth of Field effect.
    /// </summary>
    [Serializable]
    [PostProcess(typeof(MyDepthOfFieldRenderer), "Unity/My Depth of Field", false)]
    public sealed class MyDepthOfField : PostProcessEffectSettings
    {
        /// <summary>
        /// The distance to the point of focus.
        /// </summary>
        [Min(0.1f), Tooltip("Distance to the point of focus.")]
        public FloatParameter focusDistance = new FloatParameter { value = 10f };

        /// <inheritdoc />
        public override bool IsEnabledAndSupported(PostProcessRenderContext context)
        {
            return enabled.value;
        }
    }

    [UnityEngine.Scripting.Preserve]
    internal sealed class MyDepthOfFieldRenderer : PostProcessEffectRenderer<MyDepthOfField>
    {
        enum Pass
        {
            Downsample,
            Blur,
            Combine
        }

        public MyDepthOfFieldRenderer()
        {
        }

        public override void Init()
        {
            _dof1 = Shader.PropertyToID("_dof1");
            _dof2 = Shader.PropertyToID("_dof2");
        }

        public override void Render(PostProcessRenderContext context)
        {
            var sheet = context.propertySheets.Get(context.resources.shaders.myDepthOfField);
            sheet.properties.Clear();
            sheet.properties.SetFloat(ShaderIDs.Distance, settings.focusDistance);

            var cmd = context.command;
            cmd.BeginSample("MyDepthOfField");

            //Downsample
            context.GetScreenSpaceTemporaryRT(cmd, _dof1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, context.width / 2, context.height / 2);
            context.GetScreenSpaceTemporaryRT(cmd, _dof2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, context.width / 2, context.height / 2);
            cmd.BlitFullscreenTriangle(context.source, _dof1, sheet, (int)Pass.Downsample);

            //Blur
            sheet.properties.SetVector(ShaderIDs.BlurDir, new Vector2(1.0f, 0.0f));
            cmd.BlitFullscreenTriangle(_dof1, _dof2, sheet, (int)Pass.Blur);
            sheet.properties.SetVector(ShaderIDs.BlurDir, new Vector2(0.0f, 1.0f));
            cmd.BlitFullscreenTriangle(_dof2, _dof1, sheet, (int)Pass.Blur);

            //Combine
            cmd.SetGlobalTexture(ShaderIDs.DepthOfFieldTex, _dof1);
            cmd.BlitFullscreenTriangle(context.source, context.destination, sheet, (int)Pass.Combine);

            // Cleanup
            cmd.ReleaseTemporaryRT(_dof1);
            cmd.ReleaseTemporaryRT(_dof1);

            cmd.EndSample("MyDepthOfField");
        }

        public override void Release()
        {
        }

        private int _dof1;
        private int _dof2;
    }
}
