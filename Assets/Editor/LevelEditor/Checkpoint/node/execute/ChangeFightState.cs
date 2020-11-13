using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("改变战斗状态")]
    public class ChangeFightState: ExecuteNode
    {
        //战斗状态
        public bool fight;
        public SelectTarget selectTargetType = new SelectTarget();
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(selectTargetType.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fight), fight, indent, newLine));
            return sb.ToString();
        }
        public override void OnDraw()
        {
            base.OnDraw();
            CreateObject();
            delayTime = Utils.FloatField("延迟", delayTime);
            selectTargetType = Utils.DrawSelectTarget("目标选择",selectTargetType);
            fight = Utils.Toggle("战斗状态", fight);
        }



    }
}
    