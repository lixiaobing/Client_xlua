using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("技能CD判定(是否可用)")]
    [Serializable]
    public class CheckSkillCountDown : Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //技能ID
        public int skillId;
   
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(selectTarget.ToLuaString( indent, newLine));
            sb.Append(ExportUtils.KV(nameof(skillId), skillId, indent, newLine));
            return sb.ToString();
        }


        public override void OnInspector()
        {
            base.OnInspector();
            selectTarget.OnDraw();
            skillId = Utils.UIntField("技能ID", skillId);
        }
    }
}