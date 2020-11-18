using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    //改变Buff
    [EnumDescription("设置一定范围内的目标的战斗状态")]
    [Serializable]
    public class SetAreaFight : Action
    {
        public Camp camp  = Camp.FRIEND;
        public float radius = 1;
        //是否战斗状态
        public bool fight = true;

        public override void OnInspector()
        {
            camp   = Utils.EnumPopup<Camp>("阵营", camp);
            radius = Utils.FloatField("半径(米)", radius);
            fight  = Utils.Toggle("战斗状态", fight);
        }



    }
}