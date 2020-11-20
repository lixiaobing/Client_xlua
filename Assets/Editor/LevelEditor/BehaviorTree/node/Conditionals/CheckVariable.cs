using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("检查变量值")]
    [Serializable]
    public class CheckVariable : Conditional
    {
        //变量名1
        public Variable var1 = new Variable();
        //比较的变量值
        public float value = 0;
        //关系运算
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;

        public override void OnInspector()
        {
            base.OnInspector();
            Utils.DrawVariable1(var1, "变量");
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("关系");
            relationalOperator = Utils.DrawPopup<RelationalOperator>(relationalOperator);
            EditorGUILayout.EndHorizontal();
            value = Utils.FloatField("参考值", value);

        }
    }
}