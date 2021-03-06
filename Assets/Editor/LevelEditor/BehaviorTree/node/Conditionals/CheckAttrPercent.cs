﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("属性判定(百分比)")]
    [Serializable]
    public class CheckAttrPercent: Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();

        //百分比属性
        public AttrPercent attrPercent = AttrPercent.HP;
        //比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        //百分比值
        public float attrPercentValue = 0;


        public override void OnInspector()
        {
            base.OnInspector();
            Utils.DrawSelectTarget2("目标选择", selectTarget);

            attrPercent = Utils.EnumPopup<AttrPercent>("属性",attrPercent);
    
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系",relationalOperator);

            attrPercentValue = Utils.FloatField("参照值",attrPercentValue);
         
        }


    }
}