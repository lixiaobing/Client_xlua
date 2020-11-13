using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class FallowConfig : ActionConfig
    {
        public int tag;
        public Vector2 offset = new Vector2();
    }
}