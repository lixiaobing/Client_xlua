﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    public class ChangeBuffConfig : ActionConfig
    {
        public SelectTarget2 selectTarget = new SelectTarget2();
        //增加/删除
        public TargetOperator targetOperator = TargetOperator.ADD;
        
        //buffId
        public int buffId;

    }
}