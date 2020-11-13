using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class ControlTriggerConfig : ActionConfig
    {
        //状态机ID
        public int triggerId;
        //状态机是否激活
        public bool enable;
    }
}