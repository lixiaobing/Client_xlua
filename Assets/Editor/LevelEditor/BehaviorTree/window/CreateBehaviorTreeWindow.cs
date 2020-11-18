using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class CreateBehaviorTreeWindow : EditorWindow
    {
        public static CreateBehaviorTreeWindow instance;
        private Model aIModel = new Model();
        public static EditorWindow OpenWindow(BehaviorTreeGroupWindow groupWindow)
        {

            if (instance != null) {
                instance.Close();
                instance = null;
            }
            CreateBehaviorTreeWindow window   = EditorWindow.GetWindow<CreateBehaviorTreeWindow>(true);
            window.titleContent = new GUIContent("创建行为树");
            window.minSize = new Vector2(480, 200);
            window.maxSize = window.minSize;
            window.Show();
            window.groupWindow = groupWindow;
            instance = window;

            window.aIModel.id = groupWindow.groupList.globalBehaviorTreeId;
            window.aIModel.name = "未命名" + window.aIModel.id;
            return window;
        }
        BehaviorTreeGroupWindow groupWindow;
        int newSelectIndex = 0;
        void OnGUI() {
            GUI.skin.font = LGUISkin.font;
            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginVertical(GUILayout.Height(170));

            Utils.LabelField("id","" +aIModel.id);
            aIModel.name = Utils.TextField("名称", aIModel.name);

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("分组");
            List<Group> groups = groupWindow.groupList.groups;
            string[] options = new string[groups.Count];
            for (int index = 0; index < options.Length; index++)
            {
                options[index] = groups[index].name;
            }
            newSelectIndex = EditorGUILayout.Popup(newSelectIndex, options);
            aIModel.groupId = groups[newSelectIndex].id;
            EditorGUILayout.EndHorizontal();

       
            EditorGUILayout.EndVertical();
                  
            if (Utils.Button("确定"))
            {
                if (string.IsNullOrEmpty(aIModel.name)) {
                    Utils.LabelTip("请输入分组名称");
                    return ;
                }
                if (groupWindow != null) {
                    groupWindow.groupList.NextGlobalBehaviorTreeID();
                    groupWindow.OnCreateBehaviorTree(aIModel);
                    groupWindow.Repaint();
                }
                this.Close();
            }
     
            EditorGUILayout.EndVertical();
        }

        private void OnDestroy()
        {
            instance = null;
        }
    }


}