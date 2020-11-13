using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class ActionClipEffectEditor : EditorWindow
{
    private static ActionClipEffectEditor window;
    private static Vector2 minResolution = new Vector2(400, 200);
    private static Rect middleCenterRect = new Rect(200, 100, 400, 400);
    private GUIStyle labelStyle;

    private AnimationEvent animationEvent;
    private Action<string> callback;

    private GameObject effectPrefab;
    private string effectPath = string.Empty;
    private BoneNogType boneNogTp;
    private bool usWorld;

    public static void Popup(Rect parent, AnimationEvent e)
    {
        window = EditorWindow.GetWindow(typeof(ActionClipEffectEditor), true, "动作关键帧特效编辑器") as ActionClipEffectEditor;
        window.minSize = minResolution;
        window.maxSize = minResolution;
        window.position = new Rect(parent.x + 10, parent.y + 10, minResolution.x, minResolution.y);
        window.Show();

        window.SetData(e);
    }

    public static void PopupInspector(Rect parent, string enter, Action<string> _callback)
    {
        window = EditorWindow.GetWindow(typeof(ActionClipEffectEditor), true, "攻击帧特效编辑器") as ActionClipEffectEditor;
        window.minSize = minResolution;
        window.maxSize = minResolution;
        window.position = new Rect(parent.x + 10, parent.y + 10, minResolution.x, minResolution.y);
        window.Show();

        window.SetDataInspector(enter, _callback);
    }

    private void SetData(AnimationEvent e)
    {
        animationEvent = e;

        if (e.stringParameter.IndexOf("|") == -1)
            e.stringParameter = string.Format("{0}|None|0", e.stringParameter);

        string[] configs = e.stringParameter.Split('|');

        effectPath = configs[0];
        effectPrefab = Resources.Load<GameObject>("Effect/" + effectPath);
        boneNogTp = BoneNogs.GetBoneNogTypeByName(configs[1]);
        usWorld = int.Parse(configs[2]) == 1;
    }

    private void SetDataInspector(string cfg, Action<string> call)
    {
        callback = call;

        if (cfg.IndexOf("|") == -1)
            cfg = string.Format("{0}|None|0", cfg);

        string[] configs = cfg.Split('|');

        effectPath = configs[0];
        effectPrefab = Resources.Load<GameObject>("Effect/" + effectPath);
        boneNogTp = BoneNogs.GetBoneNogTypeByName(configs[1]);
        usWorld = int.Parse(configs[2]) == 1;
    }

    void OnGUI()
    {
        GUI.skin.font = CustomEditorStyles.font;

        int areaW = (int)(this.position.width - 20);
        int areaH = (int)(this.position.height - 20);

        GUILayout.BeginArea(new Rect(10, 10, areaW, areaH));

        GUILayout.BeginVertical();
        GUILayout.Space(10);
        effectPrefab = EditorGUILayout.ObjectField("特效预制体", effectPrefab, typeof(GameObject), true) as GameObject;

        string path = AssetDatabase.GetAssetPath(effectPrefab);
        string savePath = "Assets/Resources/Effect/";
        int pathStart = path.IndexOf(savePath) + savePath.Length;

        if (path.Length > savePath.Length)
        {
            effectPath = path.Substring(pathStart).Replace(".prefab", "");
        }
        else
        {
            effectPath = "";
        }

        GUILayout.Space(10);
        EditorGUILayout.LabelField("特效路径", effectPath);
        GUILayout.Space(10);
        boneNogTp = (BoneNogType)EditorGUILayout.EnumPopup("骨骼绑定点", boneNogTp);
        GUILayout.Space(10);
        usWorld = EditorGUILayout.Toggle("是否使用世界坐标系", usWorld);
        GUILayout.Space(30);

        GUILayout.BeginHorizontal();

        if (GUILayout.Button("提交", GUILayout.Height(30)))
        {
            string subStr = effectPath;

            subStr += "|" + boneNogTp.ToString();

            if (usWorld)
                subStr += "|1";
            else
                subStr += "|0";

            if (animationEvent != null)
            {
                animationEvent.stringParameter = subStr;
            }
            else
            {
                callback(subStr);
            }

            window.Close();
        }

        if (GUILayout.Button("重置", GUILayout.Height(30)))
        {
            if (animationEvent != null)
            {
                animationEvent.stringParameter = "";
                SetData(animationEvent);
            }
            else
            {
                SetDataInspector("", callback);
            }
        }

        GUILayout.EndHorizontal();

        GUILayout.EndVertical();

        GUILayout.EndArea();
    }
}