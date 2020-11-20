using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("指定朝向移动")]
    [Serializable]
    public class MoveDir : Move
    {
        public Dir dir = Dir.LEFT;

        public override string Description {
            get { 
                return Utils.GetDescription(this.GetType())+"("+ Utils.GetDescription(dir) +")"; 
            } 
        }

        public override void OnInspector()
        {
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            dir = Utils.EnumPopup<Dir>("方向", dir);
            speed = Utils.UFloatField("移动速率", speed);
            maxTime = Utils.FloatField("終止时间(毫秒)", maxTime);
            if (dir == Dir.BACK)
            {
                distance = Utils.FloatField("最小距离", distance);
            }
            else if (dir == Dir.FRONT)
            {
                distance = Utils.FloatField("最大距离", distance);
            }
        }
    }
}