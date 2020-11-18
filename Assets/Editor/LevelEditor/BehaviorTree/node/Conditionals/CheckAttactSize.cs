using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("攻击人数判定")]
    [Serializable]
    public class CheckAttactSize : Conditional
    {

        //关系比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        public AttackType attackType = AttackType.ALL;


        public override void OnInspector()
        {
            base.OnInspector();
            attackType = Utils.EnumPopup<AttackType>("攻击类型", attackType);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系",relationalOperator);

        }
    }
}