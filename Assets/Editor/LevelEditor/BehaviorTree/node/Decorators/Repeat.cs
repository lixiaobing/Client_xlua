using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("循环节点")]
    [Serializable]
    public class Repeat : Decorator 
    {
        public int repeatTimes = -1;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(repeatTimes), repeatTimes, indent,newLine));
            return sb.ToString();
        }
        public override void OnInspector()
        {
            repeatTimes = Utils.IntField("循环次数",repeatTimes);
 
        }
    }
}