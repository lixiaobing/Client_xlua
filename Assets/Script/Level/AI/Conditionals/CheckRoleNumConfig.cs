using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
  
    public class CheckRoleNumConfig : ConditionalConfig
    {
        //目标选择类型
        public Camp camp = Camp.ENEMY;

        public RoleFightState roleFightState = RoleFightState.FIGHT;
        //人数
        public int num;
        //关系
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
       
    }
}