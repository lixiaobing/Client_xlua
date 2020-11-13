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
    [XmlInclude(typeof(Vector3Ex))]
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
    public class AIDataMgr : ScriptableObject,IExport 
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



        private static AIModel model;
        private bool active = false;
        private static AIDataMgr instance;
        private DrawObject focus;
        private string currentSavePath
        {
            get
            {
                return BehaviorTreeConfig.GetBehaviorTreeFilePath(this.id);

            }
        }
        //导出文件
        private string exportPath
        {

            get
            {
                return BehaviorTreeConfig.GetBehaviorTreeExportFilePath(this.id);

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

        public static AIDataMgr Instance
        {
            get
            {

                //if (instance == null)
                //{
                //    instance = new AIDataMgr();//ScriptableObject.CreateInstance<AIDataMgr>();
                //    instance.active = false;
                //}

                return instance;
            }
        }

        public void AddVariable(string name, int value)
        {
            Variable variable = new Variable();//ScriptableObject.CreateInstance<Variable>();
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

        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.Return);
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, true));
            indent = 1;

            sb.Append(ExportUtils.KV(nameof(id), id, indent, true));
            //日志输出
            sb.Append(ExportUtils.KV(nameof(debug), debug, indent, true));
            //变量
/*            sb.Append(ExportUtils.K(nameof(variables), indent, true));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));*/
 /*           foreach (Variable v in variables)
            {

                sb.Append(ExportUtils.KV(v.name, v.value, indent + 1, true));

            }*/
         //sb.Append(ExportUtils.KV_LIST("variables", variables, indent, true));
            /*            sb.Append(ExportUtils.F_CurlyBracesRight(indent, true));*/
            //sb.Append(ExportUtils.Comma);

           sb.Append(ExportUtils.KV_LIST<Variable>(nameof(variables), variables, indent, true));

            //还未完善
            sb.Append(ExportUtils.KV_LIST<Node>(nameof(nodes), nodes, indent, true));
            sb.Append(ExportUtils.F_CurlyBracesRight(0, true));
            return sb.ToString();
        }
        public void Export()
        {
            //string content = this.ToLuaString(0, false);
            //Debug.Log(content); ;
            //string name = "ai_" + this.id + ".lua";
            //string savePath = EditorUtility.SaveFilePanelInProject("保存文件", name, "lua", "请填写文件名");
            //if (Utils.IsVaildPath(savePath))
            //{
            //    System.IO.File.WriteAllText(savePath, content);
            //    Utils.Log("导出成功:", savePath);
            //}
            if (Test.exportMode == Test.ExportMode.Asset)
            {
                //导出AI到asset
                Test.ExportAI(this);
                Utils.Log("导出成功:", exportPath);
            }
            else {
                AIDataMgr temp = AIDataMgr.instance;
                AIDataMgr.instance = this;
                string content = this.ToLuaString(0, false);
                AIDataMgr.instance = temp;
                System.IO.File.WriteAllText(exportPath, content);
                AssetDatabase.Refresh();
                Utils.Log("导出成功:", exportPath);

            }





        }



        /// <summary>
        /// ////////////////////////////////////
        /// </summary>
        //public void Load()
        //{
        //    string file_path = EditorUtility.OpenFilePanel("选择文件", Application.dataPath, "xml");

        //    if (Utils.FileExists(file_path))
        //    {
        //        string asset_path = "Assets" + file_path.Replace(Application.dataPath, "");

        //        AIDataMgr.instance = Utils.XmlDeserialize<AIDataMgr>(asset_path);
        //        AIDataMgr.instance.active = true;
        //        AIDataMgr.instance.currentSavePath = asset_path;
        //        Utils.Log("打开成功:" + asset_path);
        //    }
        //    else
        //    {
        //        Utils.Log("打开失败:" + file_path);
        //    }
        //    RepaintWindow();
        //}
        //public void OtherSave()
        //{
        //    string savePath = EditorUtility.SaveFilePanelInProject("保存文件", "", "xml", "请填写文件名");
        //    if (Utils.IsVaildPath(savePath))
        //    {
        //        Utils.XmlSerialize(savePath, this);
        //        currentSavePath = savePath;
        //        Utils.Log("保存成功:" + currentSavePath);
        //    }
        //}
        public void Save()
        {
            //if (Utils.FileExists(currentSavePath))
            //{
            //    Utils.XmlSerialize(currentSavePath, this);
            //    Utils.Log("保存:", currentSavePath);
            //}
            //else
            //{
            //    OtherSave();
            //}

            Utils.XmlSerialize(currentSavePath, this);
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
            string filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(id);
            if (File.Exists(filePath))
            {
                AIDataMgr.instance = Utils.XmlDeserialize<AIDataMgr>(filePath);
                AIDataMgr.instance.active = true;
            }
            else
            {
                Utils.Log("打开AI失败"); //是否需要创建
            }

        }
        //新建文件
        public static void Create_(AIModel model)
        {
            AIDataMgr aIDataMgr = new AIDataMgr();
            aIDataMgr.Create();
            aIDataMgr.id = model.id;
            aIDataMgr.name = model.name;
            aIDataMgr.Save();
            //Utils.XmlSerialize(aIDataMgr.currentSavePath, aIDataMgr);
        }
        //删除文件
        public static void Delete_(AIModel model)
        {
            string filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(model.id);  //string.Format("Assets/Editor/LevelEditor/_project/ai/{0}.xml", model.id);
            //Utils.Log("filePath:" + filePath +"  存在 "+ File.Exists(filePath));
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
                AssetDatabase.Refresh();
            }
        }
        //复制
        public static bool Copy_(AIModel src, AIModel model)
        {
            string filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(src.id);
            if (File.Exists(filePath))
            {
                AIDataMgr aIDataMgr = Utils.XmlDeserialize<AIDataMgr>(filePath);
                aIDataMgr.id = model.id;
                aIDataMgr.name = model.name;
                aIDataMgr.Save();
                return true;
            }

            return false;
        }
        public static void Export_(AIModel model)
        {
            string filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(model.id);
            if (File.Exists(filePath))
            {
                AIDataMgr aIDataMgr = Utils.XmlDeserialize<AIDataMgr>(filePath);
                aIDataMgr.Export();

            }
            else
            {
                EditorUtility.DisplayDialog("警告","export fail " + filePath + " not exists!","确定");
            }

        }

        public static void Edit_(AIModel src ,AIModel model)
        {
            string filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(src.id);
            string _filePath = BehaviorTreeConfig.GetBehaviorTreeFilePath(model.id);
            if (!filePath.Equals(_filePath)) {
                File.Move(filePath, _filePath);
            }
            AIDataMgr aIDataMgr = Utils.XmlDeserialize<AIDataMgr>(_filePath);
            aIDataMgr.id = model.id;
            aIDataMgr.name = model.name;
            aIDataMgr.Save();
        }
    }
}
#endif