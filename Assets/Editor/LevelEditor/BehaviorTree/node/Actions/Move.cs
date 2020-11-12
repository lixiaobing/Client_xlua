using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("向目标位置移动")]
    [Serializable]
    public class Move : Action
    {
        public SelectTarget2 selectTarget = new SelectTarget2();
        //移动类型
        public MoveType moveType = MoveType.WALK;
        //移动速度
        public float speed;
        //移动最长时间（超时终止）
        public float maxTime;
        //与目标的最大距离(小于这个距离完成)
        public float distance;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(moveType), moveType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(speed), speed, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(maxTime), maxTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(distance), distance, indent, newLine));
            return sb.ToString();
        }
        public override void OnInspector()
        {
            selectTarget.OnDraw();
            moveType = Utils.EnumPopup<MoveType>("移动方式", moveType);
            speed = Utils.UFloatField("移动速度",speed);
            maxTime = Utils.UFloatField("終止时间(毫秒)", maxTime);
            distance = Utils.UFloatField("最大距离", distance);
        }
    }
}