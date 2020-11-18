using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class CreateGroupWindow : EditorWindow
    {
        public static CreateGroupWindow instance;
        private Group group = new Group();
        public static EditorWindow OpenWindow(BehaviorTreeGroupWindow groupWindow)
        {

            if (instance != null) {
                instance.Close();
                instance = null;
            }
            CreateGroupWindow window   = EditorWindow.GetWindow<CreateGroupWindow>(true);
            window.titleContent = new GUIContent("创建分组");
            window.minSize = new Vector2(480, 200);
            window.maxSize = window.minSize;
            window.Show();
            window.groupWindow = groupWindow;
            window.group.id = groupWindow.groupList.globalGroupId;
            window.group.name = "分组" + window.group.id;
           instance = window;
            return window;
        }
        BehaviorTreeGroupWindow groupWindow;

        void OnGUI() {
            GUI.skin.font = LGUISkin.font;
            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginVertical(GUILayout.Height(170));
 
            Utils.LabelField("分组类型", group.id.ToString());

            group.name = Utils.TextField("分组名称", group.name);

            EditorGUILayout.EndVertical();

            if (Utils.Button("确定"))
            {
                if (string.IsNullOrEmpty(group.name)) {
                    Utils.LabelTip("请输入分组名称");
                    return ;
                }
                if (groupWindow != null) {
                    groupWindow.groupList.NextGlobalGroupID(); //
                    groupWindow.OnCreateAIGroup(group);
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