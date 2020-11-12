using hjcd.level.CheckPoint.PlotEvent;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
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
    public class Trigger : EObject, IExport
    {


        //ID 
        public int id;
        //是否激活
        public bool enable = true;
        //策划注释
        public string desc = "";
        //循环次数
        public int loopTimes = -1;

        //随机满足条件的数量
        public int reachConditionNum;
        //随机执行的数量
        public int excuteNum;
        //是否收限制
        public bool unlimited =false;

        public TriggerExecutType triggerExecutType = TriggerExecutType.PARALLEL;

        public List<TriggerNode> triggerNodes = new List<TriggerNode>();
        public List<ConditionNode> conditionNodes = new List<ConditionNode>();
        public List<ExecuteNode> executeNodes = new List<ExecuteNode>();
        //编辑器排序不需要导出
        public int orderIndex = 0;
        //所屬分組
        public int groupId = 0;
        public string Desc {
            get {
                int lenght = this.desc.Length;
                if (lenght > 5) {
                    return "(" + this.desc.Substring(0, 5) + ")";
                } else if (lenght>0) {
                    return "(" + this.desc + ")";
                }
                return string.Empty;
            }
        }
        ///
        public void AddTriggerNode(TriggerNode node) {
       
            foreach (var item in triggerNodes)
            {
                item.Destroy();
            }

            triggerNodes.Clear();
            triggerNodes.Add(node);
        }
        public void AddCondtionNode(ConditionNode node)
        {
            conditionNodes.Add(node);
        }
        public void AddExecuteNode(ExecuteNode node)
        {
            executeNodes.Add(node);
        }
        public void RemoveCondtionNode(ConditionNode node)
        {
            conditionNodes.Remove(node);
            node.Destroy();
          
        }

        public void RemoveExecutNode(ExecuteNode node)
        {
            executeNodes.Remove(node);
            node.Destroy();
        }
        public override void OnUpdate(float  time) {
            foreach (var node in this.triggerNodes)
            {
                node.OnUpdate(Time.deltaTime);
            }
            foreach (var node in this.conditionNodes)
            {
                node.OnUpdate(Time.deltaTime);
            }
            foreach (var node in this.executeNodes)
            {
                node.OnUpdate(Time.deltaTime);
            }
        }

        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            sb.Append(ExportUtils.KV(nameof(id), id, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(enable), enable, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(unlimited), unlimited, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(desc), desc, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(loopTimes), loopTimes, indent + 1, true));


            sb.Append(ExportUtils.KV(nameof(reachConditionNum), reachConditionNum, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(excuteNum), excuteNum, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(triggerExecutType), triggerExecutType, indent + 1, true));

            sb.Append(ExportUtils.KV_LIST<TriggerNode>(nameof(triggerNodes), triggerNodes, indent + 1, true));
            sb.Append(ExportUtils.KV_LIST<ConditionNode>(nameof(conditionNodes), conditionNodes, indent + 1, true));
            sb.Append(ExportUtils.KV_LIST<ExecuteNode>(nameof(executeNodes), executeNodes, indent + 1, true,false));
            sb.Append(ExportUtils.F_CurlyBracesRight(0, false));
            return sb.ToString();
        }

        public override void CreateObject()
        {
            base.CreateObject();
            if (this.gameObject == null) {
                this.gameObject = new GameObject(this.Name); 
                if (Parent != null) {
                    this.gameObject.transform.SetParent(Parent.GetGameObject().transform); 

                }
            } 
        }
        
        
        
       


        public override void Destroy() {
            foreach (var node in this.triggerNodes)
            {
                node.Destroy();
            }
            foreach (var node in this.conditionNodes)
            {
                node.Destroy();
            }
            foreach (var node in this.executeNodes)
            {
                node.Destroy();
            }
            triggerNodes.Clear();
            conditionNodes.Clear();
            executeNodes.Clear();
            base.Destroy();
            
        }
        //重先生成子节点ID
        public void GenerateChildID() 
        {
            foreach (var node in this.triggerNodes)
            {
                node.NewUUID();
            }
            foreach (var node in this.conditionNodes)
            {
                node.NewUUID();
            }
            foreach (var node in this.executeNodes)
            {
                node.NewUUID();
            }
        }
    }


}


/*//ID 
public int id;
//是否激活
public bool enable;
//策划注释
public string desc;
//循环次数
public int loopTimes;

//随机满足条件的数量
public int reachCondtionNum;
//随机执行的数量
public int excuteNum;

public TriggerExecutType triggerExecutType = TriggerExecutType.PARALLEL;

public List<TriggerNode> triggerNodes = new List<TriggerNode>();
public List<CondtionNode> condtionNodes = new List<CondtionNode>();
public List<ExecuteNode> executeNodes = new List<ExecuteNode>();*/