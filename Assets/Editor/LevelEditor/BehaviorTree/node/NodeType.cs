using System;
using System.Reflection;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{

    public static class NodeType {
        //战斗
        public static readonly Type[] actions_1 = {

            typeof(Move),
            typeof(UseSkill),
            typeof(SetFight),
            typeof(SetAreaFight),
            typeof(ChangeBuff),
            typeof(ChangeAttr),
            typeof(SetAttr),
            typeof(TriggerBuff),
        };
        //非战斗
        public static readonly Type[] actions_2 = {

            typeof(MoveDir),
            typeof(MoveTo),
            typeof(Escape),
            typeof(Chat),
            typeof(Fallow),
            typeof(Patrol),
            typeof(Idle),
        };
        //通用
        public static readonly Type[] actions_3 = {

            typeof(ControlTrigger),
            typeof(ChangeVariable),
            typeof(TimeScale),
            typeof(BackRoot),
        };
        private static Type[] allActions
        {
            get
            {
                Type[] _actions = new Type[actions_1.Length + actions_2.Length + actions_3.Length];
                Array.Copy(actions_1, 0, _actions, 0, actions_1.Length);
                Array.Copy(actions_2, 0, _actions, actions_1.Length, actions_2.Length);
                Array.Copy(actions_3, 0, _actions, actions_1.Length + actions_2.Length, actions_3.Length);
                return _actions;
            }
        }
        public static readonly Type[] actions = allActions;

        public static readonly Type[] conditionals = {
            typeof(CheckAngle),
            typeof(CheckState),
            typeof(CheckDistance),
            typeof(CheckAttr),
            typeof(CheckAttrPercent),
            typeof(CompareVariable),
            typeof(CheckVariable),
            typeof(CountDown),
            typeof(CountDownOnce),
            typeof(CheckBattleTime),
            typeof(CheckRunTime),
            typeof(Linkage),
            typeof(CheckSkillCountDown), //技能CD判定
            typeof(CheckAttactSize),//攻击人数判定
            typeof(RandomGroup),
            typeof(ConditonGroup),
            typeof(CheckFight),
            typeof(CheckRoleNum),
            typeof(CheckCanMove),
            typeof(CheckBeHit),
            typeof(WillBeHit),
            
        };
        public static readonly Type[] composites = {
            typeof(Random),
            typeof(Selector),
            typeof(Sequence),
        };
        public static readonly Type[] decorators = {
            typeof(Repeat),
            typeof(ReturnFalse),
            typeof(ReturnTrue),
            typeof(ReturnInverse),
            typeof(Wait),
            typeof(StartAttack),
        };


    }
}