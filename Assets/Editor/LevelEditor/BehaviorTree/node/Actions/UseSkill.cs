using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("释放技能")]
    [Serializable]
    public class UseSkill : Action
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();

        //技能ID
        public int skillId;

        //关系比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        public AttackType attackType = AttackType.ALL;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(attackType), attackType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(skillId), skillId, indent,  newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            attackType = Utils.EnumPopup<AttackType>("攻击类型", attackType);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系", relationalOperator);
            skillId = Utils.IntField("技能ID",skillId);
        }
    }
}