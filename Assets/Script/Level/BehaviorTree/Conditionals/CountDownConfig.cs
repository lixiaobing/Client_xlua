using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CountDownConfig : ConditionalConfig
    {
        //变量名1
        public float time;
        //是否是进入
        public bool enter;

        
    }
}