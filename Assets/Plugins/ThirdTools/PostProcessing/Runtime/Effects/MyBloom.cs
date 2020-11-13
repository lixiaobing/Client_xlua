using System;
using UnityEngine.Serialization;

namespace UnityEngine.Rendering.PostProcessing
{
    /// <summary>
    /// This class holds settings for the MyBloom effect.
    /// </summary>
    [Serializable]
    [PostProcess(typeof(MyBloomRenderer), "Unity/My Bloom")]
    public sealed class MyBloom : PostProcessEffectSettings
    {
        [Range(0f, 1f), Tooltip("Threshold")]
        public FloatParameter threshold = new FloatParameter { value = 0.3f };

        [Range(0f, 3f), Tooltip("Saturation")]
        public FloatParameter saturation = new FloatParameter { value = 1.0f };

        [Tooltip("Scaler")]
        public FloatParameter scaler = new FloatParameter { value = 1.0f };

        [Range(0f, 1f), Tooltip("intensity")]
        public FloatParameter intensity = new FloatParameter { value = 0.1f };

        public override bool IsEnabledAndSupported(PostProcessRenderContext context)
        {
            return enabled.value
                && intensity.value > 0f;
        }
    }

    [UnityEngine.Scripting.Preserve]
    internal sealed class MyBloomRenderer : PostProcessEffectRenderer<MyBloom>
    {
        enum Pass
        {
            Prefilter,
            Downsample,
            Upsample,
            Blur,
        }

        public override void Init()
        {
            _downsample1 = Shader.PropertyToID("_DownSample1");
            _downsample2 = Shader.PropertyToID("_DownSample2");

            _blur1_1 = Shader.PropertyToID("_Blur1_1");
            _blur1_2 = Shader.PropertyToID("_Blur1_2");
            _blur2_1 = Shader.PropertyToID("_Blur2_1");
            _blur2_2 = Shader.PropertyToID("_Blur2_2");
            _blur3_1 = Shader.PropertyToID("_Blur3_1");
            _blur3_2 = Shader.PropertyToID("_Blur3_2");
            _blur4_1 = Shader.PropertyToID("_Blur4_1");
            _blur4_2 = Shader.PropertyToID("_Blur4_2");
            _blur5_1 = Shader.PropertyToID("_Blur5_1");
            _blur5_2 = Shader.PropertyToID("_Blur5_2");
            _blur6_1 = Shader.PropertyToID("_Blur6_1");
            _blur6_2 = Shader.PropertyToID("_Blur6_2");
            _blur7_1 = Shader.PropertyToID("_Blur7_1");
        }

        public override void Render(PostProcessRenderContext context)
        {
            var cmd = context.command;
            cmd.BeginSample("MyBloom");

            var sheet = context.propertySheets.Get(context.resources.shaders.myBloom);

            var width = Mathf.FloorToInt(context.width / 2.0f);
            var height = Mathf.FloorToInt(context.height / 2.0f);
            context.GetScreenSpaceTemporaryRT(cmd, _downsample1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, width, height);
            context.GetScreenSpaceTemporaryRT(cmd, _downsample2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, width, height);
            cmd.BlitFullscreenTriangle(context.source, _downsample1, sheet, (int)Pass.Downsample);

            //Blur
            sheet.properties.SetVector(ShaderIDs.BlurDir, new Vector2(1.0f, 0.0f));
            cmd.BlitFullscreenTriangle(_downsample1, _downsample2, sheet, (int)Pass.Blur);
            sheet.properties.SetVector(ShaderIDs.BlurDir, new Vector2(0.0f, 1.0f));
            cmd.BlitFullscreenTriangle(_downsample2, _downsample1, sheet, (int)Pass.Blur);

            // Filter
            sheet.properties.SetFloat(ShaderIDs.FilterThreshold, settings.threshold);
            sheet.properties.SetFloat(ShaderIDs.FilterScaler, settings.scaler);
            sheet.properties.SetFloat(ShaderIDs.BloomSaturation, settings.saturation);
            cmd.BlitFullscreenTriangle(_downsample1, _downsample2, sheet, (int)Pass.Prefilter);

            // Downsample
            context.GetScreenSpaceTemporaryRT(cmd, _blur1_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 512, 512);
            cmd.BlitFullscreenTriangle(_downsample2, _blur1_1, sheet, (int)Pass.Downsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur2_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 256, 256);
            cmd.BlitFullscreenTriangle(_blur1_1, _blur2_1, sheet, (int)Pass.Downsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur3_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 128, 128);
            cmd.BlitFullscreenTriangle(_blur2_1, _blur3_1, sheet, (int)Pass.Downsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur4_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 64, 64);
            cmd.BlitFullscreenTriangle(_blur3_1, _blur4_1, sheet, (int)Pass.Downsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur5_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 32, 32);
            cmd.BlitFullscreenTriangle(_blur4_1, _blur5_1, sheet, (int)Pass.Downsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur6_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 16, 16);
            cmd.BlitFullscreenTriangle(_blur5_1, _blur6_1, sheet, (int)Pass.Downsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur7_1, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 8, 8);
            cmd.BlitFullscreenTriangle(_blur6_1, _blur7_1, sheet, (int)Pass.Downsample);

            // Upsample
            context.GetScreenSpaceTemporaryRT(cmd, _blur6_2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 16, 16);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur6_1);
            cmd.BlitFullscreenTriangle(_blur7_1, _blur6_2, sheet, (int)Pass.Upsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur5_2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 32, 32);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur5_1);
            cmd.BlitFullscreenTriangle(_blur6_2, _blur5_2, sheet, (int)Pass.Upsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur4_2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 64, 64);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur4_1);
            cmd.BlitFullscreenTriangle(_blur5_2, _blur4_2, sheet, (int)Pass.Upsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur3_2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 128, 128);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur3_1);
            cmd.BlitFullscreenTriangle(_blur4_2, _blur3_2, sheet, (int)Pass.Upsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur2_2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 256, 256);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur2_1);
            cmd.BlitFullscreenTriangle(_blur3_2, _blur2_2, sheet, (int)Pass.Upsample);
            context.GetScreenSpaceTemporaryRT(cmd, _blur1_2, 0, context.sourceFormat, RenderTextureReadWrite.Default, FilterMode.Bilinear, 512, 512);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur1_1);
            cmd.BlitFullscreenTriangle(_blur2_2, _blur1_2, sheet, (int)Pass.Upsample);

            var uberSheet = context.uberSheet;
            uberSheet.EnableKeyword("MY_BLOOM");
            uberSheet.properties.SetFloat(ShaderIDs.MyBloomIntensity, settings.intensity);
            cmd.SetGlobalTexture(ShaderIDs.MyBloomTex, _blur1_2);

            // Cleanup
            cmd.ReleaseTemporaryRT(_downsample1);
            cmd.ReleaseTemporaryRT(_downsample2);

            cmd.ReleaseTemporaryRT(_blur1_1);
            cmd.ReleaseTemporaryRT(_blur2_1);
            cmd.ReleaseTemporaryRT(_blur3_1);
            cmd.ReleaseTemporaryRT(_blur4_1);
            cmd.ReleaseTemporaryRT(_blur5_1);
            cmd.ReleaseTemporaryRT(_blur6_1);
            cmd.ReleaseTemporaryRT(_blur7_1);

            cmd.ReleaseTemporaryRT(_blur6_2);
            cmd.ReleaseTemporaryRT(_blur5_2);
            cmd.ReleaseTemporaryRT(_blur4_2);
            cmd.ReleaseTemporaryRT(_blur3_2);
            cmd.ReleaseTemporaryRT(_blur2_2);
            
            cmd.EndSample("MyBloom");
            context.myBloomBufferNameID = _blur1_2;
        }

        private int _downsample1;
        private int _downsample2;

        private int _blur1_1;
        private int _blur1_2;
        private int _blur2_1;
        private int _blur2_2;
        private int _blur3_1;
        private int _blur3_2;
        private int _blur4_1;
        private int _blur4_2;
        private int _blur5_1;
        private int _blur5_2;
        private int _blur6_1;
        private int _blur6_2;
        private int _blur7_1;
    }
}
