using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckVariableConfig : ConditionalConfig
    {
        //变量名1
        public VariableConfig var1 = new VariableConfig();
        //比较的变量值
        public float value = 0;
        //关系运算
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;

        
    }
}