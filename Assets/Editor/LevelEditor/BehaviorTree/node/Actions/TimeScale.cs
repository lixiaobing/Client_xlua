using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("TimeScale")]
    [Serializable]
    public class TimeScale : Action
    {
        public float timeScale = 1.0f;
        public float time    = 1000;

        public override void OnInspector()
        {
            timeScale = Utils.UFloatField("TimeScale", timeScale);
            time = Utils.FloatField("持续时间(毫秒)", time);
        }
    }
}