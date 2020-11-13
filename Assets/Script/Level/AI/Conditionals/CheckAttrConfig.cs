using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckAttrConfig : ConditionalConfig
    {
        //目标选择类型
        public SelectTarget2Config selectTarget = new SelectTarget2Config();

        //百分比属性
        public Attr attr = Attr.HP;
        //比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        //百分比值
        public float attrValue = 0;
    }
}