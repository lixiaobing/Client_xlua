using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{


    [Serializable]
    public class AIModel
    {
        public int id; //行为树ID
        public string name = "默认名称";
        public int groupId; //分组ID
       
        public bool Draw(GroupWindow window) {
            EditorGUILayout.BeginHorizontal();
            Utils.Box(id.ToString(), GUILayout.MinWidth(60));
            Utils.Box(this.name, GUILayout.MinWidth(130));

            //修改分组
            /*            List<Group> groups = window.groupList.groups;
                        string[] options = new string[groups.Count];
                        int selectIndex = 0;
                        for (int index = 0; index < options.Length; index++)
                        {
                            options[index] = groups[index].name;
                            if (groups[index].id.Equals(groupId)) {
                                selectIndex = index;

                            }
                        }

                        selectIndex = EditorGUILayout.Popup(selectIndex, options);
                        this.groupId = groups[selectIndex].id; */

            GUILayoutOption width = GUILayout.Width(70);
            if (Utils.Button("打开", width))
            {
                window.OnOpenBehaviorTree(this);
            }

            if (Utils.Button("编辑", width))
            {
                window.OnEditBehaviorTree(this);
            }
            bool flag = false;
            if (Utils.Button("删除", width))
            {
                flag = true;
            }
            if (Utils.Button("复制", width))
            {
                window.OnCopyBehaviorTree(this);
            }
            if (Utils.Button("导出", width))
            {
                window.OnExportBehaviorTree(this);
            }
            EditorGUILayout.EndHorizontal();
            return flag;
        }
    }
}