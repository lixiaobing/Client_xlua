using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("距离判定")]
    [Serializable]
    public class CheckDistance : Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //最大距离
        public float maxDistance;
        //最小距离
        public float minDistance;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(selectTarget.ToLuaString( indent, newLine));
            sb.Append(ExportUtils.KV(nameof(maxDistance), maxDistance, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(minDistance), minDistance, indent, newLine));
            return sb.ToString();
        }


        public override void OnInspector()
        {
            base.OnInspector();
            Utils.DrawSelectTarget2("目标选择", selectTarget);
/*          minDistance = Utils.IntField("最小距离",minDistance);
            maxDistance = Utils.IntField("最大距离",maxDistance);*/
    
            EditorGUILayout.LabelField("距离范围");
            EditorGUILayout.BeginHorizontal();
            minDistance = EditorGUILayout.FloatField(minDistance);
            maxDistance = EditorGUILayout.FloatField(maxDistance);
            EditorGUILayout.EndHorizontal();


        }
    }
}