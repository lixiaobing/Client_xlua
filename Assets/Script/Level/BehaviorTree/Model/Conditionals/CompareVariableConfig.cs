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
        public Variable var1 = new Variable();
        //变量名2
        public Variable var2 = new Variable();
        //关系运算
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;

       
    }
}