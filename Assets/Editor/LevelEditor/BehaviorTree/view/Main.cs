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

            EditorGUILayout.BeginVertical(LGUISkin.Style1,GUILayout.ExpandHeight(true));
            Utils.LabelField("AI编号", BehaviorTree.Instance.id.ToString());
            Utils.LabelField("AI名称", BehaviorTree.Instance.name);
            BehaviorTree.Instance.debug = Utils.Toggle("日志输出",BehaviorTree.Instance.debug);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("自定义变量");
            if (Utils.Button("新增", GUILayout.Width(100))) {
                BehaviorTree.Instance.AddVariable("c"+ BehaviorTree.Instance.variables.Count, 0);
            }
            EditorGUILayout.EndHorizontal();

            foreach (Variable var in BehaviorTree.Instance.variables) {                
                if (Utils.DrawVariable2(var)) {
                    readyRemove = var;
                }
            }
            //移除处理
            if (readyRemove != null) {
                BehaviorTree.Instance.RemoveVariable(readyRemove);
            }

            EditorGUILayout.EndVertical();
        }
    }
}