using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("定义或赋值变量")]
    [Serializable]
    public class ChangeVariable : Action
    {
        //简单逻辑运算
        public SimpleArithmeticOperator simpleArithmeticOperator = SimpleArithmeticOperator.ADD;
        //变量名
        public string varName ="var";
        //变量值
        public float value  = 0;
        //是否是共享变量
        public bool share = false;
       


        public override void OnInspector()
        {
            share = Utils.Toggle("共享", share);
            varName = Utils.TextField("变量名",varName);
            simpleArithmeticOperator = Utils.EnumPopup<SimpleArithmeticOperator>("改变",simpleArithmeticOperator);
            value = EditorGUILayout.FloatField("变量值",value);
        }




    }
}