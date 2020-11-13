using System.IO;
using UnityEditor;
using UnityEngine;

namespace Battle
{
    [CustomEditor(typeof(MoveCurve), true)]
    public class MoveCurveEditor : Editor
    {
        MoveCurve asset;
        string folderName;

        void OnEnable()
        {
            asset = target as MoveCurve;

            string path = AssetDatabase.GetAssetPath(asset);
            string folder = Path.GetDirectoryName(path).Replace("\\", "/");
            string[] strs = folder.Split('/');
            folderName = strs[strs.Length - 1];
            asset.filePath = $"{folderName}/{asset.name}";
        }

        public override void OnInspectorGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            base.OnInspectorGUI();

            GUILayout.Space(15);

            EditorGUILayout.TextField("Lua Path", asset.filePath);

            GUILayout.Space(5);

            if (GUILayout.Button("Generate Lua Config File", GUILayout.Height(30)))
            {
                BattleEditorUtility.GenerateMoveCurveLua(asset);
            }
        }
    }
}
