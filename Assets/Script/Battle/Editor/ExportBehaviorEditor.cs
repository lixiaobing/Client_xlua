using UnityEditor;
using UnityEngine;

namespace Battle
{
    public class ExportBehaviorEditor : EditorWindow
    {
        [MenuItem("Tools/ExportBehaviorEditor #E")]
        public static void Init()
        {
            ExportBehaviorEditor window = (ExportBehaviorEditor)EditorWindow.GetWindow((typeof(ExportBehaviorEditor)));
            window.minSize = new Vector2(1200, 800);
            window.maxSize = new Vector2(1200, 800);
            window.maximized = false;
            window.ShowUtility();
        }

        BattleBehaviorPack pack;

        Vector2 scrollPosition;

        int unfoldSort = -1;

        void OnGUI()
        {
            pack = AssetDatabase.LoadAssetAtPath<BattleBehaviorPack>("Assets/EditorConfig/BattleBehaviorPack.asset");

            EditorGUILayout.BeginVertical();

            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.BeginVertical();
            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal(GUILayout.ExpandWidth(true));
            for (var i = 0; i < pack.fields.Count; i++)
            {
                pack.fields[i].name = EditorGUILayout.TextField(pack.fields[i].name, GUILayout.Width(90));
            }
            if (GUILayout.Button("+", GUILayout.Width(20)))
            {
                pack.fields.Add(new BattleBehaviorField());
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal(GUILayout.ExpandWidth(true));
            for (var i = 0; i < pack.fields.Count; i++)
            {
                EditorGUILayout.BeginHorizontal(GUILayout.Width(90));
                pack.fields[i].type = (BattleBehaviorFieldType)EditorGUILayout.EnumPopup(pack.fields[i].type, GUILayout.Width(66));
                if (GUILayout.Button("一", GUILayout.Width(20)))
                {
                    pack.fields.RemoveAt(i);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginHorizontal(GUILayout.Width(280));
            if (GUILayout.Button("+", GUILayout.Width(40), GUILayout.Height(40)))
            {
                pack.list.Add(new BattleBehaviorConfig());
            }
            if (GUILayout.Button("Save Config", GUILayout.Width(120), GUILayout.Height(40)))
            {
                pack.list.Sort((a, b) =>
                {
                    return a.id - b.id;
                });
                EditorUtility.SetDirty(pack);
                AssetDatabase.SaveAssets();
            }
            if (GUILayout.Button("Generate Lua", GUILayout.Width(120), GUILayout.Height(40)))
            {
                BattleEditorUtility.GenerateBehaviorLua(pack);
                AssetDatabase.SaveAssets();
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.EndHorizontal();
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(CustomEditorStyles.box, GUILayout.Width(1200), GUILayout.ExpandHeight(true));
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition, GUILayout.ExpandHeight(true));
            for (var i = 0; i < pack.list.Count; i++)
            {
                var cfg = pack.list[i];
                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("一", GUILayout.Width(50)))
                {
                    pack.list.RemoveAt(i);
                }
                cfg.id = EditorGUILayout.IntField(cfg.id, GUILayout.Width(100));
                cfg.content = EditorGUILayout.TextField(cfg.content, GUILayout.Width(960));
                if (GUILayout.Button("Copy", GUILayout.Width(50)))
                {
                    GUIUtility.systemCopyBuffer = cfg.content;
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndScrollView();
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.EndVertical();
        }
    }
}
