using UnityEditor;
using UnityEngine;

namespace Battle
{
    [CustomEditor(typeof(EffectSet))]
    public class EffectSetEditor : Editor
    {
        EffectSet asset;

        void OnEnable()
        {
            asset = target as EffectSet;
        }

        public override void OnInspectorGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            EditBaseInfo();
            EditBattle();

            GUILayout.Space(30);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.isDebug = EditorGUILayout.Toggle("暂停调试开关", asset.isDebug);
            if (asset.debugObject && GUILayout.Button("选中特效", GUILayout.Height(30)))
            {
                Selection.activeGameObject = asset.debugObject;
            }
            EditorGUILayout.EndVertical();

            EditorUtility.SetDirty(asset);
        }

        void EditBaseInfo()
        {
            GUILayout.Space(10);
            GUILayout.Label("通用特效设置", CustomEditorStyles.titleLabel);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.prefab = (GameObject)EditorGUILayout.ObjectField("预制体", asset.prefab, typeof(GameObject), false);

            bool isOnce = false;
            if (asset.prefab)
            {
                string path = AssetDatabase.GetAssetPath(asset.prefab);
                string savePath = "Assets/ResourcesAsset/";
                int pathStart = path.IndexOf(savePath) + savePath.Length;

                if (path.Length > savePath.Length)
                {
                    asset.prefabPath = path.Substring(pathStart).Replace(".prefab", "");
                }
                else
                {
                    asset.prefabPath = "";
                }

                GUILayout.Space(5);
                EffectControll ctrl = asset.prefab.GetComponent<EffectControll>();
                if (ctrl)
                {
                    isOnce = ctrl.playType == EffectPlayType.Once;
                    EditorGUILayout.BeginVertical(CustomEditorStyles.box);
                    EditorGUILayout.LabelField("-特效路径", asset.prefabPath);
                    EditorGUILayout.LabelField("-特效类型", ctrl.playType.ToString());
                    EditorGUILayout.LabelField("-延迟播放", ctrl.delayTime.ToString());
                    EditorGUILayout.LabelField("-预设时长", ctrl.lifeTime.ToString());
                    EditorGUILayout.EndVertical();
                }
                else
                {
                    GUILayout.Label("此特效需要挂EffectControll组件！");
                }
                GUILayout.Space(5);
            }

            if (isOnce)
            {
                asset.customLifeTime = EditorGUILayout.FloatField("播放时间（0为预设）", asset.customLifeTime);
            }
            asset.customSpeed = EditorGUILayout.FloatField("播放速度（1为预设）", asset.customSpeed);
            asset.canChangeSpeed = EditorGUILayout.Toggle("是否允许改变速度", asset.canChangeSpeed);

            asset.angle = EditorGUILayout.Vector3Field("旋转角度", asset.angle);
            asset.scale = EditorGUILayout.Vector3Field("缩放比例", asset.scale);
            EditorGUILayout.EndVertical();


        }

        void EditBattle()
        {
            GUILayout.Space(10);
            GUILayout.Label("角色特效设置", CustomEditorStyles.titleLabel);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.boneNog = (BoneNogType)EditorGUILayout.EnumPopup("挂接骨骼", asset.boneNog);
            asset.isGlobal = EditorGUILayout.Toggle("是否全局", asset.isGlobal);
            asset.isClear = EditorGUILayout.Toggle("是否状态结束后清除", asset.isClear);
            asset.isLock = EditorGUILayout.Toggle("是否锁定旋转", asset.isLock);
            EditorGUILayout.EndVertical();
        }
    }
}
