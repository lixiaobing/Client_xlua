using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("循环节点")]
    [Serializable]
    public class Repeat : Decorator 
    {
        public int repeatTimes = -1;

        public override void OnInspector()
        {
            repeatTimes = Utils.IntField("循环次数",repeatTimes);
 
        }
    }
}