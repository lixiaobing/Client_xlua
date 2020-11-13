using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class MoveToConfig : ActionConfig
    {
        public List<Vector3> positions = new List<Vector3>();
        //移动速度
        public float speed    = 4;
        //最大移动时间
        public int loopTimes=-1;
        //移动类型
        public MoveType moveType = MoveType.WALK;
    }
}