using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Battle
{
    public class ActionClipCameraEffectEditor : EditorWindow
    {
        private static ActionClipCameraEffectEditor window;
        private static Vector2 minResolution = new Vector2(400, 200);
        private static Rect middleCenterRect = new Rect(200, 100, 400, 400);
        private GUIStyle labelStyle;

        private AnimationEvent animationEvent;
        private Action<string> callback;

        private CameraEffectType effectType;
        private float duration;
        private float strength;
        private int vibrato;
        private float randomness;

        public static void Popup(Rect parent, AnimationEvent e)
        {
            window = EditorWindow.GetWindow(typeof(ActionClipCameraEffectEditor), true, "动作关键帧相机效果编辑器") as ActionClipCameraEffectEditor;
            window.minSize = minResolution;
            window.maxSize = minResolution;
            window.position = new Rect(parent.x + 10, parent.y + 10, minResolution.x, minResolution.y);
            window.Show();

            window.SetData(e);
        }

        public static void PopupInspector(Rect parent, string enter, Action<string> _callback)
        {
            window = EditorWindow.GetWindow(typeof(ActionClipCameraEffectEditor), true, "攻击帧相机特效编辑器") as ActionClipCameraEffectEditor;
            window.minSize = minResolution;
            window.maxSize = minResolution;
            window.position = new Rect(parent.x + 10, parent.y + 10, minResolution.x, minResolution.y);
            window.Show();

            window.SetDataInspector(enter, _callback);
        }

        private void SetData(AnimationEvent e)
        {
            animationEvent = e;

            string[] configs = e.stringParameter.Split('|');

            effectType = ActionEventPack.GetCameraEffectType(configs[0]);
            duration = float.Parse(configs[1]);
            strength = float.Parse(configs[2]);
            vibrato = int.Parse(configs[3]);
            randomness = float.Parse(configs[4]);
        }

        private void SetDataInspector(string cfg, Action<string> call)
        {
            callback = call;

            string[] configs = cfg.Split('|');

            effectType = ActionEventPack.GetCameraEffectType(configs[0]);
            duration = float.Parse(configs[1]);
            strength = float.Parse(configs[2]);
            vibrato = int.Parse(configs[3]);
            randomness = float.Parse(configs[4]);
        }

        void OnGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            int areaW = (int)(this.position.width - 20);
            int areaH = (int)(this.position.height - 20);

            GUILayout.BeginArea(new Rect(10, 10, areaW, areaH));

            GUILayout.BeginVertical();
            GUILayout.Space(10);

            effectType = (CameraEffectType)EditorGUILayout.EnumPopup("类型", effectType);
            GUILayout.Space(5);

            if (effectType == CameraEffectType.Horizontal || effectType == CameraEffectType.Vertical ||
                effectType == CameraEffectType.AllRound || effectType == CameraEffectType.Zoom)
            {
                duration = EditorGUILayout.FloatField("时长", duration);
                GUILayout.Space(5);
                strength = EditorGUILayout.FloatField("强度", strength);
                GUILayout.Space(5);
                vibrato = EditorGUILayout.IntField("幅度", vibrato);
                GUILayout.Space(5);
                randomness = EditorGUILayout.FloatField("随机性", randomness);
                GUILayout.Space(5);
                EditorGUILayout.LabelField("震动随机性（0-360，建议0-90）0为单一方向");
            }

            GUILayout.BeginHorizontal();

            if (GUILayout.Button("提交", GUILayout.Height(30)))
            {
                string subStr = string.Format("{0}|{1}|{2}|{3}|{4}", effectType.ToString(), duration, strength, vibrato, randomness);
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
                    animationEvent.stringParameter = "None|1|5|10|45";
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
}
