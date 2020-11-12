using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("检查角色数量")]
    [Serializable]
    public class CheckRoleNum : Conditional
    {
        //目标选择类型
        public Camp camp = Camp.ENEMY;

        public RoleFightState roleFightState = RoleFightState.FIGHT;
        //人数
        public int num;
        //关系
        public RelationalOperator relationalOperator = RelationalOperator.GREATER_THAN;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToStringEx(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(camp), camp, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(roleFightState), roleFightState, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(num), num, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            return sb.ToString();
        }


        public override void OnInspector()
        {
            base.OnInspector();
            camp = Utils.EnumPopup<Camp>("阵营", camp);
            roleFightState = Utils.EnumPopup<RoleFightState>("战斗状态", roleFightState);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("比较关系", relationalOperator);
            num = Utils.IntField("数量", num);
        }
    }
}