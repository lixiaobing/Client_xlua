namespace UnityEngine.Rendering.PostProcessing
{
    [ExecuteAlways]
    [DisallowMultipleComponent]
    [AddComponentMenu("Rendering/MyScreenSpaceShadow", 2002)]
    [RequireComponent(typeof(Camera))]
    public class MyScreenSpaceShadow : MonoBehaviour
    {
        public Shader MyShader;
        public float Size = 1.0f;

        private void OnEnable()
        {
            if (MyShader == null)
                return;

            _camera = GetComponent<Camera>();
            _nameID = Shader.PropertyToID("_MyScreenSpaceShadow");

            _material = new Material(MyShader);
            _material.hideFlags = HideFlags.HideAndDontSave;

            CreateRenderTexture();
        }

        private void OnDisable()
        {
            _renderTexture.Release();
            RuntimeUtilities.Destroy(_renderTexture);
            _renderTexture = null;

            Shader.SetGlobalTexture(_nameID, null);

            RuntimeUtilities.Destroy(_material);
            _material = null;

            _camera = null;
            _nameID = -1;
        }

        private void OnPreRender()
        {
            if (_material == null)
                return;

            if (IsSizeChanged())
            {
                CreateRenderTexture();
            }

            Matrix4x4 projectionMatrix = GL.GetGPUProjectionMatrix(_camera.projectionMatrix, false);
            Shader.SetGlobalMatrix("_gCameraToWorld", Matrix4x4.Inverse(projectionMatrix * _camera.worldToCameraMatrix));
            Graphics.Blit(null, _renderTexture, _material, 0);
            Shader.SetGlobalTexture(_nameID, _renderTexture, RenderTextureSubElement.Default);
        }

        private void CreateRenderTexture()
        {
            if (_renderTexture != null)
            {
                _renderTexture.Release();
            }

            var size = GetSize();
            var width  = Mathf.CeilToInt(_camera.pixelWidth  * size);
            var height = Mathf.CeilToInt(_camera.pixelHeight * size);
            _renderTexture = new RenderTexture(width, height, 16, RenderTextureFormat.ARGB32);
            _renderTexture.Create();
        }

        private bool IsSizeChanged()
        {
            float size = GetSize();
            return (_renderTexture.width  != Mathf.CeilToInt(_camera.pixelWidth  * size)) ||
                   (_renderTexture.height != Mathf.CeilToInt(_camera.pixelHeight * size));
        }

        private float GetSize()
        {
            return (Size > 0) ? Size : 1.0f;
        }

        private Camera _camera;
        private RenderTexture _renderTexture;
        private Material _material;

        private int _nameID;
    }
}
