using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    [Serializable]
    public class Variable : ScriptableObject
    {
        //是否是共享变量
        public bool share = false;
        //变量名
        public string name;
        //变量值
        public float value;
        public VariableChangeType changgeType = VariableChangeType.None;
        //变化间隔
        public float interval = 1f;
        //变化值
        public float changeValue = 0f;
        public float minValue = 0f;
        public float maxValue = 1f;
    }
}