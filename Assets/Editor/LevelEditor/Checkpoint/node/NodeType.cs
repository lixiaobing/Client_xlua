using System;
using System.Reflection;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level.CheckPoint.PlotEvent;

namespace hjcd.level.CheckPoint
{

    public static class NodeType {

        public static readonly Type[] events = {
                    typeof(Transmit),
                    typeof(PlayAction),
                    typeof(MonsterEnter),
                    typeof(Dialog),
                    typeof(EnterShow),
                    typeof(SlowScale),

                };

        public static Dictionary<string, Type[]> executeDic = null;


        //所有执行节点
        public static Dictionary<string, Type[]> GetExecuteDic() 
        {
            if (executeDic == null) {
                executeDic = new Dictionary<string, Type[]>();
                executeDic["战斗相关"] = new Type[]{
                     typeof(CreateMonsters),
                     typeof(AISwitch),
                     typeof(ChangeAttackMode),
                     typeof(BattleResult),
                     typeof(ChangeFightState),
                     typeof(SetArea),
                };
                executeDic["特效相关"] = new Type[]{
                    typeof(CreateEffect),
                    typeof(RemoveEffect),
                    typeof(ShaderSwitch),
                    typeof(CreateVertexAnimation),
                    typeof(ChangeVertexAnimation),
                    typeof(DestoryVertexAnimation),
                    typeof(PlayCameraEffect)
                };
                executeDic["角色相关"] = new Type[] {
                    typeof(AcceptTask),//接取任务
                    typeof(SetRunFast), //设置快跑模式 
                    typeof(InputSwitch),
                    typeof(SetPosition),
                    typeof(ActorEnter),
                };
                executeDic["剧情显示"] = new Type[]{
                    typeof(ShowTip),
                    typeof(ShowEvent),
                    typeof(ShowDialog),
                    typeof(TargetPromp),
                    typeof(PlayStory),
                    typeof(PlayVideo),
                    typeof(PlaySound),
                    typeof(PlayPlot),
                };
                executeDic["通用"] = new Type[]{
                    typeof(ControlTrigger),
                    typeof(TimeScale),
                    typeof(FixCamera),
                    typeof(ResumCamera),
                    typeof(ChangeSkyBoxFollow),
                };
                executeDic["操作台(物件)"] = new Type[] {
                    typeof(CreateAirWall),
                    typeof(DestoryAirWall),
                    typeof(CreateConsoles),
                    typeof(DestoryConsole),
                    typeof(ActiveConsole),
                    typeof(CreateObstacles),
                    typeof(CreateGate),//创建门
                    typeof(SetGateState),
                };
                executeDic["移动平台"] = new Type[] {
                    typeof(CreateFixedPlatform),
                    typeof(CreateMovePlatform),
                    typeof(ControlPlatform),
                    typeof(DestoryPlatform),

                };
            }
            return executeDic;
        }
     


   

    /*    public static readonly Type[] executes = allExecutes;*/

        public static readonly Type[] conditionals = {
            typeof(CheckTask),
            typeof(CheckMonsterNum),
            typeof(CheckMonsterDeadNum),
        };
        public static readonly Type[] triggers = {
            typeof(Area),
            typeof(Start),
            typeof(Dead),
            typeof(ConsoleCount),
            typeof(DestroyProp),
            typeof(TaskStateChange), //任务状态变更
            typeof(LoopTrigger), //循环触发
            typeof(MonsterDead),
            typeof(PassCheckPoint)//通过关卡
        };
    }
}