using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{


    [Serializable]
    public class Model
    {
        public int id; //行为树ID
        public string name = "默认名称";
        public int groupId; //分组ID
       
        public bool Draw(GroupWindow window) {
            EditorGUILayout.BeginHorizontal();
            Utils.Box(id.ToString(), GUILayout.MinWidth(60));
            Utils.Box(this.name, GUILayout.MinWidth(140));

            GUILayoutOption width = GUILayout.MinWidth(60);
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
                window.OnCopyModel(this);
            }
            if (Utils.Button("导出", width))
            {
                window.OnExportBehaviorTree(this);
            }
            if (Utils.Button("导出怪物", width))
            {
                window.OnExportMonster(this);
            }

            EditorGUILayout.EndHorizontal();
            return flag;
        }
    }
}