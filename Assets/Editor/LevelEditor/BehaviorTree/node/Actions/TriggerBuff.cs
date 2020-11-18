using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("触发BUFF")]
    [Serializable]
    public class TriggerBuff : Action
    {
        public int parameter;

        public override void OnInspector()
        {
            parameter = Utils.IntField("参数",parameter);
        }
    }
}