using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("联动")]
    [Serializable]
    public class Linkage : Conditional
    {
        public int group = 0;  
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(group), group, indent, newLine));

            return sb.ToString();
        }
        public override void OnInspector()
        {
            base.OnInspector();
            group = Utils.IntField("怪物组编号", group);

        }
    }
}