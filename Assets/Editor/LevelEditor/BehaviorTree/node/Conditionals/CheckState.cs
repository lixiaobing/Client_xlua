using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("状态判定")]
    [Serializable]
    public class CheckState : Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //状态ID
        public RoleState state = RoleState.IDLE ;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(state), state, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            base.OnInspector();
            selectTarget.OnDraw();
            state = Utils.EnumPopup<RoleState>("状态",state); 
        }
    }
}