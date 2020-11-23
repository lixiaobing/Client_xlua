using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{



 //节点基础类型
public enum BaseType
{
	Root     = 0,
	Action = 1,
	Conditional = 2,
	Composites = 3,	
	Decorator = 4,
}

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


        private static System.Random random = new System.Random(DateTime.Now.Millisecond);

        public static System.Random Random {

            get {
                return random;
            }
        }

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


        
        //条件节点
        public List<AIConditional> childCondtionNodes;
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

        public virtual BaseType GetBaseType() {
            Debug.LogError("Need override GetBaseType");
            return BaseType.Action;
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


        public TestHero SelectTarget() {
            return null;
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
                    node.parentNode = this;
                    childs.Add(node);
                    if (node.GetBaseType() == BaseType.Conditional) {
                        childCondtionNodes.Add(node as AIConditional);
                    }
                
                }
            }
        }
        public virtual void AbortCheck()
        {


        }

        public virtual void OnPause() { }
        public virtual void OnReseum() { }
        public virtual void OnEnter() { 
            this.excuteState  = ExcuteState.Excute_Read ;
            this.executeCount = this.executeCount + 1;
            this.deltaTime    = 0 ;
            this.PrepChild() ;
            this.OnEnterImpl();

        }
        public virtual void OnExit() { }
        public virtual void OnUpdate(float time) {

            this.deltaTime = this.deltaTime + time;
            if (this.excuteState == ExcuteState.Excute_Read){
                this.excuteState = ExcuteState.Excute_Progress; 
                this.OnExecute();
            }
            if(this.excuteState == ExcuteState.Excute_Progress) {
                this.OnUpdateImpl();
            }


            if(this.excuteState == ExcuteState.Excute_Complete) {

                this.OnExecuteComplete();
            } 
        }

        public virtual void OnUpdateImpl()
        {
      
        }

        public virtual void OnExecuteComplete()
        {
            
        }

        public virtual bool OnPop(bool result) {
            this.nodeState = NodeState.Complete;
            return result;
        }

        public virtual void PrepChild(){
            this.childNode = this.childs[0];
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

        public virtual void NextChild() { 
        
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





        public virtual void OnExitImpl()
        {


        }
        public virtual void OnEnterImpl()
        {


        }
        //子类重写实现逻辑
        public virtual void OnExecute()
        {

            this.excuteState = ExcuteState.Excute_Complete;//执行完成
            this.excuteResult = true;//执行成功
        }




        public void SetExcuteState(ExcuteState excuteState, bool excuteResult)
        {
            this.excuteState = excuteState;
            if (this.excuteResult)
            {
                this.excuteResult = excuteResult;
            }
        }


        public void SetExcuteComplete_Success(bool excuteResult)
        {
            this.excuteState = ExcuteState.Excute_Complete;
            this.excuteResult = true;
        }

        public void SetExcuteComplete_Fail(bool excuteResult)
        {
            this.excuteState = ExcuteState.Excute_Complete;
            this.excuteResult = false;
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