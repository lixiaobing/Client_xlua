#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using hjcd.level;
using System;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    /* [XmlInclude(typeof(Root))]*/

    [XmlInclude(typeof(CheckFight))]
    [XmlInclude(typeof(SetFight))]
    [XmlInclude(typeof(Root))]
    [XmlInclude(typeof(Action))]
    [XmlInclude(typeof(SetAttr))]
    [XmlInclude(typeof(ChangeAttr))]
    [XmlInclude(typeof(ChangeBuff))]
    [XmlInclude(typeof(ChangeVariable))]
    [XmlInclude(typeof(Chat))]
    [XmlInclude(typeof(Move))]
    [XmlInclude(typeof(MoveDir))]
    [XmlInclude(typeof(MoveTo))]
    [XmlInclude(typeof(ControlTrigger))]
    [XmlInclude(typeof(UseSkill))]
    [XmlInclude(typeof(Composites))]
    [XmlInclude(typeof(Random))]
    [XmlInclude(typeof(Selector))]
    [XmlInclude(typeof(Sequence))]
    [XmlInclude(typeof(CheckAngle))]
    [XmlInclude(typeof(CheckAttrPercent))]
    [XmlInclude(typeof(CheckDistance))]
    [XmlInclude(typeof(CheckState))]
    [XmlInclude(typeof(CompareVariable))]
    [XmlInclude(typeof(CheckVariable))]
    [XmlInclude(typeof(Conditional))]
    [XmlInclude(typeof(Decorator))]
    [XmlInclude(typeof(Repeat))]
    [XmlInclude(typeof(Wait))]
    [XmlInclude(typeof(Escape))]
    [XmlInclude(typeof(CountDown))]
    [XmlInclude(typeof(CheckAttr))]
    [XmlInclude(typeof(CheckBattleTime))]
    [XmlInclude(typeof(CheckRunTime))]
    [XmlInclude(typeof(Idle))]
    [XmlInclude(typeof(Fallow))]
    [XmlInclude(typeof(Patrol))]
    [XmlInclude(typeof(Linkage))]
    [XmlInclude(typeof(TimeScale))]
    [XmlInclude(typeof(CheckSkillCountDown))]
    [XmlInclude(typeof(CheckAttactSize))]
    [XmlInclude(typeof(RandomGroup))]
    [XmlInclude(typeof(StartAttack))]
    [XmlInclude(typeof(ConditonGroup))]
    [XmlInclude(typeof(CheckRoleNum))]
    [XmlInclude(typeof(CheckCanMove))]
    [XmlInclude(typeof(SetAreaFight))]
    [XmlInclude(typeof(CheckBeHit))]
    [XmlInclude(typeof(ReturnTrue))]
    [XmlInclude(typeof(ReturnFalse))]
    [XmlInclude(typeof(ReturnInverse))]
    [XmlInclude(typeof(CountDownOnce))]
    [XmlInclude(typeof(TriggerBuff))]
    [XmlInclude(typeof(BackRoot))]
    [XmlInclude(typeof(WillBeHit))]
    public class BehaviorTree : ScriptableObject 
    {
        //行为树编号
        public int id = 0;

        //行为树编号
        public string name = "";

        //日志输出
        public bool debug = false;
        //变量列表
        public List<Variable> variables = new List<Variable>();
        //节点列表
        public List<Node> nodes = new List<Node>();



        private static Model model;
        private bool active = false;
        private static BehaviorTree instance;
        private DrawObject focus;
        private string currentSavePath
        {
            get
            {
                return BehaviorTreeConst.GetBehaviorTreeFilePath(this.id);

            }
        }
        //导出文件
        private string exportPath
        {

            get
            {
                return BehaviorTreeConst.GetBehaviorTreeExportFilePath(this.id);

            }
        }

        public bool IsActive()
        {
            return active;
        }
        public DrawObject Focus()
        {
            return focus;
        }
        public void SetFocus(DrawObject value)
        {
            focus = value;
            RepaintWindow();
        }

        public static BehaviorTree Instance
        {
            get
            {
                return instance;
            }
        }

        public void AddVariable(string name, int value)
        {
            Variable variable = new Variable();
            variable.name = name;
            variable.value = value;
            variables.Add(variable);
        }
        public void RemoveVariable(Variable variable)
        {

            variables.Remove(variable);

        }
        public Node GetNode(string uuid)
        {

            foreach (Node node in nodes)
            {
                if (node.uuid.Equals(uuid))
                {
                    return node;

                }
            }
            return null;
        }

        public void AddNode(Node node)
        {
            if (!nodes.Contains(node))
            {
                nodes.Add(node);
            }

        }
        //删除节点 FLAG是否包含子节点
        public void RemoveNode(Node node ,bool containChild = false)
        {
            nodes.Remove(node);
            RemoveLink(node.uuid);
            if (containChild)
            {

                foreach (var link in node.links)
                {
                    Node child = this.GetNode(link.child);
                    this.RemoveNode(child, containChild);
                }
            }

        }

        //作为模板使用时重先生成UUID
        public void NewUUID()
        {
            //移除跟节点
            foreach (var node in nodes)
            {
                if (node.Type.Equals(typeof(Root).Name))
                {
                    this.RemoveNode(node);
                    break;

                }
            }
            foreach (var node in nodes)
            {
                string uuid = node.uuid;
                string newUUID = IDFactory.GetUUID();

                foreach (var child in nodes) {
                    if (child.uuid.Equals(uuid))
                    {
                        child.uuid = newUUID;
                    }
                    else {
                        foreach (var link in child.links)
                        {
                            if (link.child.Equals(uuid)) {
                                link.child = newUUID;
                            }
                        }  
                    }
                
                }
            }
        }

        public void RemoveLink(string uuid)
        {
            foreach (Node n in nodes)
            {
                n.RemoveLink(uuid);
            }
            RepaintWindow();
        }

        public void CleanUp()
        {
            active = false;
            focus = null;
            nodes.Clear();
            variables.Clear();


            RepaintWindow();
        }
        public void RemoveFocus()
        {
            if (focus != null)
            {
                focus.RemoveSelf();
                focus = null;
            }
        }

        public void Create()
        {
            this.CleanUp();
            this.active = true;
            this.AddNode(new Root());
        }

       
        public void Export()
        {
            AIConfig aiConfig  = ScriptableObject.CreateInstance<AIConfig>();
            aiConfig.id    = this.id;
            aiConfig.name  = this.name;
            aiConfig.debug = this.debug;
            foreach (var variable in this.variables)
            {
                aiConfig.variables.Add(variable); //Utils.Clone(variable)
            }
            foreach (var node in this.nodes) {

                aiConfig.nodes.Add(node.ToScriptableObject());
            }
            string path = BehaviorTreeConst.GetBehaviorTreeExportFilePath(aiConfig.id);
            if (Utils.FileExists(path))
            {
                AssetDatabase.DeleteAsset(path);
            }
            AssetDatabase.CreateAsset(aiConfig, path);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();


        }



        public void Save()
        {

            Utils.XmlSerialize(currentSavePath,this);
            Utils.Log("保存成功:", currentSavePath);
        }

        public void RepaintWindow()
        {
            EventCenter.GetInstance(EventCenterType.AIEditor).Dispatch(new EventCallBack(MessageType.REPAINT));
        }

        /// <summary>
        /// 分组编辑
        /// </summary>
        //////////////////////////////////////////////////////////////////////
        ///
                //新建文件
        public static void Load_(int id)
        {
            //Utils.Log("Load id " + id);
            string filePath = BehaviorTreeConst.GetBehaviorTreeFilePath(id);
            if (File.Exists(filePath))
            {
                BehaviorTree.instance = Utils.XmlDeserialize<BehaviorTree>(filePath);
                BehaviorTree.instance.active = true;
            }
            else
            {
                Utils.Log("打开AI失败"); //是否需要创建
            }

        }
        //新建文件
        public static void Create_(Model model)
        {
            BehaviorTree aIDataMgr = new BehaviorTree();
            aIDataMgr.Create();
            aIDataMgr.id = model.id;
            aIDataMgr.name = model.name;
            aIDataMgr.Save();
            //Utils.XmlSerialize(aIDataMgr.currentSavePath, aIDataMgr);
        }
        //删除文件
        public static void Delete_(Model model)
        {
            string filePath = BehaviorTreeConst.GetBehaviorTreeFilePath(model.id);  //string.Format("Assets/Editor/LevelEditor/_project/ai/{0}.xml", model.id);
            //Utils.Log("filePath:" + filePath +"  存在 "+ File.Exists(filePath));
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
                AssetDatabase.Refresh();
            }
        }
        //复制
        public static bool Copy_(Model src, Model model)
        {
            string filePath = BehaviorTreeConst.GetBehaviorTreeFilePath(src.id);
            if (File.Exists(filePath))
            {
                BehaviorTree aIDataMgr = Utils.XmlDeserialize<BehaviorTree>(filePath);
                aIDataMgr.id = model.id;
                aIDataMgr.name = model.name;
                aIDataMgr.Save();
                return true;
            }

            return false;
        }
        public static void Export_(Model model)
        {
            string filePath = BehaviorTreeConst.GetBehaviorTreeFilePath(model.id);
            if (File.Exists(filePath))
            {
                BehaviorTree aIDataMgr = Utils.XmlDeserialize<BehaviorTree>(filePath);
                aIDataMgr.Export();

            }
            else
            {
                EditorUtility.DisplayDialog("警告","export fail " + filePath + " not exists!","确定");
            }

        }

        public static void Edit_(Model src ,Model model)
        {
            string filePath = BehaviorTreeConst.GetBehaviorTreeFilePath(src.id);
            string _filePath = BehaviorTreeConst.GetBehaviorTreeFilePath(model.id);
            if (!filePath.Equals(_filePath)) {
                File.Move(filePath, _filePath);
            }
            BehaviorTree aIDataMgr = Utils.XmlDeserialize<BehaviorTree>(_filePath);
            aIDataMgr.id = model.id;
            aIDataMgr.name = model.name;
            aIDataMgr.Save();
        }
    }
}
#endif