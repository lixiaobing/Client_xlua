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

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));

            sb.Append(ExportUtils.K(nameof(var1), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(var1.ToLuaString(0, false));
            sb.Append(ExportUtils.Comma);


            sb.Append(ExportUtils.KV(nameof(value), value, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            return sb.ToString();
        }
        public override void OnInspector()
        {
            base.OnInspector();
            var1.OnDraw1("变量1");
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("关系");
            relationalOperator = Utils.DrawPopup<RelationalOperator>(relationalOperator);
            EditorGUILayout.EndHorizontal();
            value = Utils.FloatField("参考值", value);

        }
    }
}