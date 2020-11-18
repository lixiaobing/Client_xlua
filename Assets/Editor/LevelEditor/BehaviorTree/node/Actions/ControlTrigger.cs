using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("控制触发器")]
    [Serializable]
    public class ControlTrigger : Action
    {
        //状态机ID
        public int triggerId;
        //状态机是否激活
        public bool enable;

        public override void OnInspector()
        {
            triggerId = Utils.IntField("触发器ID",triggerId);
            enable = Utils.Toggle("激活", enable);
        }

    }
}