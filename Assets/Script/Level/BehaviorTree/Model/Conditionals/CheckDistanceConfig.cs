﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckDistanceConfig : ConditionalConfig
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //最大距离
        public float maxDistance;
        //最小距离
        public float minDistance;

       
    }
}