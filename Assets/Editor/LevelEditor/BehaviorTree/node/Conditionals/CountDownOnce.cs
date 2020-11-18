using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("单次CD判定")]
    [Serializable]
    public class CountDownOnce : Conditional
    {
        //变量名1
        public float time;

        public override void OnInspector()
        {
            base.OnInspector();
            time = Utils.FloatField("冷却时间(毫秒)",time);
        }
    }
}