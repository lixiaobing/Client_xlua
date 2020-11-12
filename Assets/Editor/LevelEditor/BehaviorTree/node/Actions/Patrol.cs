using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("巡逻")]
    [Serializable]
    public class Patrol : Action
    {
        //移动次数
        public int times  = 3;
        //移动速度
        public float speed  = 4;
        //范围(初始位置为中心的半径的圆形)
        public float radius = 2;
        //每次移动停留时间
        public float stayTime = 1000;
        //每次移动的最小距离
        public float minDistance;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(times), times, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(speed), speed, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(stayTime), stayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(radius), radius, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(minDistance), minDistance, indent, newLine));
            return sb.ToString();
        }
        public override void OnInspector()
        {
            times       = Utils.IntField("移动次数", times);
            speed       = Utils.UFloatField("移动速率", speed);
            radius      = Utils.UFloatField("范围(初始位置为中心的半径的圆)", radius);
            stayTime    = Utils.UFloatField("每次移动停留时间(毫秒)", stayTime);
            minDistance = Utils.UFloatField("每次移动的最小距离", minDistance);
        }
    }
}