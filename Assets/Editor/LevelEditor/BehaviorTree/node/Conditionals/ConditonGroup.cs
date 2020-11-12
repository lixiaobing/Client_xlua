using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("条件组")]
    [Serializable]
    public class ConditonGroup : Conditional 
    {
        //private bool foldout = true;
        public List<string> condtions = new List<string>();
        public override string ToStringEx(int indent, bool newLine)
        {
            //移除
            for (int i = condtions.Count -1; i >0 ; i--)
            {
                string uuid = condtions[i];
                Node node = AIDataMgr.Instance.GetNode(uuid);
                if (node == null)
                {
                    condtions.RemoveAt(i);
                    //Utils.Log("uuid:"+ uuid);
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(ExportUtils.KV_LIST_VALUE<string>(nameof(condtions), condtions, indent, newLine,true));
            return sb.ToString();
        }

        public override void OnInspector() {

            base.OnInspector();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.Foldout(true, "条件列表");
            if (Utils.Button("添加")) {
                ShowAddMenu();
            }
            EditorGUILayout.EndHorizontal();
            //Utils.LabelField("条件列表");
            EditorGUILayout.BeginVertical(GUI.skin.box,GUILayout.MinHeight(100));
            string removeItem = null;
            foreach (var item in condtions)
            {
                Node node = AIDataMgr.Instance.GetNode(item);
                if (node != null)
                {
                    EditorGUILayout.BeginHorizontal();
                    EditorGUILayout.LabelField(node.Description+node.getSimpleUUID());
                    if (Utils.Button("删除"))
                    {
                        removeItem = item;
                    }
                    EditorGUILayout.EndHorizontal();
                }
                else
                {
                    removeItem = item;
                }
            }
            EditorGUILayout.EndVertical();
            if (removeItem != null) {
                this.condtions.Remove(removeItem);
            }
        }

        public bool isCondtion(Node node) {

            //            if (!this.Type.Equals(_type))
            //            {
            foreach (var item in NodeType.conditionals)
                {
                    if (this.uuid != node.uuid) {
                        if (node.Type.Equals(item.Name))
                        {
                            return true;
                        }
                    }

                }
        //    }
            return false;
        }

        public void ShowAddMenu()
        {

            UnityEditor.GenericMenu menu = new GenericMenu();
            foreach (var item in AIDataMgr.Instance.nodes)
            {
                if (isCondtion(item)) {
                    if (!this.condtions.Contains(item.uuid))
                    {
                        menu.AddItem(new GUIContent(item.Description + item.getSimpleUUID()), false, OnAdd, item.uuid);
                    }
                }
            }
            menu.ShowAsContext();
        }
        private void OnAdd(object obj) {
            string uuid = obj.ToString();
            condtions.Add(uuid);
        }
    }
}