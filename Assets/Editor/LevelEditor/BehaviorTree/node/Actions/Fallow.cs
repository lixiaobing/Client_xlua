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

        public override void OnInspector()
        {
            tag    = Utils.IntField("队长Tag", tag);
            offset = Utils.Vector2Field("偏移", offset);
        
        }
    }
}