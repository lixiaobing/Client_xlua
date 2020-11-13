
using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{ 
public class BehaviorTreeMainWindow : EditorWindow
{
        private static BehaviorTreeMainWindow instance;

        /*
        [MenuItem("Tools/Level/BehaviorTree")]
        public static void OpenWindow() {
            OpenWindow(null);
        }
        */
        static int styleIndex = 0; 
        public BehaviorTreeMainWindow() {
            instance = this;
           // Utils.LogError("MainWindow construct");
        }

        public static void ClosweWindow() {
            if (BehaviorTreeMainWindow.instance) {
                BehaviorTreeMainWindow.instance.Close();
            }
        }
        public static void OpenWindow(AIModel model)
        {
            if (instance == null) {
                BehaviorTreeMainWindow window = EditorWindow.GetWindow<BehaviorTreeMainWindow>();
                window.Initlize();
                instance = window;
            }
  
            instance.titleContent = new GUIContent("行为树编辑:" + model.id);
            instance.name = model.id.ToString();
            instance.Repaint();
            AIDataMgr.Load_(model.id); 

        }
        public static GUISkin skin { get; private set; }
  

        public Vector2 offset;

        //是否正在连线
        private bool link;
        //连线的起始节点
        private Node startNode;
        private Vector2 startPosition = new Vector2();
        public void Initlize() {
            skin      = EditorGUIUtility.Load("skin.guiskin") as GUISkin;
            offset    = Vector2.zero;
            this.minSize = new Vector2(800, 800);
            level.Utils.Log("AIEditorWindow initlize ");
        }

        public void StartLink(Node node) 
        {
            link      = true;
            startNode = node;
            startPosition = node.GetLinkOutPosition();
            
        }

        public void EndLink()
        {
            link = false;
            startNode = null;
        }
        Vector2 dragPosition = new Vector2();
        bool drag = false;
        public void StartDrag(Vector2 position) {
            drag = true;
            dragPosition = position;
        }
        public void HandleDrag(Vector2 position)
        {
            if (drag) {
                offset = position - dragPosition;
                dragPosition = position;
            }
        }
        public void EndDrag() {
            drag = false;
        }
        public void OnGUI()
        {
            GUI.skin.font = LGUISkin.font;
            if (AIDataMgr.Instance == null)
            {
                AIDataMgr.Load_(int.Parse(this.name)); //TODO name存储行为树ID
            }

            Event e = Event.current;
    

            List<Node> nodeList = AIDataMgr.Instance.nodes;
            DrawBackground();
            
            //if (!AIDataMgr.Instance.IsActive()) {
            //    DrawMenu();
            //    GUI.skin.label.fontSize = 20;
            //    GUILayout.Label("点击菜单打开或新建行为树", GUI.skin.label);
            //    return;
            //}
 
            Vector2 mousePosition = e.mousePosition;
            //绘制连接点
            foreach (var node in nodeList)
            {
                node.DrawLink(offset);
                node.DrawLinkJoin();


                switch (e.button)
                {
                    case 0:
                        if (e.type == EventType.MouseDown)
                        {
                            if (node.TryFocus(mousePosition)) {
                                /*     e.Use();*/
                                readRepaint = true;
                            }
                        }
                        break;
                }
            }


            switch (e.button)
            {
                case 0:
                    if (e.type == EventType.MouseDown)
                    {
                        foreach (var node in nodeList)
                        {

                            if (node.GetLinkOutRect().Contains(e.mousePosition))
                            {   //点击连接点

                                StartLink(node);
                                //开始绘制临时曲线
                                e.Use();
                                break;
                            }
                        }

                    }
                    else if (e.type == EventType.MouseDrag)
                    {
                        if (link)
                        {
/*                            Utils.Log("EventType.MouseDrag");*/
/*                            e.Use();*/

                        }
                    }    
                    else if (e.type == EventType.MouseUp) {

                        if (link) {
                            foreach (var node in nodeList)
                            {
                                if (node.GetLinkInRect().Contains(e.mousePosition)) 
                                { 
                                    startNode.DoLink(node);
                                    break;
                                }
                            }
                            EndLink();
                        }
                    }
                    break;
                case 1:
                    if (e.type == EventType.MouseDown)
                    {
  /*                      Utils.Log("xxxxxooooooo");*/
                        foreach (var node in nodeList)
                        {
                            if (node.CanFocus()) {
                                if (node.GetWinRect().Contains(e.mousePosition))
                                {
                                    ShowRemoveMenu(node);
                                    e.Use();
                                    break;

                                }
                            }
                        }
             /*           Debug.Log(e.button);*/
                    }
                    break;
                case 2:

                 
                    if (e.type == EventType.MouseDown)
                    {
                        StartDrag(mousePosition);
                    }
                    else if (e.type == EventType.MouseUp)
                    {
                        EndDrag();
                    }
       
                    break;
            }
            HandleDrag(mousePosition);
            BeginWindows();

            for (int index= 0; index < nodeList.Count; index++)
            {
                Node node = nodeList[index];
                Rect rect = node.GetWinRect();
                if (drag) {
                    rect.position = rect.position + offset;
                }
                rect = GUI.Window(index, rect, DrawNodeWindow, "", node.GetStyle());
                node.SetPosition(rect.position,!drag);
            }
            EndWindows();
       
            //绘制连接线       
            if (link) {
                DrawLinkLine(startPosition, e.mousePosition);
            }

            DrawMenu();

            switch (e.button) {
                case 0:
                    break;
                case 1:
                    /*            if (e.type == EventType.ContextClick)*/
                    if (e.type == EventType.MouseDown)
                    {
                        ShowCreateMenu();
                        //e.Use();
                    }
                    break;
                case 2:

                    break;
            }
            //AIDataMgr.Instance.Debug();
            //删除键
            
            if (e.type == EventType.KeyUp) {
                if (e.keyCode == KeyCode.Delete)
                {
                    Utils.Log("删除RemoveFocus");
                    AIDataMgr.Instance.RemoveFocus();
                    readRepaint = true;
                }
            }


        }

        public void DrawMenu() {

            GUILayout.BeginHorizontal(GUI.skin.customStyles[258], GUILayout.ExpandWidth(true));
            /*
            if (Utils.Button("打开", GUILayout.Width(80), GUILayout.Height(30)))
            {
                AIDataMgr.Instance.Load();
            }
            if (Utils.Button("新建", GUILayout.Width(80), GUILayout.Height(30)))
            {
                AIDataMgr.Instance.Create();
            }
            */
            if (AIDataMgr.Instance.nodes.Count > 0)
            {
                if (Utils.Button("保存", GUILayout.Width(80), GUILayout.Height(30)))
                {
                    AIDataMgr.Instance.Save();
                }
                //if (Utils.Button("另存为", GUILayout.Width(80), GUILayout.Height(30)))
                //{
                //    AIDataMgr.Instance.OtherSave();
                //}
                if (Utils.Button("导出", GUILayout.Width(80), GUILayout.Height(30)))
                {
                    AIDataMgr.Instance.Export();
                }

            }

   
            if (Utils.Button("元件", GUILayout.Width(80), GUILayout.Height(30)))
            {
                InspectorWindow.OpenWindow();
            }
            Node.staticScale = GUILayout.HorizontalSlider(Node.staticScale,0.5f,1.0f,GUILayout.Width(200));
            GUILayout.Label(Node.staticScale.ToString());
            GUILayout.EndHorizontal();

/*            if (Utils.Button("test"+ styleIndex, GUILayout.Width(80), GUILayout.Height(30)))
            {
                styleIndex = styleIndex + 1;
            }*/

        }

        public void DrawBackground()
        {


            float w = position.width;
            float h = position.height;

            Texture2D bg = new Texture2D(1, 1, TextureFormat.RGBA32, false);
            bg.SetPixel(0, 0, new Color(0.3f, 0.3f, 0.3f));
            bg.Apply();
            GUI.DrawTexture(new Rect(0, 0, w, h), bg);

            Handles.BeginGUI();
            Handles.color = new Color(0.7f, 0.7f, 0.7f, 0.1f);
            for (int i = 0; i * 60 <= w; i++) Handles.DrawLine(new Vector3(60 * i, 0), new Vector3(60 * i, h));
            for (int i = 0; i * 60 <= h; i++) Handles.DrawLine(new Vector3(0, 60 * i), new Vector3(w, 60 * i));
            Handles.color = new Color(0.5f, 0.5f, 0.5f, 0.1f);
            for (int i = 0; i * 20 <= w; i++) if (i % 3 != 0) Handles.DrawLine(new Vector3(20 * i, 0), new Vector3(20 * i, h));
            for (int i = 0; i * 20 <= h; i++) if (i % 3 != 0) Handles.DrawLine(new Vector3(0, 20 * i), new Vector3(w, 20 * i));
            Handles.EndGUI();
        }

        public void DrawNodeWindow(int index)
        {
            if (index < AIDataMgr.Instance.nodes.Count) {  //删除操作时的容错处理
                Node node = AIDataMgr.Instance.nodes[index];
                node.OnDraw(offset);                
                GUI.DragWindow();

            }
        }



        public static void DrawLinkLine(Vector2 start, Vector2 end)
        {
            float offset = end.y - start.y;
            offset = offset * 0.7f;
            offset = Mathf.Max(offset, 5);
            Handles.color = Color.green;
            Vector3 p1 = new Vector3(start.x, start.y);
            Vector3 p2 = new Vector3(start.x, start.y + offset);
            Vector3 p3 = new Vector3(end.x,   start.y + offset);
            Vector3 p4 = new Vector3(end.x,end.y);
            Handles.DrawLine(p1, p2);
            Handles.DrawLine(p2, p3);
            Handles.DrawLine(p3, p4);

        }

        bool readRepaint = true;
        public void Update()
        {
            if (drag || link)
            {
                readRepaint = true;
                Repaint();
            }
            else {
                if (readRepaint) {
                    Repaint();
                    readRepaint = false;
                }
            
            }
        }



        public void OnAddNodeCallback(object obj) 
        {
            /*            Node node = (Node)ScriptableObject.CreateInstance(obj.ToString());*/

            Node node = Utils.CreateInstance<Node>(obj.ToString());
            //鼠标点击位置
            if (mousePosition != null)
            {
                node.SetPosition(mousePosition);

            }
            AIDataMgr.Instance.AddNode(node);
        }

        //记录鼠标位置
        Vector2 mousePosition;
        public void ShowCreateMenu()
        {
            UnityEditor.GenericMenu menu = new GenericMenu();
            foreach (Type type in NodeType.actions_1) {
                menu.AddItem(new GUIContent("执行节点/战斗事件/" + Utils.GetDescription(type)), false, OnAddNodeCallback, type.FullName);
            }
            foreach (Type type in NodeType.actions_2)
            {
                menu.AddItem(new GUIContent("执行节点/非战斗事件/" + Utils.GetDescription(type)), false, OnAddNodeCallback, type.FullName);
            }
            foreach (Type type in NodeType.actions_3)
            {
                menu.AddItem(new GUIContent("执行节点/通用事件/" + Utils.GetDescription(type)), false, OnAddNodeCallback, type.FullName);
            }


            foreach (Type type in NodeType.composites)
            {
                menu.AddItem(new GUIContent("复合节点/" + Utils.GetDescription(type)), false, OnAddNodeCallback, type.FullName);
            }
            foreach (Type type in NodeType.conditionals)
            {
                menu.AddItem(new GUIContent("条件节点/" + Utils.GetDescription(type)), false, OnAddNodeCallback, type.FullName);
            }
            foreach (Type type in NodeType.decorators)
            {
                menu.AddItem(new GUIContent("装饰节点/" + Utils.GetDescription(type)), false, OnAddNodeCallback, type.FullName);
            }
            //预制模块
            GroupList groupList = Utils.AssetDeserialize<GroupList>(BehaviorTreeConfig.behaviorTreeGroup);
            if (groupList != null) {
                foreach (var model in groupList.aIModels)
                {
                    if (model.groupId == -1) {
                        menu.AddItem(new GUIContent("预制模块/" + model.name), false, OnCreateMode, model);
                    }
                }   
            }
            /*            Utils.Log(Event.current.mousePosition);*/
            if (Event.current.mousePosition != null){
                mousePosition = Event.current.mousePosition;
            }
            menu.ShowAsContext();
            
        }

        //添加AI模块
        public void OnCreateMode(object obj)
        {
            AIModel model = obj as AIModel;
            string filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(model.id);
            if (File.Exists(filePath))
            {
                AIDataMgr data = Utils.XmlDeserialize<AIDataMgr>(filePath);

                data.NewUUID();

                foreach (var node in data.nodes)
                {
                    AIDataMgr.Instance.AddNode(node);
                }
            }
         



        }

        public void ShowRemoveMenu(Node node)
        {
            UnityEditor.GenericMenu menu = new GenericMenu();
            menu.AddItem(new GUIContent("删除节点"), false, OnRemoveNodeCallback,node);
            menu.AddItem(new GUIContent("复制节点"), false, OnCloneNodeCallback, node);
            menu.AddItem(new GUIContent("删除分支"), false, OnRemoveNodeAndChildCallback, node);
            menu.AddItem(new GUIContent("复制分支"), false, OnCloneNodeAndChildCallback, node);
            menu.ShowAsContext();
        }

        public void OnRemoveNodeAndChildCallback(object obj)
        {
            Node node = (Node)obj;
            if (node != null)
            {
                node.RemoveSelf(true);
            }
        }

        public void OnRemoveNodeCallback(object obj)
        {
            Node node = (Node)obj;
            if (node!= null)
            {
                node.RemoveSelf();
            }
        }

        public void OnCloneNodeCallback(object obj)
        {
            Node node = (Node)obj;
            if (node != null)
            {
               Node _node=  node.Clone();
               _node.MovePosition(new Vector2(20, 20));
               AIDataMgr.Instance.AddNode(_node);

            }

        }

        public void OnCloneNodeAndChildCallback(object obj)
        {
            Node node = (Node)obj;
            if (node != null)
            {
                node.Clone(true);
            }
        }



        public void OnDestroy()
        {
            AIDataMgr.Instance.CleanUp();
            InspectorWindow.ClosweWindow();
        }

    }
}
