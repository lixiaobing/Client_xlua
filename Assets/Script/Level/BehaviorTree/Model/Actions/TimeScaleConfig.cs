﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class TimeScaleConfig : ActionConfig
    {
        public float timeScale = 1.0f;
        public float time    = 1000;
    }
}