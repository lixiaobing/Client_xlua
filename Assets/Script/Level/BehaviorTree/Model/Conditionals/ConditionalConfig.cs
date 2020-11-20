using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class ConditionalConfig : NodeConfig
    {
        //是否监听
        public bool breakListen  = false;
        //打断优先级
        public int breakPriority = 1;
        //打断次数
        public int breakTimes    =  -1;
        //打断保护时间
        public float breakProtectTime = 0;
        //打断冷却时间
        public float breakCountDonwTime = 1000;

        //能否被别人打断
        public bool canBreakOther = false;
        //能否被自己打断
        public bool canBreakSelf = false;
    }
}