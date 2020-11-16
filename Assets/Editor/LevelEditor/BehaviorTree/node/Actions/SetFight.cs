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
    [EnumDescription("设置战斗状态")]
    [Serializable]
    public class SetFight : Action
    {
        public SelectTarget2 selectTarget = new SelectTarget2();
        
        //是否战斗状态
        public bool fight;

        public override string ToStringEx(int indent,bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fight), fight, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            fight = Utils.Toggle("战斗状态", fight);
        }



    }
}