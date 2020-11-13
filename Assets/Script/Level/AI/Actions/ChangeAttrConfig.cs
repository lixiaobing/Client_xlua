using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class ChangeAttrConfig : ActionConfig
    {
        public SelectTarget2Config selectTarget = new SelectTarget2Config();
        //百分比属性
        public AttrPercent attrPercent = AttrPercent.HP;
        //简单逻辑运算
        public SimpleArithmeticOperator simpleArithmeticOperator = SimpleArithmeticOperator.ADD;
        //百分比
        public int percent;
     
    }
}