using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckAttrPercentConfig : ConditionalConfig
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();

        //百分比属性
        public AttrPercent attrPercent = AttrPercent.HP;
        //比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        //百分比值
        public float attrPercentValue = 0;

        


    }
}