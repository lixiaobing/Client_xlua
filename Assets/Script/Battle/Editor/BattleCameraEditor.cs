
using Battle;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(BattleCameraSet))]
public class BattleCameraEditor : Editor
{
    BattleCameraSet asset;

    void OnEnable()
    {
        asset = target as BattleCameraSet;
    }

    public override void OnInspectorGUI()
    {
        GUI.skin.font = CustomEditorStyles.font;

        EditBase();

        EditCommonCamera();
        EditSideCamera();
        EditGodCamera();

        EditorUtility.SetDirty(asset);
    }

    void EditBase()
    {
        GUILayout.Label("Base Params", CustomEditorStyles.titleLabel);
        EditorGUILayout.BeginVertical(EditorStyles.helpBox);
        GUILayout.Space(5);

        GUILayout.Space(5);
        EditorGUILayout.EndVertical();
        GUILayout.Space(10);
    }

    void EditCommonCamera()
    {
        EditorGUILayout.BeginHorizontal();
        asset.normalEnable = EditorGUILayout.Toggle(asset.normalEnable, GUILayout.Width(10));
        GUILayout.Label("Normal Camera", CustomEditorStyles.titleLabel);
        EditorGUILayout.EndHorizontal();

        if (asset.normalEnable)
        {
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);

            GUILayout.Space(5);
            EditorGUILayout.PrefixLabel("普通机位");
            EditorGUILayout.BeginVertical(CustomEditorStyles.box);
            asset.normalParams.normalPosition = EditorGUILayout.Vector3Field("normalPosition", asset.normalParams.normalPosition);
            asset.normalParams.normalAngle = EditorGUILayout.Vector3Field("normalAngle", asset.normalParams.normalAngle);
            asset.normalParams.normalSmooth = EditorGUILayout.FloatField("normalSmooth", asset.normalParams.normalSmooth);
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.PrefixLabel("战斗机位");
            EditorGUILayout.BeginVertical(CustomEditorStyles.box);
            asset.normalParams.battlePosition = EditorGUILayout.Vector3Field("battlePosition", asset.normalParams.battlePosition);
            asset.normalParams.battleAngle = EditorGUILayout.Vector3Field("battleAngle", asset.normalParams.battleAngle);
            asset.normalParams.battleSmooth = EditorGUILayout.FloatField("battleSmooth", asset.normalParams.battleSmooth);
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.PrefixLabel("休闲机位");
            EditorGUILayout.BeginVertical(CustomEditorStyles.box);
            asset.normalParams.relaxPosition = EditorGUILayout.Vector3Field("relaxPosition", asset.normalParams.relaxPosition);
            asset.normalParams.relaxAngle = EditorGUILayout.Vector3Field("relaxAngle", asset.normalParams.relaxAngle);
            asset.normalParams.relaxSmooth = EditorGUILayout.FloatField("relaxSmooth", asset.normalParams.relaxSmooth);
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.PrefixLabel("通关机位");
            EditorGUILayout.BeginVertical(CustomEditorStyles.box);
            asset.normalParams.clearPosition = EditorGUILayout.Vector3Field("clearPosition", asset.normalParams.clearPosition);
            asset.normalParams.clearAngle = EditorGUILayout.Vector3Field("clearAngle", asset.normalParams.clearAngle);
            asset.normalParams.clearSmooth = EditorGUILayout.FloatField("clearSmooth", asset.normalParams.clearSmooth);
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.PrefixLabel("其他参数");
            asset.normalParams.wallFixPosition = EditorGUILayout.Vector3Field("wallFixPosition", asset.normalParams.wallFixPosition);
            asset.normalParams.wallFixSmooth = EditorGUILayout.FloatField("wallFixSmooth", asset.normalParams.wallFixSmooth);
            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.PrefixLabel("Y Rotate Range");
            asset.normalParams.minRotateY = EditorGUILayout.FloatField(asset.normalParams.minRotateY, GUILayout.Width(60));
            EditorGUILayout.MinMaxSlider(ref asset.normalParams.minRotateY, ref asset.normalParams.maxRotateY, -45, 45);
            asset.normalParams.maxRotateY = EditorGUILayout.FloatField(asset.normalParams.maxRotateY, GUILayout.Width(60));
            EditorGUILayout.EndHorizontal();

            asset.normalParams.moveRotateSpeed = EditorGUILayout.Slider("moveRotateSpeed", asset.normalParams.moveRotateSpeed, 0, 1);
            asset.normalParams.attackFixSpeed = EditorGUILayout.Slider("attackFixSpeed", asset.normalParams.attackFixSpeed, 0, 1);

            GUILayout.Space(5);

            EditorGUILayout.EndVertical();
            GUILayout.Space(10);
        }
    }

    void EditSideCamera()
    {
        EditorGUILayout.BeginHorizontal();
        asset.sideEnable = EditorGUILayout.Toggle(asset.sideEnable, GUILayout.Width(10));
        GUILayout.Label("Side Camera", CustomEditorStyles.titleLabel);
        EditorGUILayout.EndHorizontal();

        if (asset.sideEnable)
        {
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            asset.sideParams.followSpeed = EditorGUILayout.FloatField("followSpeed", asset.sideParams.followSpeed);
            asset.sideParams.defaultDistance = EditorGUILayout.FloatField("defaultDistance", asset.sideParams.defaultDistance);
            EditorGUILayout.EndVertical();

            GUILayout.Space(10);
        }
    }

    void EditGodCamera()
    {
        EditorGUILayout.BeginHorizontal();
        asset.topEnable = EditorGUILayout.Toggle(asset.topEnable, GUILayout.Width(10));
        GUILayout.Label("Top Camera", CustomEditorStyles.titleLabel);
        EditorGUILayout.EndHorizontal();

        if (asset.topEnable)
        {
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);

            asset.topParams.followSpeed = EditorGUILayout.FloatField("followSpeed", asset.topParams.followSpeed);
            asset.topParams.defaultHeight = EditorGUILayout.FloatField("defaultHeight", asset.topParams.defaultHeight);
            EditorGUILayout.EndVertical();

            GUILayout.Space(10);
        }
    }
}