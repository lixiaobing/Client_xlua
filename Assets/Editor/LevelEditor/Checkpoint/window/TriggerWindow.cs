using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.CheckPoint
{
    public class TriggerWindow : BaseWindow
    {
        public static TriggerWindow Instance;
 

        public static void CloseWindow()
        {
            if (Instance != null)
            {
                Instance.Close();
                Instance = null;
            }
        }
        public TriggerWindow()
        {
            Instance = this;
        }
        public Trigger trigger = new Trigger();
        public override void Initlize(params object[] obj)
        {
            trigger = (Trigger)obj[0];
            this.TitleContent = "触发器编辑";
            this.minSize = new Vector2(900, 600);
            this.maximized = true;
            //注册监听器
            EventCenter.GetInstance(EventCenterType.CPEditor).RegisterListener(MessageType.REMOVE_NODE, OnRemoveNode);
            EventCenter.GetInstance(EventCenterType.CPEditor).RegisterListener(MessageType.REPAINT, DoRepaint);

        }

        void OnGUI()
        {
            GUI.skin.font = Utils.font;
            EditorGUILayout.BeginHorizontal();

            DrawTriggers();

            DrawInspector();

            EditorGUILayout.EndHorizontal();
        }

        public void DrawInspector()
        {
            EditorGUILayout.BeginVertical(Utils.Style1, GUILayout.ExpandHeight(true), GUILayout.ExpandWidth(true));
            if (focus != null)
            {
                focus.OnDraw();
            }
            else
            {
                Utils.LabelTip("点击选择元件进行编辑");

            }
            EditorGUILayout.EndVertical();

        }
        Node focus;

        public bool IsFoucused(Node node) {
            return node == focus;
        }
        public void DrawTriggers()
        {


            EditorGUILayout.BeginVertical(Utils.Style1, GUILayout.ExpandHeight(true), GUILayout.Width(300));


            Utils.LabelField("触发器编号", trigger.id.ToString());
            trigger.groupId    = Utils.IntField("分组", trigger.groupId);
            trigger.orderIndex = Utils.IntField("排序索引", trigger.orderIndex);
            trigger.loopTimes = Utils.IntField("触发次数", trigger.loopTimes);
            trigger.enable    = Utils.Toggle("激活状态", trigger.enable);
            trigger.unlimited = Utils.Toggle("开战之前执行", trigger.unlimited);
            trigger.desc = EditorGUILayout.TextArea(trigger.desc, GUILayout.MinHeight(60));
            trigger.desc = trigger.desc.Replace("\r", "");
            trigger.desc = trigger.desc.Replace("\n", "");
            trigger.desc = trigger.desc.Trim();
            /////////////////////////////////////////////////////////

            EditorGUILayout.BeginVertical(Utils.Style1);
            EditorGUILayout.BeginHorizontal();
            this.extends[0] = EditorGUILayout.Foldout(this.extends[0], "触发器");
            if (Utils.Button("选择", GUILayout.MaxWidth(100)))
            {
                ShowCreateTriggerMenu();
            }
            EditorGUILayout.EndHorizontal();
            if (this.extends[0])
            {
                foreach (var item in trigger.triggerNodes)
                {
                    if (Utils.EventLabel(item.Description, IsFoucused(item), GUILayout.ExpandWidth(true), GUILayout.Height(20)))
                    {
                        focus = item;
                        item.DoFocus();

                    }
                }
            }
            EditorGUILayout.EndVertical();
            /////////////////////////////////////////////////////////
            EditorGUILayout.BeginVertical(Utils.Style1);
            EditorGUILayout.BeginHorizontal();
            this.extends[1] = EditorGUILayout.Foldout(this.extends[1], "判断条件");
            if (Utils.Button("新增", GUILayout.MaxWidth(100)))
            {
                ShowCreateCondtionMenu();
            }
            EditorGUILayout.EndHorizontal();
            if (this.extends[1])
            {
                ConditionNode remove_condtionNode = null;
                foreach (var item in trigger.conditionNodes)
                {
                    EditorGUILayout.BeginHorizontal();
                    if (Utils.EventLabel(item.Description, item == focus, GUILayout.ExpandWidth(true), GUILayout.Height(20)))
                    {
                        focus = item;
                        item.DoFocus();
                    }
                    if (Utils.Button("刪除", GUILayout.MaxWidth(100)))
                    {
                        remove_condtionNode = item;

                    }
                    EditorGUILayout.EndHorizontal();
                }
                //移除操作
                if (remove_condtionNode != null)
                {
                    trigger.RemoveCondtionNode(remove_condtionNode);
                    remove_condtionNode.Destroy();
                    remove_condtionNode = null;
                }
            }
            EditorGUILayout.EndVertical();
            ///////////////////////////////////////////////////////// 
            EditorGUILayout.BeginVertical(Utils.Style1);
            EditorGUILayout.BeginHorizontal();
            this.extends[2] = EditorGUILayout.Foldout(this.extends[2], "执行事件");
            if (Utils.Button("新增", GUILayout.MaxWidth(100)))
            {
                ShowCreateExecuteMenu();
            }
            EditorGUILayout.EndHorizontal();
            if (this.extends[2])
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("执行类型");
                trigger.triggerExecutType = Utils.DrawPopup<TriggerExecutType>(trigger.triggerExecutType);
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("随机事件数量");
                trigger.excuteNum = EditorGUILayout.IntField(trigger.excuteNum);
                EditorGUILayout.EndHorizontal();

                ExecuteNode remove_executeNode = null;
                int moveDownIndex = -1;
                for (int i = 0; i < trigger.executeNodes.Count; i++)
                {
                    ExecuteNode item = trigger.executeNodes[i];
                    EditorGUILayout.BeginHorizontal();
                    if (Utils.EventLabel(item.Description, item== focus, GUILayout.ExpandWidth(true),GUILayout.MinWidth(200), GUILayout.Height(20)))
                    {
                        focus = item;
                        item.DoFocus();
                    }


                    if (Utils.Button(item.enable ? "已激活" : "未激活", item.enable ? Color.yellow : Color.red, GUILayout.MaxWidth(100)))
                    {
                        item.enable = !item.enable;
                    }

                    if (Utils.Button("下移", GUILayout.MaxWidth(100)))
                    {
                        moveDownIndex = i;
                    }

                    if (Utils.Button("刪除", GUILayout.MaxWidth(100)))
                    {
                        remove_executeNode = item;
                    }
                    EditorGUILayout.EndHorizontal();
                }
                //下移操作
                if (moveDownIndex != -1) {
                    ExecuteNode tempNode = trigger.executeNodes[moveDownIndex];
                    int nextIndex = (moveDownIndex + 1) % trigger.executeNodes.Count;  //10  0-9
                    trigger.executeNodes[moveDownIndex] = trigger.executeNodes[nextIndex];
                    trigger.executeNodes[nextIndex] = tempNode;
                }
                //移除操作
                if (remove_executeNode != null)
                {
                    trigger.RemoveExecutNode(remove_executeNode);
                    remove_executeNode.Destroy();
                    remove_executeNode = null;
                }

            }
            EditorGUILayout.EndVertical();

            EditorGUILayout.EndVertical();

        }

        public void ShowCreateTriggerMenu()
        {
            ShowMenu(NodeType.triggers, OnAddTriggerNodeCallback);
        }

        public void ShowCreateExecuteMenu()
        {
            UnityEditor.GenericMenu menu = new GenericMenu();
            var executeDic = NodeType.GetExecuteDic();
            foreach (var item in executeDic)
            {
                foreach (Type type in item.Value)
                {
                    menu.AddItem(new GUIContent(item.Key+"/" + Utils.GetDescription(type)), false, OnAddExecuteNodeCallback, type.FullName);
                }
            }
            menu.ShowAsContext();
        }
        public void ShowCreateCondtionMenu()
        {
            ShowMenu(NodeType.conditionals, OnAddCondtionNodeCallback);
        }
        public void ShowMenu(Type[] types, GenericMenu.MenuFunction2 function)
        {
            UnityEditor.GenericMenu menu = new GenericMenu();
            foreach (Type type in types)
            {
                menu.AddItem(new GUIContent(Utils.GetDescription(type)), false, function, type.FullName);
            }
            menu.ShowAsContext();
        }

        public void OnAddTriggerNodeCallback(object obj)
        {
            TriggerNode node = Utils.CreateInstance<TriggerNode>(obj.ToString());
            node.Parent = this.trigger;
            node.CreateObject();
            node.DoFocus();
            trigger.AddTriggerNode(node);
            focus = node;
        }

        public void OnAddCondtionNodeCallback(object obj)
        {
            ConditionNode node = Utils.CreateInstance<ConditionNode>(obj.ToString());
            node.Parent = this.trigger;
            node.CreateObject();
            node.DoFocus();
            trigger.AddCondtionNode(node);
            focus = node;
        }

        public void OnAddExecuteNodeCallback(object obj)
        {
            ExecuteNode node = Utils.CreateInstance<ExecuteNode>(obj.ToString());
            node.Parent = this.trigger;
            node.CreateObject();
            node.DoFocus();
            trigger.AddExecuteNode(node);
            focus = node;
        }

        /*        float m_lastUpdateTime;
                private void Update(){
                    float curTime = Time.realtimeSinceStartup;
                    float dt = curTime - m_lastUpdateTime;
                    m_lastUpdateTime = Time.realtimeSinceStartup;

                }*/

        public void OnRemoveNode(EventCallBack eventCall)
        {
            if (eventCall.Sender == focus)
            {
                focus = null;
            }
        }


        void DoRepaint(EventCallBack eventCall)
        {
            this.Repaint();

        }
        public override void OnDestroyImp()
        {
            Debug.Log("OnDestroyImp");
            EventCenter.GetInstance(EventCenterType.CPEditor).RemoveListener(MessageType.REMOVE_NODE, OnRemoveNode);
            EventCenter.GetInstance(EventCenterType.CPEditor).RemoveListener(MessageType.REPAINT, DoRepaint);
        }
    }
}