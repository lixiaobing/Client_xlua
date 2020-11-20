using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("属性判定")]
    [Serializable]
    public class CheckAttr: Conditional
    {
        //目标选择类型
        public SelectTarget2 selectTarget = new SelectTarget2();

        //百分比属性
        public Attr attr = Attr.HP;
        //比较
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        //百分比值
        public float attrValue = 0;

        public override void OnInspector()
        {
            base.OnInspector();
            Utils.DrawSelectTarget2("目标选择", selectTarget);

            attr = Utils.EnumPopup<Attr>("属性", attr);
    
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系",relationalOperator);

            attrValue = Utils.FloatField("参照值",attrValue);
         
        }


    }
}