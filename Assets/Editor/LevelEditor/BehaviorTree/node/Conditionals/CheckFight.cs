using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("战斗判定")]
    [Serializable]
    public class CheckFight: Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //是否是战斗状态
        public bool fight;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fight), fight, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            base.OnInspector();
            selectTarget.OnDraw();
            fight = Utils.Toggle("战斗状态", fight); 
        }
    }
}