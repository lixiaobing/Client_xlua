using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("控制触发器")]
    [Serializable]
    public class ControlTrigger : Action
    {
        //状态机ID
        public int triggerId;
        //状态机是否激活
        public bool enable;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(triggerId), triggerId, indent,newLine));
            sb.Append(ExportUtils.KV(nameof(enable), enable, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            triggerId = Utils.IntField("触发器ID",triggerId);
            enable = Utils.Toggle("激活", enable);
        }

    }
}