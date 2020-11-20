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

        public override void OnInspector()
        {
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            moveType = Utils.EnumPopup<MoveType>("移动方式", moveType);
            speed = Utils.UFloatField("移动速度",speed);
            maxTime = Utils.UFloatField("終止时间(毫秒)", maxTime);
            distance = Utils.UFloatField("最大距离", distance);
        }
    }
}