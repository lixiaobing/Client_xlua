using hjcd.level;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class InspectorWindow : EditorWindow
    {
        private static InspectorWindow instance;

        private readonly static string[] ToolbarText = { "主参数配置", "检点参数", "元件列表" };
       
        public static void OpenWindow() {
            OpenWindow(2);
        }
        public static void OpenWindow(int selectIndex)
        {
            if (instance == null) {
                InspectorWindow window = (InspectorWindow)EditorWindow.GetWindow<InspectorWindow>(false);
                window.titleContent = new GUIContent("AIEditor Inspector");
                window.minSize = new Vector2(500, 800);
                window.maximized = true;
                window.ShowUtility();
                instance = window;

            }
            instance.tabSelectIndex = selectIndex;
            instance.Repaint();
        }
        public int tabSelectIndex = 3;
        readonly View[] views = { new Main()  , new Inspector(), new Tasks() };

        public InspectorWindow() 
        {
            EventCenter.GetInstance(EventCenterType.AIEditor).RegisterListener(level.MessageType.REPAINT, DoRepaint);
        }

        void DoRepaint(EventCallBack eventCall) {
            this.Repaint();
        }
        void OnGUI() {

            EditorGUILayout.BeginVertical();
            tabSelectIndex = GUILayout.Toolbar(tabSelectIndex, ToolbarText);
            if (AIDataMgr.Instance != null)
            {
                views[tabSelectIndex].OnDraw();
            }
            else {
                Utils.LabelTip("请先打开行为主窗口",UnityEditor.MessageType.Warning);
            }
            EditorGUILayout.EndVertical();
        }
      

        private void OnDestroy()
        {
            Debug.Log("OnDestroy");
            for (int index = 0; index < views.Length; index++) {
                views[index].OnDestroy();
            }
            EventCenter.GetInstance(EventCenterType.AIEditor).RemoveListener(MessageType.REPAINT, DoRepaint);
        }

        public static void ClosweWindow()
        {
            if (instance != null)
            {
                instance.Close();
                instance = null;
            }

        }


    }


}