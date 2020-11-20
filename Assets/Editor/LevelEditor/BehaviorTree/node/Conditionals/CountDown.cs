using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("CD判定")]
    [Serializable]
    public class CountDown : Conditional
    {
        //变量名1
        public float time;
        //是否是进入
        public bool enter;

        public override void OnInspector()
        {
            base.OnInspector();
            time = Utils.FloatField("冷却时间(毫秒)",time);
            enter = Utils.Toggle("进入", enter);
        }
    }
}