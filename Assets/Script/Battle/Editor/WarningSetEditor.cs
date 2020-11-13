using UnityEditor;
using UnityEngine;

namespace Battle
{
    [CustomEditor(typeof(WarningSet))]
    public class WarningSetEditor : Editor
    {
        WarningSet asset;

        void OnEnable()
        {
            asset = target as WarningSet;
        }

        public override void OnInspectorGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            GUILayout.Space(10);

            EditBaseInfo();
            GUILayout.Space(10);
            EditOther();

            EditorUtility.SetDirty(asset);
        }

        void EditBaseInfo()
        {
            GUILayout.Label("外观设置", CustomEditorStyles.titleLabel);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.type = (WarningSetType)EditorGUILayout.EnumPopup("类型", asset.type);
            GUILayout.Space(5);
            asset.surfaceMaterial = (Material)EditorGUILayout.ObjectField("表面材质", asset.surfaceMaterial, typeof(Material), false);
            //asset.surfaceColor = EditorGUILayout.ColorField("表面颜色", asset.surfaceColor);
            asset.borderMaterial = (Material)EditorGUILayout.ObjectField("边缘材质", asset.borderMaterial, typeof(Material), false);
            //asset.borderColor = EditorGUILayout.ColorField("边缘颜色", asset.borderColor);
            asset.borderWidth = EditorGUILayout.FloatField("边缘宽度", asset.borderWidth);
            EditorGUILayout.EndVertical();
        }

        void EditOther()
        {
            GUILayout.Label("位置形状", CustomEditorStyles.titleLabel);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.position = EditorGUILayout.Vector3Field("位置", asset.position);
            if (asset.type == WarningSetType.Range)
            {
                asset.radius = EditorGUILayout.FloatField("半径", asset.radius);
                asset.segments = EditorGUILayout.IntField("弧形分段", asset.segments);
            }
            else if (asset.type == WarningSetType.Sector)
            {
                asset.radius = EditorGUILayout.FloatField("半径", asset.radius);
                asset.angle = EditorGUILayout.FloatField("角度", asset.angle);
                asset.rotateAngle = EditorGUILayout.FloatField("旋转角度", asset.rotateAngle);
                asset.segments = EditorGUILayout.IntField("弧形分段", asset.segments);
            }
            else if (asset.type == WarningSetType.Rect)
            {
                asset.size = EditorGUILayout.Vector3Field("长宽尺寸", asset.size);
                asset.rotateAngle = EditorGUILayout.FloatField("旋转角度", asset.rotateAngle);
            }
            EditorGUILayout.EndVertical();
        }
    }
}
