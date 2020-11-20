using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("战斗判定")]
    [Serializable]
    public class CheckFight: Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();
        //是否是战斗状态
        public bool fight;

        public override void OnInspector()
        {
            base.OnInspector();
            Utils.DrawSelectTarget2("目标选择", selectTarget);
            fight = Utils.Toggle("战斗状态", fight); 
        }
    }
}