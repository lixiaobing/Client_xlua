using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{
    /// <summary>
    /// //////////////////////////////////////条件节点//////////////////////////////////////////////////////
    /// </summary>

    public class AIConditional : AINode
    {
        
        public override BaseType GetBaseType()
        {
            return BaseType.Conditional;
        }

        public virtual bool Decide() {

            Debug.LogWarning(string.Format("{0} Decide must override", GetType().Name));
            return true;
        }
        public override void OnExecute() {
            this.excuteState = ExcuteState.Excute_Complete;
            this.excuteResult = this.Decide();
        }

    }
    /// <summary>
    ///  角度判定
    /// </summary>
    public class AICheckAngle : AIConditional
    {

        public new CheckAngleConfig config;
        public override bool Decide()
        {

            var target = this.SelectTarget();
            var angle = this.config.angle;
            var radius = this.config.radius;
            var transformHost = this.Host.transform;
            var transformTarget = target.transform;
            //距离
            if (Vector3.Distance(transformHost.position, transformTarget.position) <= radius)
            {
                //算夹角
                var targetDir = transformTarget.position - transformHost.position;
                var _angle = Vector3.Angle(targetDir, transformHost.forward);
                if (_angle <= angle * 0.5)
                {
                    return true;

                }
                return false;
            }
            return false;
        }
        //攻击人数判定
        public class AICheckAttactSize : AIConditional
        {
            public new CheckAttactSizeConfig config;
            public override bool Decide()
            {

                int size = 0;  // 当前正在攻击的 怪物的数量 levelCtrl:attackCount(attackType)
                               /*    local attackNums = levelCtrl:getAttackModeCfg().attackNum
                                   local attackNum = attackNums[attackType] or 0

                                   return Operator.relationalOperator(size, attackNum, self.cfg.relationalOperator)*/
                Debug.LogError("AICheckAttactSize 功能未完善");
                return false;
            }

        }
        //属性判定
        public class AICheckCheckAttr : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError("AICheckCheckAttr 功能未完善");
                return false;
            }

        }
        //属性判定(百分比)
        public class AICheckAttrPercent : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError("AICheckAttrPercent 功能未完善");
                return false;
            }


        }
        //判断自身受击
        public class AICheckBeHit : AIConditional
        {

            public override bool Decide()
            {
                Debug.LogError("AICheckBeHit 功能未完善");
                //return self:getHost():checkAIState(AIState.BeHit)
                return false;
            }
        }

        //是否可以移动
        public class AICheckCanMove : AIConditional
        {

            public override bool Decide()
            {
                Debug.LogError(string.Format("{0} 功能未完善",GetType().Name));
                //return self:getHost():checkAIState(AIState.BeHit)
                return false;
            }

        }

        //距离判定
        public class AICheckDistance : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError(string.Format("{0} 功能未完善", GetType().Name));
                //return self:getHost():checkAIState(AIState.BeHit)
                return false;
            }
        }
        //战斗判定
        public class AICheckFight : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError(string.Format("{0} 功能未完善", GetType().Name));
                return false;
            }


        }
        //检查角色数量
        public class AICheckRoleNum : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError(string.Format("{0} 功能未完善", GetType().Name));
                return false;
            }

        }
        //技能CD判定(是否可用)
        public class AICheckSkillCountDown : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError(string.Format("{0} 功能未完善", GetType().Name));
                return false;
            }


        }
        //状态判定
        public class AICheckState : AIConditional
        {
            public override bool Decide()
            {
                Debug.LogError(string.Format("{0} 功能未完善", GetType().Name));
                return false;
            }

        }
        //战斗时间判定
        public class AICheckBattleTime : AIConditional
        {
            public new CheckBattleTimeConfig config;
            public override bool Decide()
            {
                var time               = Statistics.Instance.time;
                var referenceTime      = this.config.time;
                var relationalOperator = this.config.relationalOperator;
                return Operator.DoRelationalOperator(time, referenceTime, relationalOperator);
            }

        }
        //检查变量值
        public class AICheckVariable : AIConditional
        {
            public new CheckVariableConfig config;
            public override bool Decide()
            {
                var value1 = this.ai.GetValue(this.config.var1);
                var value2 = this.config.value;
                return Operator.DoRelationalOperator(value1, value2, this.config.relationalOperator);

            }
        }
         
        /// <summary>
        /// 比较变量
        /// </summary>
        public class AICompareVariable : AIConditional
        {
            public new CompareVariableConfig config;
            public float GetValue(Variable var)
            {
                if (var.share)
                {
                    Debug.LogError("AICompareVariable 公共变量获取 暂不支持");
                    //return ShareVariable.getValue(var.name)
                    return 0;
                }
                else
                {
                    return this.ai.GetValue(var.name);

                }
            }
            public override bool Decide()
            {
                var value1 = this.GetValue(this.config.var1);
                var value2 = this.GetValue(this.config.var2);
                return Operator.DoRelationalOperator(value1, value2, this.config.relationalOperator);
            }

        }



        //行为树运行时间判定
        public class AICheckRunTime : AIConditional
        {
            public new CheckRunTimeConfig config;
            public override bool Decide()
            {
                var time = this.ai.time;
                var referenceTime = this.config.time;
                return Operator.DoRelationalOperator(time, referenceTime, this.config.relationalOperator);
            }
        }

    }
}