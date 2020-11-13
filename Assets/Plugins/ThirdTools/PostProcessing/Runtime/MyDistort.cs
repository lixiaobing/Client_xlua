using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UnityEngine.Rendering.PostProcessing
{
    [ExecuteAlways]
    [DisallowMultipleComponent]
    [AddComponentMenu("Rendering/MyDistort", 2001)]
    [RequireComponent(typeof(Camera))]
    public class MyDistort : MonoBehaviour
    {
        public LayerMask Layer;
        public Shader Combine;

        public MyDistort()
        {
            _inited = false;
        }

        private void OnEnable()
        {
            if (_inited)
                return;

            _originalCamera = GetComponent<Camera>();
            _nameID = Shader.PropertyToID("_MyDistort");
            _sheet = CreatePropertySheet(Combine);

            CreateRenderTexture(false);
            _camera = CopyCamera(_originalCamera);

            _originalCamera.SetTargetBuffers(_sceneRT.colorBuffer, _sceneRT.depthBuffer);
            _camera.SetTargetBuffers(_distortRT.colorBuffer, _sceneRT.depthBuffer);

            _inited = true;
        }

        private void OnDisable()
        {
            if (!_inited)
                return;

            RuntimeUtilities.Destroy(_camera.gameObject);
            _camera = null;

            _originalCamera.targetTexture = null;
            _originalCamera = null;

            _sceneRT.Release();
            _sceneRT = null;

            _distortRT.Release();
            _distortRT = null;

            _sheet.Release();
            _sheet = null;

            Shader.SetGlobalTexture(_nameID, null);

            _nameID = -1;
            _width = -1;
            _height = -1;

            _inited = false;
        }

        private void OnPostRender()
        {
            if (!_inited)
                return;

            if (_sheet == null)
                return;

            if (IsSizeChanged())
            {
                CreateRenderTexture(true);
                _originalCamera.SetTargetBuffers(_sceneRT.colorBuffer, _sceneRT.depthBuffer);
                _camera.SetTargetBuffers(_distortRT.colorBuffer, _sceneRT.depthBuffer);
            }

            RenderTexture rt = RenderTexture.active;
            RenderTexture.active = _distortRT;
            GL.Clear(true, true, new Color(0.5f, 0.5f, 0, 0));
            RenderTexture.active = rt;

            _camera.cullingMask = Layer;
            _camera.Render();
            Shader.SetGlobalTexture(_nameID, _distortRT, RenderTextureSubElement.Color);
        }

        private void OnRenderImage(RenderTexture src, RenderTexture dst)
        {
            Graphics.Blit(_sceneRT, dst, _sheet.material);
        }

        private Camera CopyCamera(Camera old)
        {
            GameObject obj = new GameObject();
            obj.name = "distort";
            obj.transform.SetParent(transform, false);
            obj.hideFlags = HideFlags.HideAndDontSave;

            Camera camera = obj.AddComponent<Camera>();
            camera.CopyFrom(old);

            camera.depth = old.depth + 1;
            camera.clearFlags = CameraClearFlags.Nothing;
            camera.enabled = false;

            return camera;
        }

        private void CreateRenderTexture(bool clear)
        {
            if (clear)
            {
                _sceneRT.Release();
                _distortRT.Release();
            }

            _width = _originalCamera.pixelWidth;
            _height = _originalCamera.pixelHeight;

            _sceneRT = new RenderTexture(_width, _height, 24, RenderTextureFormat.Default);
            _sceneRT.name = "SceneRT";
            _sceneRT.Create();

            _distortRT = new RenderTexture(_width, _height, 0, RenderTextureFormat.Default);
            _distortRT.name = "DistortRT";
            _distortRT.Create();
        }

        public PropertySheet CreatePropertySheet(Shader shader)
        {
            if (shader == null)
                return null;

            var material = new Material(shader)
            {
                name = shader.name,
                hideFlags = HideFlags.DontSave
            };

            PropertySheet sheet = new PropertySheet(material);
            return sheet;
        }

        private bool IsSizeChanged()
        {
            return (_width  != (_originalCamera.pixelWidth )) ||
                   (_height != (_originalCamera.pixelHeight));
        }

        private Camera _originalCamera;
        private Camera _camera;

        private RenderTexture _sceneRT;
        private RenderTexture _distortRT;
        private PropertySheet _sheet;

        private int _nameID;
        private bool _inited;
        private int _width;
        private int _height;
    }
}
