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

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));

            sb.Append(ExportUtils.K(nameof(var1), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(var1.ToLuaString(0, false));
            sb.Append(ExportUtils.Comma);

            sb.Append(ExportUtils.K(nameof(var2), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(var2.ToLuaString(0, false));
            sb.Append(ExportUtils.Comma);

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
            var2.OnDraw1("变量2");

        }
    }
}