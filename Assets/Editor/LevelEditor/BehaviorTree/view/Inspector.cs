using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
namespace hjcd.level.BehaviorTree
{

    public class Inspector : View
    {

        public override void OnDraw()
        {
            EditorGUILayout.BeginVertical(LGUISkin.Style1, GUILayout.ExpandHeight(true));
            if (BehaviorTree.Instance != null) {
                DrawObject drawObject = BehaviorTree.Instance.Focus();
                if (drawObject != null)
                {
                    drawObject.OnInspectorDraw();
                }
                else
                {
                    Utils.LabelTip("点击选中节点查看属性");
                }
            }
            EditorGUILayout.EndVertical();

        }
    }
}