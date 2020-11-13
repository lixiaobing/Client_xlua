namespace UnityEngine.Rendering.PostProcessing
{
    [ExecuteAlways]
    [DisallowMultipleComponent]
    [AddComponentMenu("Rendering/MyDepth", 2000)]
    [RequireComponent(typeof(Camera))]
    public class MyDepth : MonoBehaviour
    {
        public Shader MyShader;
        public float Size = 1.0f;

        private void OnEnable()
        {
            _originalCamera = GetComponent<Camera>();
            _nameID = Shader.PropertyToID("_MyCameraDepth");

            if (_camera != null)
                return;

            _camera = CopyCamera(_originalCamera);

            CreateRenderTexture();
        }

        private void OnDisable()
        {
            RuntimeUtilities.Destroy(_camera.gameObject);
            _camera = null;

            _renderTexture.Release();
            RuntimeUtilities.Destroy(_renderTexture);
            _renderTexture = null;

            Shader.SetGlobalTexture(_nameID, null);

            _originalCamera = null;
            _nameID = -1;
        }

        private void OnPreRender()
        {
            if (_camera == null)
                return;

            if (MyShader == null)
                return;

            if (IsSizeChanged())
            {
                CreateRenderTexture();
            }

            _camera.targetTexture = _renderTexture;
            _camera.RenderWithShader(MyShader, "");
            Shader.SetGlobalTexture(_nameID, _renderTexture, RenderTextureSubElement.Default);
        }

        private Camera CopyCamera(Camera old)
        {
            GameObject obj = new GameObject();
            obj.name = "depth";
            obj.transform.SetParent(transform, false);
            obj.hideFlags = HideFlags.HideAndDontSave;

            Camera camera = obj.AddComponent<Camera>();
            camera.CopyFrom(old);

            camera.depth = camera.depth - 1;
            camera.clearFlags = CameraClearFlags.SolidColor;
            camera.backgroundColor = new Color(0, 0, 0, 0);
            camera.renderingPath = RenderingPath.Forward;
            camera.useOcclusionCulling = true;
            camera.allowHDR = false;
            camera.allowMSAA = false;

            camera.enabled = false;

            return camera;
        }

        private void CreateRenderTexture()
        {
            if (_renderTexture != null)
            {
                _renderTexture.Release();
            }

            var size = GetSize();
            var width = Mathf.CeilToInt(_originalCamera.pixelWidth * size);
            var height = Mathf.CeilToInt(_originalCamera.pixelHeight * size);
            _renderTexture = new RenderTexture(width, height, 16, RenderTextureFormat.ARGB32);
            _renderTexture.Create();
        }

        private bool IsSizeChanged()
        {
            float size = GetSize();
            return (_renderTexture.width  != Mathf.CeilToInt(_originalCamera.pixelWidth * size)) ||
                   (_renderTexture.height != Mathf.CeilToInt(_originalCamera.pixelHeight * size));
        }

        private float GetSize()
        {
            return (Size > 0) ? Size : 1.0f;
        }

        private Camera _originalCamera;
        private Camera _camera;
        private RenderTexture _renderTexture;

        private int _nameID;
    }
}
