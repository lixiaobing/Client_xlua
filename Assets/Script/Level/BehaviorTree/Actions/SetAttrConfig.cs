using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class SetAttrConfig : ActionConfig
    {
        public SelectTarget2 selectTarget = new SelectTarget2();
        //百分比属性
        public AttrPercent attrPercent = AttrPercent.HP;

        //百分比
        public int percent;
      
    }
}