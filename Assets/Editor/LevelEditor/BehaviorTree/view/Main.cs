using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
namespace hjcd.level.BehaviorTree
{

    public class Main : View
    {
        private Variable readyRemove;

        public override void OnDraw() {

            EditorGUILayout.BeginVertical(Utils.Style1,GUILayout.ExpandHeight(true));
            Utils.LabelField("AI编号", AIDataMgr.Instance.id.ToString());
            Utils.LabelField("AI名称", AIDataMgr.Instance.name);
            AIDataMgr.Instance.debug = Utils.Toggle("日志输出",AIDataMgr.Instance.debug);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("自定义变量");
            if (Utils.Button("新增", GUILayout.Width(100))) {
                AIDataMgr.Instance.AddVariable("c"+ AIDataMgr.Instance.variables.Count, 0);
            }
            EditorGUILayout.EndHorizontal();

            foreach (Variable var in AIDataMgr.Instance.variables) {

                /*                EditorGUILayout.BeginHorizontal();
                                EditorGUILayout.LabelField("变量名", GUILayout.Width(60));
                                var.name = EditorGUILayout.TextField(var.name);
                                EditorGUILayout.LabelField("变量值", GUILayout.Width(60));
                                var.value = EditorGUILayout.FloatField(var.value);
                                if (Utils.Button("删除", GUILayout.Width(100)))
                                {
                                    readyRemove = var;
                                }
                                EditorGUILayout.EndHorizontal();*/

                if (var.OnDraw2()) {
                    readyRemove = var;
                }
            }
            //移除处理
            if (readyRemove != null) {
                AIDataMgr.Instance.RemoveVariable(readyRemove);
            }

            EditorGUILayout.EndVertical();
        }
    }
}