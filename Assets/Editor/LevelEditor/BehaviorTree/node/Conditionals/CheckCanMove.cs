using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("是否可以移动")]
    [Serializable]
    public class CheckCanMove : Conditional
    {

        //角度
        public float angle;
        //范围
        public float distance;
        
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(angle), angle, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(distance), distance, indent, newLine));
            return sb.ToString();
        }


        public override void OnInspector()
        {
            base.OnInspector();
            angle = Utils.FloatField("角度", angle);
            distance = Utils.FloatField("距离", distance);
        }
    }
}