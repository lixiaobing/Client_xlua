using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("逃跑")]
    [Serializable]
    public class Escape : Move
    {
        public override void OnInspector()
        {
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            speed = Utils.UFloatField("移动速率", speed);
            maxTime = Utils.UFloatField("終止时间(毫秒)", maxTime);
            distance = Utils.UFloatField("最小距离", distance);
        }
    }
}