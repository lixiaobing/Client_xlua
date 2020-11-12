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

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(time), time, indent,newLine));
            sb.Append(ExportUtils.KV(nameof(enter), enter, indent, newLine));
            
            return sb.ToString();
        }
        public override void OnInspector()
        {
            base.OnInspector();
            time = Utils.FloatField("冷却时间(毫秒)",time);
            enter = Utils.Toggle("进入", enter);
        }
    }
}