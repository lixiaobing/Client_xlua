using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;

public class BattleLogEditor : EditorWindow
{
    [MenuItem("Tools/BattleLogEditor #C")]
    public static void Init()
    {
        BattleLogEditor window = (BattleLogEditor)EditorWindow.GetWindow((typeof(BattleLogEditor)));
        window.autoRepaintOnSceneChange = true;
        window.maximized = true;
        window.ShowUtility();
    }

    Vector2 scrollPosition = Vector2.zero;
    int selectMessage = -1;
    int logCount;

    void OnGUI()
    {
        if (!Application.isPlaying)
        {
            selectMessage = -1;
            GameLog.ClearBattleLog();
        }

        GUIStyle title = new GUIStyle();
        title.normal.textColor = Color.white;
        title.alignment = TextAnchor.MiddleLeft;
        title.fontSize = 12;

        Rect rect = EditorGUILayout.BeginVertical();

        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("清空日志", GUILayout.Width(100), GUILayout.Height(30)))
        {
            selectMessage = -1;
            GameLog.ClearBattleLog();
        }
        EditorGUILayout.EndHorizontal();

        if (GameLog.battleLogs.Count > logCount)
        {
            scrollPosition = new Vector2(scrollPosition.x, GameLog.battleLogs.Count * 20);
        }

        scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition, EditorStyles.helpBox, GUILayout.ExpandWidth(true), GUILayout.ExpandHeight(true));

        logCount = GameLog.battleLogs.Count;

        for (var i=0;i<GameLog.battleLogs.Count;i++)
        {
            var log = GameLog.battleLogs[i];

            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button("查看", GUILayout.Width(50)))
            {
                selectMessage = i;
            }
            if (selectMessage==i)
            {
                EditorGUILayout.LabelField($"<color=white>[{log.time}]--{log.message}</color>", title);
            }
            else
            {
                EditorGUILayout.LabelField($"[{log.time}]--{log.message}", title);
            }

            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.EndScrollView();

        if (selectMessage != -1)
        {
            EditorGUILayout.TextArea(GameLog.battleLogs[selectMessage].traceback, GUILayout.Height(200));
        }
        else
        {
            EditorGUILayout.TextArea(string.Empty, GUILayout.Height(200));
        }

        EditorGUILayout.EndVertical();
    }

    void OnDestroy()
    {
        selectMessage = -1;
        GameLog.ClearBattleLog();
    }
}