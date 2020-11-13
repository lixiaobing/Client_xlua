using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CompareVariableConfig : ConditionalConfig
    {
        //变量名1
        public VariableConfig var1 = new VariableConfig();
        //变量名2
        public VariableConfig var2 = new VariableConfig();
        //关系运算
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;

       
    }
}