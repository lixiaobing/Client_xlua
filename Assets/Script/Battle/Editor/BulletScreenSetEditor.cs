using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Battle
{
    [CustomEditor(typeof(BulletScreenSet))]
    class BulletScreenSetEditor : Editor
    {
        BulletScreenSet asset;

        GameObject editHelper;
        GameObject editCameraObject;
        BulletScreenSetHelper helper;
        Camera editCamera;
        RenderTexture editTexture;

        bool previewPause = false;

        void OnEnable()
        {
            asset = target as BulletScreenSet;
            CreateEditorTarget();

            asset.filePath = "bulletscreen/" + asset.name;

            EditorApplication.update += Update;
        }

        void Update()
        {
            if (EditorApplication.isPlaying)
            {
                EditorApplication.isPlaying = false;
                EditorApplication.update -= Update;
            }
            else
            {
                if (!previewPause)
                {
                    helper.DoUpdate(asset);
                    this.Repaint();
                }
            }
        }

        public override void OnInspectorGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            GUILayout.Space(10);

            EditPreview();

            EditSplits();

            EditorOthers();

            GUILayout.Space(10);

            GUILayout.Space(15);

            EditorGUILayout.TextField("Lua Path", asset.filePath);

            GUILayout.Space(5);

            if (GUILayout.Button("Generate Lua Config File", GUILayout.Height(30)))
            {
                BattleEditorUtility.GenerateBulletScreenLua(asset);
            }

            EditorUtility.SetDirty(asset);
        }

        void CreateEditorTarget()
        {
            if (editHelper == null)
            {
                editHelper = GameObject.CreatePrimitive(PrimitiveType.Cube);
                helper = editHelper.AddComponent<BulletScreenSetHelper>();
                editHelper.name = "EditHelper";
                editHelper.transform.position = Vector3.zero;

                editCameraObject = new GameObject("Camera");
                editCameraObject.transform.SetParent(editHelper.transform, false);
                editCameraObject.transform.position = new Vector3(5, 5, -5);
                editCameraObject.transform.LookAt(editHelper.transform);

                editTexture = new RenderTexture(400, 400, 10);

                editCamera = editCameraObject.AddComponent<Camera>();
                editCamera.clearFlags = CameraClearFlags.Skybox;
                editCamera.hideFlags = HideFlags.None;
                //editCamera.backgroundColor = Color.black;
                editCamera.targetTexture = editTexture;
            }
        }

        void OnDestroy()
        {
            if (editHelper)
            {
                GameObject.DestroyImmediate(editHelper);

                EditorApplication.update -= Update;
            }
        }

        void EditPreview()
        {
            GUILayout.Label("效果预览", CustomEditorStyles.titleLabel);
            GUILayout.Space(10);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            GUILayout.Box(editTexture, GUILayout.ExpandWidth(true), GUILayout.Height(300));

            helper.previewSpeed = EditorGUILayout.FloatField("Preview Speed", helper.previewSpeed);
            helper.previewLength = EditorGUILayout.FloatField("Preview Length", helper.previewLength);
            helper.previewInterval = EditorGUILayout.IntField("Preview Interval", helper.previewInterval);

            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            if (previewPause)
            {
                if (GUILayout.Button("Play"))
                {
                    previewPause = false;
                }
            }
            else
            {
                if (GUILayout.Button("Pause"))
                {
                    previewPause = true;
                }
            }

            if (GUILayout.Button("Restart"))
            {
                helper.ClearBalls();
            }
            EditorGUILayout.EndHorizontal();
            GUILayout.Space(5);
            EditorGUILayout.EndVertical();

            GUILayout.Space(10);
        }

        void EditSplits()
        {
            GUILayout.Label("拆分路径", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            BulletShootDirection direc = (BulletShootDirection)EditorGUILayout.EnumPopup("初始方向", asset.direction);
            if (direc != asset.direction || asset.directionVector == Vector3.zero)
            {
                asset.direction = direc;
                asset.directionVector = BulletScreenSet.GetDirectionVector(editHelper.transform, asset.direction) * 100f;
            }
            asset.directionVector = EditorGUILayout.Vector3Field("实际向量", asset.directionVector);
            GUILayout.Space(5);
            asset.splitAngle = EditorGUILayout.Vector3Field("拆分角度", asset.splitAngle);
            asset.splitWay = (BulletShootSplitWay)EditorGUILayout.EnumPopup("拆分方式", asset.splitWay);
            asset.splitCount = EditorGUILayout.IntField("拆分次数", asset.splitCount);
            asset.splitDelay = EditorGUILayout.IntField("拆分延迟", asset.splitDelay);
            EditorGUILayout.EndVertical();

            GUILayout.Space(10);
        }


        void EditorOthers()
        {
            GUILayout.Label("弹幕设置", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);

            asset.moveAngle = EditorGUILayout.Vector3Field("运动角度", asset.moveAngle);
            EditorGUILayout.EndVertical();
        }
    }

}