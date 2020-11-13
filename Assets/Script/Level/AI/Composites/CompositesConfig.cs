using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class CompositesConfig : NodeConfig
    {
        // 打断类型
        public AbortType abortType = AbortType.None;
    }
}