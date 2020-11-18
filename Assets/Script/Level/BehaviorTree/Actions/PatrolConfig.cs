using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class PatrolConfig : ActionConfig
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
    }
}