using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("原地待机")]
    [Serializable]
    public class Idle : Action
    {

        public float time = 1000;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(time), time, indent, newLine));

            return sb.ToString();
        }
        public override void OnInspector()
        {
            time = Utils.FloatField("待机时间(毫秒)", time);
        }
    }
}