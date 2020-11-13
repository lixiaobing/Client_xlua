using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{


    public class SetFightConfig : ActionConfig
    {
        public SelectTarget2Config selectTarget = new SelectTarget2Config();
        
        //是否战斗状态
        public bool fight;

      



    }
}