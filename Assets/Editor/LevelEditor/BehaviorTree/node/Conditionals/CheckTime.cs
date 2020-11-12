using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("战斗时间判定")]
    [Serializable]
    public class CheckBattleTime : Conditional
    {
        //战斗开始时间
        public float time;

        public RelationalOperator relationalOperator;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(time), time, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            base.OnInspector();
            time = Utils.FloatField("时间", time);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系", relationalOperator);
        }
    }
}