
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Battle
{
    [CustomEditor(typeof(SummonSet))]
    public class SummonSetEditor : Editor
    {
        SummonSet asset;

        void OnEnable()
        {
            asset = target as SummonSet;
        }

        public override void OnInspectorGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            GUILayout.Space(10);

            EditBaseInfo();
            GUILayout.Space(10);
            if (asset.targetFirst)
            {
                EditBornSet("基于目标设置", asset.bornTarget);
            }
            GUILayout.Space(10);
            EditBornSet("基于宿主设置", asset.bornOwner);

            GUILayout.Space(10);

            asset.luaPath = $"summon/{asset.name}";
            EditorGUILayout.TextField("Lua Path", asset.luaPath);

            GUILayout.Space(5);

            if (GUILayout.Button("Generate Lua Config File", GUILayout.Height(30)))
            {
                BattleEditorUtility.GenerateSummonSetLua(asset);
            }

            EditorUtility.SetDirty(asset);
        }

        void EditBaseInfo()
        {
            GUILayout.Label("基础设置", CustomEditorStyles.titleLabel);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.prefab = (GameObject)EditorGUILayout.ObjectField("预制体", asset.prefab, typeof(GameObject), false);

            if (asset.prefab)
            {
                asset.path = $"Model/Summon/{asset.prefab.name}";

                Animator animator = asset.prefab.GetComponent<Animator>();
                asset.controller = animator.runtimeAnimatorController.name;
            }
            else
            {
                asset.path = "";
                asset.controller = "";
            }

            EditorGUILayout.TextField("路径", asset.path);
            EditorGUILayout.TextField("状态机", asset.controller);

            asset.action = EditorGUILayout.TextField("动作名", asset.action);
            asset.skillId = EditorGUILayout.IntField("关联技能ID", asset.skillId);
            asset.lifeTime = EditorGUILayout.FloatField("存活时间", asset.lifeTime);
            asset.targetFirst = EditorGUILayout.Toggle("优先选择目标", asset.targetFirst);
            EditorGUILayout.EndVertical();
        }


        void EditBornSet(string title, SummonBornConfig set)
        {
            GUILayout.Label(title, CustomEditorStyles.titleLabel);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            set.position = EditorGUILayout.Vector3Field("相对位置", set.position);
            set.angle = EditorGUILayout.FloatField("旋转角度", set.angle);
            set.checkRadius = EditorGUILayout.FloatField("检测半径", set.checkRadius);
            EditorGUILayout.EndVertical();
        }
    }
}
