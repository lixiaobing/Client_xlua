using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    public class MoveConfig : ActionConfig
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
      
    }
}