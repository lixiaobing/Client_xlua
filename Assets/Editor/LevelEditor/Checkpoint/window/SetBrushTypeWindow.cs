using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.CheckPoint
{
    //帅怪 类型
    public enum BrushType
    {
        [EnumDescription("环形")]
        Ring = 0, 
        [EnumDescription("直线")]
        Line = 1, 
        [EnumDescription("弧线")]
        Arc = 2,
    }
    public delegate void BrushDelegate(BushInfo obj);

    public class BushInfo {

        public BrushType brushType = BrushType.Ring;
        public bool fixDir = false;
        public float parameter1;
        public float parameter2;
        //public Dictionary<BrushType,string>  dictNames = new Dictionary<BrushType, string>();

        public string Parameter1Name()
        {
            switch (brushType) {
                case BrushType.Ring:
                    return "半径";
                case BrushType.Line:
                    return "间距";
                case BrushType.Arc:
                    return "半径";
            }
            return "参数1";
        }
        public string Parameter2Name()
        {
            switch (brushType)
            {
                case BrushType.Arc:
                    return "角度";
            }
            return "参数2";
        }
        public void OnDraw() {
            brushType = Utils.EnumPopup<BrushType>("类型", brushType);
            fixDir    = Utils.Toggle("统一朝向", fixDir);
            parameter1 = Utils.UFloatField(Parameter1Name(), parameter1);
            if (brushType == BrushType.Arc) {
                parameter2 = Utils.UFloatField(Parameter2Name(), parameter2);
            }
        }

    }
    public class SetBrushTypeWindow : EditorWindow
    {
        public static SetBrushTypeWindow instance;
        private BushInfo bushInfo = new BushInfo();
        private BrushDelegate brushDelegate;
        public static EditorWindow OpenWindow(BrushDelegate brushDelegate)
        {
            if (instance != null) {
                instance.Close();
                instance = null;
            }
            SetBrushTypeWindow window   = EditorWindow.GetWindow<SetBrushTypeWindow>(true);
            window.titleContent = new GUIContent("设置模板");
            window.minSize = new Vector2(480, 200);
            window.maxSize = window.minSize;
            window.brushDelegate = brushDelegate;
            window.Show();
            return window;
        }


        void OnGUI() {
            GUI.skin.font = LGUISkin.font ;
            EditorGUILayout.BeginVertical();
            EditorGUILayout.LabelField("");
            EditorGUILayout.BeginVertical(GUILayout.Height(140));
            bushInfo.OnDraw();
            EditorGUILayout.EndVertical();
            if (Utils.Button("确定"))
            {
                this.brushDelegate(this.bushInfo);
                this.Close();
            }
            EditorGUILayout.EndVertical();
        }
    }


}