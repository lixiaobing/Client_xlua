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
                Node node = BehaviorTree.Instance.GetNode(item);
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
            foreach (var item in BehaviorTree.Instance.nodes)
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