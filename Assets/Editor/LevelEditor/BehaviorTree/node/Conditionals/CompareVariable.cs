using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("变量比较")]
    [Serializable]
    public class CompareVariable : Conditional
    {
        //变量名1
        public Variable var1 = new Variable();
        //变量名2
        public Variable var2 = new Variable();
        //关系运算
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;

        public override void OnInspector()
        {
            base.OnInspector();

            Utils.DrawVariable1(var1,"变量1");
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("关系");
            relationalOperator = Utils.DrawPopup<RelationalOperator>(relationalOperator);
            EditorGUILayout.EndHorizontal();
            Utils.DrawVariable1(var2, "变量2");
        }
    }
}