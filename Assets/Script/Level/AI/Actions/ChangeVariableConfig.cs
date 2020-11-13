using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class ChangeVariableConfig : ActionConfig
    {
        //简单逻辑运算
        public SimpleArithmeticOperator simpleArithmeticOperator = SimpleArithmeticOperator.ADD;
        //变量名
        public string varName ="var";
        //变量值
        public float value  = 0;
        //是否是共享变量
        public bool share = false;
      
    }
}