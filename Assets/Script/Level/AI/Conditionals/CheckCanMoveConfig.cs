using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CheckCanMoveConfig : ConditionalConfig
    {

        //角度
        public float angle;
        //范围
        public float distance;
        
       
    }
}