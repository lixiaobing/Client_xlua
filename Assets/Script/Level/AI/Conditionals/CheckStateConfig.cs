using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckStateConfig : ConditionalConfig
    {
        //目标选择类型
        public SelectTarget2Config selectTarget = new SelectTarget2Config();
        //状态ID
        public RoleState state = RoleState.IDLE ;

        
    }
}