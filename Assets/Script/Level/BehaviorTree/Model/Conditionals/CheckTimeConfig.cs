using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckBattleTimeConfig : ConditionalConfig
    {
        //战斗开始时间
        public float time;

        public RelationalOperator relationalOperator;

      
    }
}