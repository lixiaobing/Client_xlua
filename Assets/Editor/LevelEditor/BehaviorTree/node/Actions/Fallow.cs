using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("跟随队长")]
    [Serializable]
    public class Fallow : Action
    {

        public int tag;

        public Vector2 offset = new Vector2();

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(tag), tag, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(offset), offset, indent, newLine));
            return sb.ToString();
        }
        public override void OnInspector()
        {
            tag    = Utils.IntField("队长Tag", tag);
            offset = Utils.Vector2Field("偏移", offset);
        
        }
    }
}