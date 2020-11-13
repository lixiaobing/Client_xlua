using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckAngleConfig : ConditionalConfig
    {
        //目标选择类型
        public SelectTarget2Config selectTarget = new SelectTarget2Config();
        //夹角
        public float angle;   //当前面向角度为0作为参照
        //半径
        public float radius;

    }
}