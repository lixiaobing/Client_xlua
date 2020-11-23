using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{


    ////////////////////////////////////////////////
    ///执行节点
    public class AIAction : AINode
    {
        public override BaseType GetBaseType()
        {
            return BaseType.Action;
        }
        public virtual bool IsBreak()
        {
            return false;
        }

        public override void OnUpdateImpl()
        {
            if (this.IsBreak())
            {
                this.SetExcuteComplete_Fail(false);
                return;
            }
            this.OnUpdateImpl_();
        }

        public override void OnExecute() {
            if (this.IsBreak())
            {
                this.SetExcuteComplete_Fail(false);
                return;
            }
            this.OnExecute_();
        }
        public virtual void OnExecute_() { 
            this.SetExcuteComplete_Success(true);
        }
        public virtual void OnUpdateImpl_() { 
        
        }
    }






   
    //返回根节点
    public class AIBackRoot : AIAction
    {
        public override void OnExecuteComplete() {
            this.ai.Restart();
        }


    }
    //改变属性百分比
    public class AIChangeAttr : AIAction
    {
        public override void OnExecute()
        {
           
        }

    }
    //改变buff
    public class AIChangeBuff : AIAction
    {
        public override void OnExecute()
        {

        }

    }
    //定义或赋值变量
    public class AIChangeVariable : AIAction
    {
        public new ChangeVariableConfig config;
        public override void OnExecute_()
        {

            if (this.config.share) //关卡共享变量
            {
                Debug.LogError("AIChangeVariable 关卡共享变量未实现");
            }
            else { //私有变量
                this.ai.ChangeValue(this.config.varName, this.config.value);
            }
            this.SetExcuteComplete_Success(true);
        }

    }
    //喊话
    public class AIChat : AIAction
    {
        public new ChatConfig config;

    }
    //控制触发器
    public class AIControlTrigger : AIAction
    {
        public new ControlTriggerConfig config;

    }
    //逃跑
    public class AIEscape : AIAction
    {
        public new EscapeConfig config;

    }
    //跟随队长
    public class AIFallow : AIAction
    {
        public new FallowConfig config;

    }
    //待机
    public class AIIdle : AIAction
    {
        public new IdleConfig config;

        public override void OnUpdateImpl_()
        {
            if (this.IsOvertime(this.config.time))
            {
                this.SetExcuteComplete_Success(true);

            }
        }

        public override void OnExecute_()
        {
            this.Host.PlayIdle();
        
        }

    }
    //向目标位置移动
    public class AIMove : AIAction
    {
        public new MoveConfig config;

    }



    //指定朝向移动
    public class AIMoveDir : AIAction
    {
        public new MoveDirConfig config;

    }




    //移动到指定位置
    public class AIMoveTo : AIAction
    {
        public new MoveToConfig config;

    }

    //巡逻
    public class AIPatrol : AIAction
    {
        public new PatrolConfig config;

    }

    //设置一定范围内的目标的战斗状态
    public class AISetAreaFight : AIAction
    {
        public new SetAreaFightConfig config;

    }


    //设置属性(百分比)
    public class AISetAttr : AIAction
    {

        public new SetAttrConfig config;
    }


    //设置战斗状态
    public class AISetFight : AIAction
    {
        public new SetFightConfig config;

    }
    //TimeScale
    public class AITimeScale : AIAction
    {
        public new TimeScaleConfig config;

    }

    //触发BUFF
    public class AITriggerBuff : AIAction
    {
        public new TriggerBuffConfig config;

    }
    //释放技能
    public class AIUseSkill : AIAction
    {
        public new UseSkillConfig config;
    }

}