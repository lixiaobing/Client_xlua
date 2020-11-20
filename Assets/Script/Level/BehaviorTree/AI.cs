using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using UnityEngine.Video;
using UnityEngine.UI;

namespace hjcd.level.BehaviorTree
{

    //临时
    public class TestHero : MonoBehaviour
    {
        AI ai;
        public void OnStart()
        {
            ai = new AI("Config/Ai/AI101");
        }
        public void OnUpdate()
        {
            ai.OnUpdate(Time.deltaTime);
        }


    }
    ////////////////////////////////////////////////
    ///执行节点
    public class AI
    {
        public TestHero host;
        public AIConfig config;
        public bool enabled;
        //运行时间
        public float time = 0;
        /// <summary>
        /// 节点列表
        /// </summary>
        public Dictionary<string, AINode> nodes = new Dictionary<string, AINode>();

        /// <summary>
        ///  当前执行节点
        /// </summary>
        public AINode executeNode;
        public AIRootNode rootNode;
        /// <summary>
        /// 中断节点列表
        /// </summary>
        public List<AINode> abortNodes = new List<AINode>();

        public Stack<AINode> runStack = new Stack<AINode>();
        /// <summary>
        /// AI动态变量字典
        /// </summary>
        public Dictionary<string, Variable> variables = new Dictionary<string, Variable>();
        /// <summary>
        ///  设置变量值
        /// </summary>
        /// <param name="name">变量名称</param>
        /// <param name="value">变量值</param>
        public void SetValue(string name, float value)
        {
            if (variables.ContainsKey(name))
            {
                variables[name].value = value;
            }
            else
            {
                Debug.LogWarning(string.Format("AI Variable[0]does not exist", name));
                Variable variable = new Variable();
                variable.name = name;
                variable.value = value;
                variables.Add(name, variable);
            }
        }

        /// <summary>
        /// 获取变量值，如果为空返回0
        /// </summary>
        /// <param name="name">变量名称</param>
        /// <returns>变量值</returns>
        public float GetValue(string name)
        {
            if (variables.ContainsKey(name))
            {
                return variables[name].value;
            }
            else
            {
                Debug.LogWarning(string.Format("AI Variable[0]does not exist", name));
                return 0;
            }
        }
        /// <summary>
        /// 改变变量值
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        public void ChangeValue(string name, float value)
        {
            var _value = GetValue(name);
            _value += value;
            SetValue(name, _value);
        }
        public AI(string path)
        {

        }
        //加载asset文件
        public void Init()
        {
            //预加载
            GameAsset.LoadAsset("", (gameObject) => { });

            //变量初始化定义
            foreach (var variable in config.variables)
            {
                this.variables.Add(variable.name, variable);
            }

            foreach (var nodeConfig in config.nodes)
            {
                this.nodes.Add(nodeConfig.uuid, AINode.Create(nodeConfig));
            }

            foreach (var node in this.nodes.Values)
            {
                node.OnInit(this);
            }
        }

        public AINode GetNode(string id)
        {
            if (this.nodes.ContainsKey(id))
            {
                return this.nodes[id];
            }
            Debug.LogError(string.Format("not found node ，id:{0}", id));
            return null;
        }



        public void Restart() {

            this.runStack.Clear();
            this.Reset();
            this.Start();
        }

        public void Start()
        {
            this.ChangeExecuteNode(this.rootNode);
        }

        public void OnPause()
        {


        }
        public void OnReseum()
        {


        }
        public void OnUpdate(float deltaTime)
        {
            if (enabled) { return; }
            time += deltaTime;
            if (this.executeNode != null) {
                this.executeNode.OnUpdate(deltaTime);
            }
        }
        public void SetRoot(AIRootNode rootNode)
        {
            this.rootNode = rootNode;
        }

        public void ChangeExecuteNode(AINode node)
        {
            if (this.executeNode != node)
            {
                if (this.executeNode != null)
                {
                    this.executeNode.OnExit();
                }
                this.executeNode = node;
                this.executeNode.OnEnter();
            }
        }


        public void Push(AINode node) {
            if (this.executeNode == node) {
                Debug.LogError(node.GetType().Name + "已在栈顶");
                return;
            }
            //检查合法性
            if (node.GetNodeState() != NodeState.Wait)
            {

                Debug.LogError(node.GetType().Name + "非法入栈");

            }
            this.runStack.Push(node);
            this.executeNode = node;
            node.OnPush();
            node.OnEnterTop();

        }



        public void DoNextNode(AINode node, bool result, bool abort)
        {
            if (!abort && this.executeNode != node)
            {//不在栈顶
                Debug.LogError(node.GetType().Name + "not on stack top");
                return;
            }

            if (!abort && result && node.GetChild() != null)
            {
                this.Push(node.GetChild());

            }
            else
            {
                while (this.runStack.Count > 0)
                {
                    node = this.runStack.Peek();

                    string nodeType = node.GetType().Name;

                    if (nodeType == "Sequence")
                    {

                        if (result)
                        {

                            if (node.GetNextChild() != null)
                            {
                                node.NextChild();

                                this.Push(node.GetChild());

                                break;

                            }
                        }
                    }
                    else if (nodeType == "Selector")
                    {

                        if (!result)
                        {

                            if (node.GetNextChild() != null)
                            {
                                node.NextChild();

                                this.Push(node.GetChild());

                                break;

                            }
                        }

                    }
                    else if (nodeType == "Repeat")
                    {

                        if (node.CanRepeat())
                        { //--重复执行判断

                            if (node.GetChild() != null)
                            {
                                node.ResetChilds();

                                node.AddExecuteCount();

                                this.Push(node.GetChild());

                                break;

                            }
                        }

                    }
                    result = this.Pop(result);

                }

                if (this.runStack.Count < 1)
                {
                    this.Restart();

                }
            }
        }



        public bool Pop(bool result) {
            AINode node = this.runStack.Pop();
            return node.OnPop(result);
        }





        public void Reset()
        {
            foreach (var node in nodes.Values)
            {
                node.Reset();
            }
        }
        /// <summary>
        /// 打断检查
        /// </summary>
        public void AbortCheck()
        {
            foreach (var nodes in this.abortNodes)
            {
                nodes.AbortCheck();
            }

        }

        public void DoAbort(AINode node) {
            while (this.runStack.Peek() != node) 
            {
                this.Pop(false);
            }
            this.DoNextNode(this.runStack.Peek(), false, true);
        
        
        }
        public int Size() {
            return this.runStack.Count;
        }

        public void Destroy() { 
        
        
        }
    }

}
