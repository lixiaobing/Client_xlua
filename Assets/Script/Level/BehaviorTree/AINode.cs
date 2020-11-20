using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{


    //节点状态
    public enum ExcuteState
    {
        Excute_Read = 1,
        Excute_Progress,
        Excute_Complete,

    }
    //AIState 临时状态的位标记
    public enum NodeState 
    {
        Wait     = 1, //等待
        Running  = 2, //执行中
        Complete = 3, //执行完成
    }

    public class AINode
    {
        public NodeConfig config;

        public AI ai;
        public List<AINode> childs;





        public int executeCount;
        public AINode parentNode;
        public AINode childNode;

        public ExcuteState excuteState = ExcuteState.Excute_Read;
        public bool excuteResult;
        public float deltaTime;
        public NodeState nodeState = NodeState.Wait;
        public int childIndex;
        public AINode()
        {
            this.executeCount = 0;
            this.excuteState = ExcuteState.Excute_Read;
            this.excuteResult = true ; //默认执行结果
            this.deltaTime = 0;
            //节点状态
            this.nodeState = NodeState.Wait;
            this.childIndex = 1;
        }

        public void Reset()
        {
            this.executeCount = 0;
            this.excuteState = ExcuteState.Excute_Read;
            this.excuteResult = true ; //默认执行结果
            this.deltaTime = 0;
            //节点状态
            this.nodeState = NodeState.Wait;
            this.childIndex = 1;
        }

        public string ID {
            get {
                return config.uuid;
            }
        }

        public TestHero Host
        {
            get {
                return ai.host;
            }
        }

        public NodeState GetNodeState() {

            return NodeState.Wait;
        }
        /// <summary>
        /// 关联子节点
        /// </summary>
        /// <param name="ai"></param>
        public void OnInit(AI ai) {
            this.ai = ai;
            childs = new List<AINode>();
            foreach (var link in config.links)
            {
                var node = this.ai.GetNode(link.child);
                if (node != null) {
                    childs.Add(node);
                }
            }
        }
        public virtual void AbortCheck()
        {


        }

        public virtual void OnPause() { }
        public virtual void OnReseum() { }
        public virtual void OnEnter() { }
        public virtual void OnExit() { }
        public virtual void OnUpdate(float time) { 
            
           
        }

        public virtual bool OnPop(bool result) {
            this.nodeState = NodeState.Complete;
            return result;
        }

        public void AddExecuteCount()
        {

        }


        public void ResetChilds() { 
        }


        public virtual void OnExitTop()
        {
            this.OnExit();
        }
        public virtual void OnPush() { 
            this.nodeState = NodeState.Running;
        }
        public virtual void OnEnterTop()
        {
            this.OnEnter();
        }
        public virtual AINode GetChild() {
            return null;
        }
        public virtual AINode GetNextChild()
        {
            return null;
        }

        public void NextChild() { 
        
        }

        public bool CanRepeat() {
            return false;
        }
        public float GetDeltaTime(){
            return deltaTime;
    
        }
        public bool IsOvertime(float time){
            return this.deltaTime >= time;
        }

        public static AINode Create(NodeConfig config)
        {
            string className = "AI" + config.GetType().Name.Replace("Config", "");
            Type type = Type.GetType("hjcd.level.BehaviorTree." + className);
            dynamic obj = type.Assembly.CreateInstance(type.FullName);
            obj.config = config;
            return obj;
        }
    }

    public class AIRootNode:AINode
    {
        public override void OnEnter() {
        

        }
    }

}