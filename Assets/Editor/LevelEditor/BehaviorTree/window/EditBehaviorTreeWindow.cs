using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class EditBehaviorTreeWindow : EditorWindow
    {
        public static EditBehaviorTreeWindow instance;
        private AIModel aIModel = new AIModel();
        private AIModel srcModel;
        public static EditorWindow OpenWindow(AIModel aIModel)
        {

            if (instance != null) {
                instance.Close();
                instance = null;
            }
            EditBehaviorTreeWindow window   = EditorWindow.GetWindow<EditBehaviorTreeWindow>(true);
            window.titleContent = new GUIContent("修改");
            window.minSize = new Vector2(480, 200);
            window.maxSize = window.minSize;
            window.Show();
            window.srcModel = aIModel;
            instance = window;

            window.aIModel.id = aIModel.id;
            window.aIModel.name = aIModel.name;
            window.aIModel.groupId = aIModel.groupId;
            return window;
        }
 /*       GroupWindow groupWindow;*/
        int newSelectIndex = 0;
        void OnGUI() {
            EditorGUILayout.BeginVertical(Utils.Style2, GUILayout.ExpandHeight(true));
            EditorGUILayout.BeginVertical(GUILayout.Height(160));
            
            aIModel.id   = Utils.IntField("id", aIModel.id);
            aIModel.name = Utils.TextField("名称", aIModel.name);

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("分组");
            GroupWindow groupWindow = GroupWindow.instance;
            List<Group> groups = GroupWindow.instance.groupList.groups;
            string[] options = new string[groups.Count];
            for (int index = 0; index < options.Length; index++)
            {
                options[index] = groups[index].name;
                if (groups[index].id == aIModel.groupId)
                {
                    newSelectIndex = index;

                }
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

     


                AIDataMgr.Edit_(srcModel,aIModel);
                srcModel.id = aIModel.id;
                srcModel.name = aIModel.name;
                srcModel.groupId = aIModel.groupId;

                if (groupWindow != null) //保存数据
                {
                    groupWindow.SaveAssets();
                }
                this.Close();
            }
     
            EditorGUILayout.EndVertical();
        }

        private void OnDestroy()
        {
            instance = null;
            BehaviorTreeMainWindow.ClosweWindow();
        }

        public static void ClosweWindow() {
            if (instance != null) {
                instance.Close();
                instance = null;
            }

        }
    }


}