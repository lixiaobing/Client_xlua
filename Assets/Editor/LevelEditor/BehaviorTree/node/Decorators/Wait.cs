using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("等待节点")]
    [Serializable]
    public class Wait : Decorator 
    {
        public float waitTime = 0;

        public override void OnInspector()
        {
            waitTime = Utils.FloatField("等待时间",waitTime);
        }
    }
}