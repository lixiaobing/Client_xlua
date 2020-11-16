using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    //改变Buff
    [EnumDescription("改变buff")]
    [Serializable]
    public class ChangeBuff : Action
    {
        public SelectTarget2 selectTarget = new SelectTarget2();

        //增加/删除
        public TargetOperator targetOperator = TargetOperator.ADD;
        
        //buffId
        public int buffId;

        public override string ToStringEx(int indent,bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(targetOperator), targetOperator, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(buffId), buffId, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            //Utils.DrawSelectTarget2("目标选择", selectTarget);
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            targetOperator = Utils.EnumPopup<TargetOperator>("操作",targetOperator);
            buffId = Utils.IntField("BuffID",buffId);
        }



    }
}