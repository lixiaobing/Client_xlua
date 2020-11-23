using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{




    ///////////////////////////////////组合节点
    public class AIComposite : AINode
    {
        public new CompositesConfig config;

        public override BaseType GetBaseType()
        {
            return BaseType.Composites;
        }

        public AbortType GetAbortType()
        {
            return config.abortType;
        }



        public override void AbortCheck() {

            var abortType = this.GetAbortType();

            if (abortType == AbortType.Self) { //自身打断
                this.AbortSelfCheck();


            } else if (abortType == AbortType.LowerPriority) { //低优先级打断
                this.AbortLowerPriority();

            } else if (abortType == AbortType.Both) {//自身打断和低优先级打断
                this.AbortBoth();


            }
            else {
                Debug.LogWarning("not abort");

            }
        }

        public virtual bool CanAbort(AIConditional node) { 
	        return node.Decide();
        }

//中断处理
        public void DoAbort() {
                    //TODO 打断时候如何保存执行节点的状态

                    this.ai.DoAbort(this);
        }



        //找直接条件节点
        //已经执行完成的
        public void AbortSelfCheck()
        {
            var nodeState = this.nodeState;
            if (nodeState == NodeState.Running)
            {

                foreach (var node in this.childCondtionNodes)
                {
                    if (node.GetNodeState() == NodeState.Complete)
                    {


                        if (this.CanAbort(node))
                        {
                            this.DoAbort();



                        }
                    }
                }


            }
        }


        public void AbortLowerPriority()
        {
            Debug.LogError("暂不支持LowerPriority类型打断");
            //自身执行完成了
            if (this.GetNodeState() == NodeState.Complete)
            {
            }
        }

        public void AbortBoth() {

            Debug.LogError("暂不支持Both类型打断");
     
        }
    }


    //顺序节点
    public class AISequence : AIComposite
    {
        public override bool CanAbort(AIConditional node) { 
	        return !node.Decide();
        }

    }
    /// <summary>
    /// 选择节点
    /// </summary>
    public class AISelector : AIComposite
    {
        public override bool CanAbort(AIConditional node)
        {
            return node.Decide();
        }

    }
    /// <summary>
    /// 随机节点  
    /// </summary>
    public class AIRandom : AIComposite
    {
        public new RandomConfig config;
        public List<int> weights;
        public int total = 0;
        public AIRandom():base() {
            weights = new List<int>();
            this.total = 0;
            foreach (var link in this.config.links)
            {
                total += link.weight;
                this.weights.Add(total);
            }

        }

        public override void NextChild()
        {
  
        }

        public override AINode GetNextChild()
        {
            return null;
        }

        public override void OnEnterImpl()
        {
            var ranValue = Random.Next(0, this.total);
            for (int i = 0; i < this.weights.Count; i++)
            {
                var weight = this.weights[i];
                if (ranValue <= weight) {
                    this.childIndex = i;
                }
            }
        }
    }
}