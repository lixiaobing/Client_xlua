using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class UseSkillConfig : ActionConfig
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //技能ID
        public int skillId;
        //关系比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        public AttackType attackType = AttackType.ALL;
    }
}