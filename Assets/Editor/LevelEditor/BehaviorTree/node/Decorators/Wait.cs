using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("等待节点")]
    [Serializable]
    public class Wait : Decorator 
    {
        public float waitTime = 0;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(waitTime), waitTime, indent,newLine));
            return sb.ToString();
        }
        public override void OnInspector()
        {
            waitTime = Utils.FloatField("等待时间",waitTime);
        }
    }
}