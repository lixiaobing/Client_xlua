﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckFightConfig : ConditionalConfig
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //是否是战斗状态
        public bool fight;
    }
}