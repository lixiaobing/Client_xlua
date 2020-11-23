using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{


    /// ///////////////////////////////////////包装节点//////////////////////////////////////////////

    public class AIDecorator : AINode
    {
        public override BaseType GetBaseType()
        {
            return BaseType.Decorator;
        }

    }
    /// <summary>
    ///  循环节点
    /// </summary>
    public class AIRepeat : AIDecorator
    {
        public new RepeatConfig config;
        public bool CanRepeat()
        {
            return this.executeCount < this.config.repeatTimes;
        }
        //增加执行次数
        public void AddExecuteCount() { 
            this.executeCount +=  1;
        }
    }

    public class AIReturnFalse : AIDecorator
    {
        public override bool OnPop(bool result) {
            return false;
        }

    }
    public class AIReturnTrue : AIDecorator
    {
        public override bool OnPop(bool result)
        {
            return true;
        }

    }
    //取反
    public class AIReturnInverse : AIDecorator
    {
        public override bool OnPop(bool result)
        {
            return !result;
        }

    }
    //发动攻击
    public class AIStartAttack : AIDecorator
    {
        public override void OnExecute() {
            this.SetExcuteComplete_Success(true);
        }

    }
    //等待节点
    public class AIWait : AIDecorator
    {
        public new WaitConfig config;
        public void OnUpdate() {
            if (this.IsOvertime(this.config.waitTime)) {
                this.SetExcuteComplete_Success(true);
            }
        }

        public override void OnExecute()
        {
            //nothing  to do
        }
    }

}