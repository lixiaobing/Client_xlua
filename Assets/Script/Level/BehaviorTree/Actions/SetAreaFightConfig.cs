using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class SetAreaFightConfig : ActionConfig
    {
        public Camp camp  = Camp.FRIEND;
        public float radius = 1;
        //是否战斗状态
        public bool fight = true;
    }
}