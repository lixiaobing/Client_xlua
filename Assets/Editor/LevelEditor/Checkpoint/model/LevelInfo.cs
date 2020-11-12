using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml.Serialization;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using hjcd.level.CheckPoint.PlotEvent;

namespace hjcd.level.CheckPoint
{
    [XmlInclude(typeof(IFoldOut))]
    [XmlInclude(typeof(Group))]

    [XmlInclude(typeof(TimeEvent))]
    [XmlInclude(typeof(Transmit))]
    [XmlInclude(typeof(PlayAction))]
    [XmlInclude(typeof(MonsterEnter))]
    [XmlInclude(typeof(Dialog))]
    [XmlInclude(typeof(EnterShow))]
    [XmlInclude(typeof(SlowScale))]

    [XmlInclude(typeof(CreateObstacles))]
    [XmlInclude(typeof(Born))]
    [XmlInclude(typeof(Obstacle))]
    [XmlInclude(typeof(Monster))]
    [XmlInclude(typeof(ConditionNode))]
    [XmlInclude(typeof(BattleResult))]
    [XmlInclude(typeof(ControlTrigger))]
    [XmlInclude(typeof(CreateMonsters))]
    [XmlInclude(typeof(ExecuteNode))]
    [XmlInclude(typeof(Area))]
    [XmlInclude(typeof(Dead))]
    [XmlInclude(typeof(Start))]
    [XmlInclude(typeof(TriggerNode))]

    [XmlInclude(typeof(Trigger))]
    [XmlInclude(typeof(ETransform))]
    [XmlInclude(typeof(LevelInfo))]
    [XmlInclude(typeof(TimeScale))]
    [XmlInclude(typeof(ChangeAttackMode))]
    [XmlInclude(typeof(PlayPlot))]
    [XmlInclude(typeof(ShowDialog))]
    [XmlInclude(typeof(ShowTip))]

    [XmlInclude(typeof(TargetPromp))]
    [XmlInclude(typeof(CreateEffect))]
    [XmlInclude(typeof(RemoveEffect))]
    [XmlInclude(typeof(FixCamera))]
    [XmlInclude(typeof(ResumCamera))]
    [XmlInclude(typeof(AISwitch))]
    [XmlInclude(typeof(InputSwitch))]
    [XmlInclude(typeof(CreateAirWall))]
    [XmlInclude(typeof(DestoryAirWall))]
    [XmlInclude(typeof(PlayVideo))]
    [XmlInclude(typeof(ActorEnter))]
    [XmlInclude(typeof(CreateConsoles))]
    [XmlInclude(typeof(DestoryConsole))]
    [XmlInclude(typeof(ActiveConsole))]
    [XmlInclude(typeof(ConsoleCount))]
    [XmlInclude(typeof(PropModel))]
    [XmlInclude(typeof(DestroyProp))]
    [XmlInclude(typeof(ChangeFightState))]
    [XmlInclude(typeof(CheckTask))]
    [XmlInclude(typeof(ChangeSkyBoxFollow))]
    [XmlInclude(typeof(SetRunFast))]
    [XmlInclude(typeof(SetArea))]
    [XmlInclude(typeof(AcceptTask))]
    [XmlInclude(typeof(TaskStateChange))]
    [XmlInclude(typeof(LoopTrigger))]
    [XmlInclude(typeof(CheckMonsterNum))]
    [XmlInclude(typeof(CheckMonsterDeadNum))]
    [XmlInclude(typeof(MonsterDead))]
    [XmlInclude(typeof(CreateGate))]
    [XmlInclude(typeof(SetGateState))]
    [XmlInclude(typeof(ShaderSwitch))]
    [XmlInclude(typeof(PlayStory))]
    [XmlInclude(typeof(CreateVertexAnimation))]
    [XmlInclude(typeof(ChangeVertexAnimation))]
    [XmlInclude(typeof(DestoryVertexAnimation))]
    [XmlInclude(typeof(PlaySound))]
    [XmlInclude(typeof(SetPosition))]
    [XmlInclude(typeof(ShowEvent))]
    [XmlInclude(typeof(PlayCameraEffect))]
    [XmlInclude(typeof(CameraEffect))]
    [XmlInclude(typeof(CheckPoint))]
    [XmlInclude(typeof(PassCheckPoint))]
    [XmlInclude(typeof(EObject))]

    [XmlInclude(typeof(BaseObject))]
    [XmlInclude(typeof(TriggerGroup))]
    [XmlInclude(typeof(TriggerGroupGroup))]


    [XmlInclude(typeof(CreateFixedPlatform))]
    [XmlInclude(typeof(CreateFixedPlatform.CreateFixedPlatformPlatform_Platform))]
    [XmlInclude(typeof(CreateMovePlatform))]
    
    [XmlInclude(typeof(DestoryPlatform))]
    [XmlInclude(typeof(DestoryPlatform.PDestoryPlatform_Platform))]
    [XmlInclude(typeof(ControlPlatform))]
    [XmlInclude(typeof(ControlPlatform.ControlPlatform_Platform))]

    public class LevelInfo :IExport {
        //id
        public int id;
        //关卡名称
        public string name;
        //是否播放开场动画
        public bool playStartAnimation = true;
        //入场淡入
        public bool fadeIn = true;

        //角色进入警戒状态效果
        public CameraEffect cameraEffect = new CameraEffect();

        //关卡类型
        //public LevelGroupType groupType = LevelGroupType.GROUP_1;
        //分组名称
        public string groupName = "未分组";
        //场景文件
        public string sceneFile = "Assets/Scenes/Empty.unity";
        //场景名称
        public string sceneName = "Empty.unity";
        //关卡音乐事件名称
        public string soundEventName = "";
        //策划注释
        public string desc ="";
        //出生点
        public List<Born> borns    = new List<Born>();
        //触发器
        public List<Trigger> triggers = new List<Trigger>();
        //可破坏物
        public List<Obstacle> props    = new List<Obstacle>();

        //触发器分组
        public List<TriggerGroupGroup> triggerGroupGroups = new List<TriggerGroupGroup>();
        
        //1出生点 1~1000
        //2空气墙 1000~2000
        //3触发器 2000~3000
        //4破坏物 3000~4000

        public int[] autoIncrementIds = { 1, 1001, 2001, 3001 };

        //触发器分组列表
        public List<Group> triggerGroups = new List<Group>();

        //据点列表
        public List<string> strongholds = new List<string>();
        //战斗区域
        public List<string> areas = new List<string>();
        //区域空气墙
        public List<string> walls = new List<string>();

        //载入关卡配置
        public void LoadLevelNogs() {

            LevelNogs nogs = GameObject.FindObjectOfType<LevelNogs>();
            strongholds.Clear();
            areas.Clear();
            walls.Clear();
            if (nogs != null) {
                foreach (var item in nogs.strongholds)
                {
                    strongholds.Add(item.name);
                }
                foreach (var item in nogs.areas)
                {
                    areas.Add(item.name);
                }
                foreach (var item in nogs.walls)
                {
                    walls.Add(item.name);
                }
            } 
        }
        public Trigger GetTrigger(int id) {
            foreach (var trigger in triggers)
            {
                if (trigger.id == id) {
                    return trigger;
                }
            }
            return null;
        }

        public LevelInfo clone() {
            return clone(new LevelInfo());
        }
        public T clone<T>(T levelInfo) where T:LevelInfo
        {
            levelInfo.id = this.id;
            levelInfo.name = this.name;
            levelInfo.groupName = this.groupName;
            levelInfo.sceneName = this.sceneName;
            levelInfo.sceneFile = this.sceneFile;
            levelInfo.soundEventName = this.soundEventName;
            levelInfo.desc = this.desc;
            levelInfo.borns = this.borns;
            levelInfo.triggers = this.triggers;
            levelInfo.props = this.props;
            levelInfo.autoIncrementIds = this.autoIncrementIds;
            levelInfo.playStartAnimation = this.playStartAnimation;
            levelInfo.fadeIn = this.fadeIn;
            levelInfo.triggerGroups = this.triggerGroups;
            levelInfo.cameraEffect = this.cameraEffect.Clone();
            levelInfo.strongholds = this.strongholds;
            levelInfo.areas = this.areas;
            levelInfo.walls = this.walls;
            levelInfo.triggerGroupGroups = this.triggerGroupGroups;

            return levelInfo;
        }

        public string ToLuaString(int indent, bool newLine)
        {


            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.Return);
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, true));
            indent = 1;
            //id
            sb.Append(ExportUtils.KV(nameof(id), id, indent, true));
            //日志输出
            sb.Append(ExportUtils.KV(nameof(name), name, indent, true));
            //分組名称
            sb.Append(ExportUtils.KV(nameof(groupName), groupName, indent, true));
            //是否播放开场动画
            sb.Append(ExportUtils.KV(nameof(playStartAnimation), playStartAnimation, indent, true));
            sb.Append(ExportUtils.KV(nameof(fadeIn), fadeIn, indent, true));
            //場景名稱
            sb.Append(ExportUtils.KV(nameof(sceneName), sceneName, indent, true));
            sb.Append(ExportUtils.KV(nameof(sceneFile), sceneFile, indent, true));
            sb.Append(ExportUtils.KV(nameof(soundEventName), soundEventName, indent, true));
            sb.Append(ExportUtils.KV(nameof(desc), desc, indent, true));
            sb.Append(ExportUtils.KV(nameof(cameraEffect), cameraEffect, indent, true));
            //出生点
            sb.Append(ExportUtils.KV_LIST<Born>(nameof(borns), borns, indent, true));
   
            //可破坏物
            sb.Append(ExportUtils.KV_LIST<Obstacle>(nameof(props), props, indent, true));

            sb.Append(ExportUtils.KV_LIST_VALUE<string>(nameof(strongholds), strongholds, indent, true,true));
            sb.Append(ExportUtils.KV_LIST_VALUE<string>(nameof(areas), areas, indent, true, true));
            sb.Append(ExportUtils.KV_LIST_VALUE<string>(nameof(walls), walls, indent, true, true));

            List<Trigger> mergeTriggers = new List<Trigger>();

            foreach (var triggerGroupGroup in this.triggerGroupGroups)
            {
                foreach (var triggerGroups in triggerGroupGroup.triggerGroups)
                {
                    foreach (var trigger in triggerGroups.triggers)
                    {
                        mergeTriggers.Add(trigger);
                    }
                }

    
            }

            //还未完善
            sb.Append(ExportUtils.KV_LIST<Trigger>("triggers", mergeTriggers, indent, true));

            sb.Append(ExportUtils.F_CurlyBracesRight(0, true));
            return sb.ToString();




        }
    }
}