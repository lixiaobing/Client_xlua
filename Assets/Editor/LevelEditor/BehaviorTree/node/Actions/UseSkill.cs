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

        public override void OnInspector()
        {
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            attackType = Utils.EnumPopup<AttackType>("攻击类型", attackType);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系", relationalOperator);
            skillId = Utils.IntField("技能ID",skillId);
        }
    }
}