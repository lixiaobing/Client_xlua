using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;


namespace hjcd.level.CheckPoint
{


    public class ObjectLevelInfo : LevelInfo
    {
        //出生点预制体
        public const string BORN_PREFAB_NAME = "Model/Hero/H_Tohka_01";

        public const string EFFECT_PREFAB_NAME = "Effect/Common/";
        //空气墙父节点名称
        public const string WALL_PARENT_NAME = "空气墙";
        //传送点
        public const string POSITION_PARENT_NAME = "传送点";
        //出生点父节点名称
        public const string BORN_PARENT_NAME = "出生点";
        //区域触发器父节点名称
        public const string AREA_PARENT_NAME = "区域";
        //刷怪点父节点名称
        public const string BRUSH_PARENT_NAME = "刷怪点";

        //特效父节点名称
        public const string EFFECT_PARENT_NAME = "特效";
        //平台父节点名称
        public const string PLATFORM_PARENT_NAME = "平台";
        //顶点动画
        public const string VA_PARENT_NAME = "顶点动画";
        //操作台父节点名称
        public const string CONSOLE_PARENT_NAME = "操作台";
        //障碍物父节点名称
        public const string PROP_PARENT_NAME = "障碍物";

        //空气墙父节点名称
        public const string GATE_PARENT_NAME = "门";
        //触发器
        public const string TRIGGER_PARENT_NAME = "触发器";

        //编辑器动态创建根目录
        public const string EDITOR_ROOT = "关卡元素";
        

        //场景对象
        public UnityEngine.Object sceneObject;

        public static GameObject FindParent(string parentName) 
        {

            GameObject root = GameObject.Find(EDITOR_ROOT);
            if (root == null)
            {
                root = new GameObject(EDITOR_ROOT);
            }


            GameObject parent = GameObject.Find(parentName);
            if (parent == null)
            {
                parent = new GameObject(parentName);

                parent.transform.SetParent(root.transform);
            }
            return parent;
        }
        public int NextBornID()
        {
            return autoIncrementIds[0]++;
        }

        public int NextWallID()
        {
            return autoIncrementIds[1]++;
        }
        public int NextPropID()
        {
            return autoIncrementIds[2]++;
        }

        public int NextTriggerID()
        {
            return autoIncrementIds[3]++;
        }



        public void AddBornPoint()
        {


            if (sceneObject == null)
            {
                EditorUtility.DisplayDialog("警告","请先选择场景","确定");
                return;
            }
            Born born = new Born();
            /*            born.uid  = this.NextBornID().ToString();*/
            born.Name = born.GetDefaultName();
            born.CreateObject();
            this.borns.Add(born);
        }
        public void AddProp()
        {
  
            if (sceneObject == null)
            {
                EditorUtility.DisplayDialog("警告", "请先选择场景", "确定");
                return;
            }
            Obstacle p = new Obstacle();
            p.CreateObject();
            this.props.Add(p);
            
            
        }
        //开场必须的触发器
        public void AddTriggerDefault()
        {
            Trigger trigger = new Trigger();
            trigger.id = NextTriggerID();
            trigger.groupId = 0;
            trigger.unlimited     = true;
            trigger.AddTriggerNode(new Start());
            trigger.AddExecuteNode(new ActorEnter());
            triggers.Add(trigger);
        }




        //新增触发器分组的分组
        public TriggerGroupGroup AddTriggerGroupGroup()
        {
            TriggerGroupGroup triggerGroupGroup = new TriggerGroupGroup();
            triggerGroupGroup.Name = triggerGroupGroup.GetDefaultName();
            triggerGroupGroup.CreateObject();
            triggerGroupGroups.Add(triggerGroupGroup);
            return triggerGroupGroup;
        }






        //新增触发器分组
        public bool AddTriggerGroup() {

            int groupId = 0;
            foreach (var g in triggerGroups)
            {
                if (g.id >= groupId)
                {
                    groupId = g.id + 1;
                }
            }
            Group group = new Group();
            group.name = "分组";
            group.id   = groupId;

            triggerGroups.Add(group);
            return true;
        }
        public void RemoveTriggerGroup(Group group)
        {
            if (EditorUtility.DisplayDialog("警告", "是否删除触发器分组:" + group.name + "[" + group.id + "]","确定","取消")) {
                triggerGroups.Remove(group);
                this.Save();
            }
        }
        public void AddTrigger(int groupId)
        {
            if (sceneObject == null)
            {
                EditorUtility.DisplayDialog("警告","请先选择场景","确定");
                return;
            }
            Trigger trigger = new Trigger();
            trigger.id = NextTriggerID();
            trigger.groupId = groupId;
            triggers.Add(trigger);

        }
        public void SortTriggers(bool reverseOrder) {
            int order = reverseOrder ? -1 : 1;
            triggers.Sort((Trigger t1,Trigger t2) => {
                if (t1.orderIndex < t2.orderIndex)
                {
                    return 1;
                }
                else if (t1.orderIndex > t2.orderIndex)
                {
                    return -1;
                }
                else {
                    if (t1.id < t2.id)
                    {
                        return 1* order;
                    }
                    else if (t1.id > t2.id)
                    {
                        return -1* order;
                    };
                }
                return 0;
            });
            this.Save();
        }

        //复制触发器
        public void CloneTrigger(Trigger trigger)
        {
            //接序列化 然后再反序列化
            string tempPath = Application.temporaryCachePath + "/trigger"+ trigger.id + ".xml.tmp";
            Utils.XmlSerialize(tempPath, trigger);
            Trigger _trigger = Utils.XmlDeserialize<Trigger>(tempPath);
            //删除临时文件
            Utils.DeleteFile(tempPath);
            _trigger.id = NextTriggerID();
            _trigger.GenerateChildID();
            triggers.Add(_trigger);
        }



        public void RemoveTrigger(Trigger trigger) {
            triggers.Remove(trigger);
            trigger.Destroy();
        }

        public void Update(float deltaTime)
        {
            foreach (var born in borns)
            {
                born.OnUpdate(Time.deltaTime);
            }
            foreach (var trigger in triggers)
            {
                trigger.OnUpdate(Time.deltaTime);

            }
            foreach (var prop in props)
            {
                prop.OnUpdate(Time.deltaTime);
            }
        }
        //载入新场景
        public void ReLoadScene(String sceneFile)
        {
            this.sceneFile = sceneFile;
            //新场景里添加原有的 出生点 /空气墙 /
            //保存现有场景的一些数据

            EditorSceneManager.OpenScene(sceneFile);

            foreach (var born in borns)
            {
                born.ReCreateObject();
            }

            foreach (var prop in props)
            {
                prop.ReCreateObject();
            }

            Utils.Log("创建触发器 场景部件");
            //加载触发器 相关的场景物体
            foreach (Trigger trigger in triggers)
            {
                //item.executeNodes
/*                foreach (var node in trigger.triggerNodes)
                {
                    node.CreateObject();
                }*/
/*                foreach (var node in trigger.conditionNodes)
                {
                    node.CreateObject();
                }*/
                foreach (var node in trigger.executeNodes)
                {
                    node.CreateObject();
                }      
            }
        }

 

        public UnityEngine.Object SceneObject
        {
            set
            {

                if (sceneObject != value && value != null)
                {
                    sceneObject = value;
                    string result = AssetDatabase.GetAssetPath(sceneObject);
                    FileInfo fileInfo = new FileInfo(result);
                    this.sceneName = fileInfo.Name;
                    this.ReLoadScene(result);
                }

            }
        }
  
        public void Trans2Object() {


           //打开场景
            EditorSceneManager.OpenScene(sceneFile);
            UnityEngine.Object _sceneObject = AssetDatabase.LoadAssetAtPath(this.sceneFile, typeof(SceneAsset));
            sceneObject = GameObject.Instantiate(_sceneObject); //避免临时数据保存到场景
            foreach (var born in borns)
            {
                born.CreateObject();
            }
             //障碍物
            foreach (var prop in props)
            {
                prop.CreateObject();
            }

            foreach (var triggerGroupGroups in triggerGroupGroups)
            {
                triggerGroupGroups.CreateObject();

                foreach (var triggerGroup in triggerGroupGroups.triggerGroups)
                {
                    triggerGroup.Parent = triggerGroupGroups;
                    triggerGroup.CreateObject();

                    foreach (Trigger trigger in triggerGroup.triggers)
                    {

                        trigger.Parent = triggerGroup;
                        trigger.CreateObject();
                        foreach (var node in trigger.triggerNodes)
                        {
                            node.Parent = trigger;
                            node.CreateObject();
                        }
                
                        foreach (var node in trigger.conditionNodes)
                        {
                            node.Parent = trigger;
                            node.CreateObject();
                        }
             
                        foreach (var node in trigger.executeNodes)
                        {
                            node.Parent = trigger;
                            node.CreateObject();
                        }
                    }


                }
            }


            foreach (Trigger trigger in triggers)
            {

                foreach (var node in trigger.triggerNodes)
                {
                    node.CreateObject();
                }
                //
                foreach (var node in trigger.conditionNodes)
                {
                    node.CreateObject();
                }
                //
                foreach (var node in trigger.executeNodes)
                {
                    node.CreateObject();
                }
            }

        }
        public void Save() {
            Utils.XmlSerialize(this.currentSavePath, this.clone());
        }


        public void Export() {
            string content = this.ToLuaString(0, false);
            //Debug.Log(content); ;
            //string savePath = EditorUtility.SaveFilePanelInProject("保存文件", name, "lua", "请填写文件名");
            System.IO.File.WriteAllText(exportPath, content);
            Utils.Log("导出成功:", exportPath);
         
        }

        //怪物导出到列表
        public void ExportMonster() {
            ExportToExcel.MonsterExport(this);
        }
        public static ObjectLevelInfo Parse(string filePath,bool loadObject = true)
        {
            LevelInfo levelInfo =  Utils.XmlDeserialize<LevelInfo>(filePath);
            ObjectLevelInfo objectLevelInfo = new ObjectLevelInfo();
            objectLevelInfo = levelInfo.clone(objectLevelInfo);
            if (loadObject) {
                objectLevelInfo.Trans2Object();
            }
            objectLevelInfo.LoadLevelNogs();
            return objectLevelInfo;
        }


        private string currentSavePath
        {
            get
            {
                return CheckPointConfig.GetFilePath(this.id);

            }
        }
        //导出文件
        private string exportPath
        {

            get
            {
                return CheckPointConfig.GetExportFilePath(this.id);

            }
        }


        //创建
        public static void Create_(Model model,string groupName) {
            ObjectLevelInfo data = new ObjectLevelInfo();
            data.id   = model.id;
            data.name = model.name;
            data.groupName = groupName;
            data.AddTriggerDefault();
            data.AddTriggerGroup(); //默认分组创建
            data.Save();
        }
        //导出
        public static void Export_(Model model)
        {
            ObjectLevelInfo data = ObjectLevelInfo.Load_(model.id,false);
            data.Export();
        }
        public static void ExportMonster_(Model model)
        {
            ObjectLevelInfo data = ObjectLevelInfo.Load_(model.id,false);
            data.ExportMonster();
        }

        //删除
        public static void Delete_(int id)
        {
            string filePath = CheckPointConfig.GetFilePath(id); 
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
                AssetDatabase.Refresh();
            }
        }

        public static void Edit_(Model srcModel, Model newModel,string groupName) 
        {

            string _filePath = CheckPointConfig.GetFilePath(newModel.id);
            if (srcModel.id != newModel.id)
            {
                string filePath = CheckPointConfig.GetFilePath(srcModel.id);
                File.Move(filePath, _filePath);
            }
            ObjectLevelInfo data = ObjectLevelInfo.Parse(_filePath);
            data.id = newModel.id;
            data.name = newModel.name;
            data.groupName = groupName;
            data.Save();

        }
        public static bool Copy_(Model srcModel,Model newModel)
        {
            string filePath = CheckPointConfig.GetFilePath(srcModel.id);
            if (File.Exists(filePath))
            {
                ObjectLevelInfo data = ObjectLevelInfo.Load_(srcModel.id);
                data.id = newModel.id;
                data.name = newModel.name;
                data.Save();
                return true;
            }
            return false;
        }

        //保存
        public static ObjectLevelInfo Load_(int id ,bool loadObject = true)
        {
            string file_path = CheckPointConfig.GetFilePath(id);
            ObjectLevelInfo data = ObjectLevelInfo.Parse(file_path , loadObject);
            return data;
        }

        //数据转换
        public static void TempTranlateData()
        {

            GroupList  groupList = Utils.AssetDeserialize<GroupList>(CheckPointConfig.groupFile);

            foreach (var item in groupList.aIModels)
            {
                ObjectLevelInfo levelInfo = ObjectLevelInfo.Load_(item.id);
                TriggerGroupGroup triggerGroupGroup = new TriggerGroupGroup();
                triggerGroupGroup.Name = "默认大分组";
                TriggerGroup triggerGroup = new TriggerGroup();
                triggerGroup.Name = "默认分组";
                triggerGroupGroup.triggerGroups.Add(triggerGroup);

                levelInfo.triggerGroupGroups.Add(triggerGroupGroup);
                foreach (var trigger in levelInfo.triggers) {

                    trigger.Name = trigger.id.ToString();
                    triggerGroup.triggers.Add(trigger);
                }
                levelInfo.triggers = null;
                levelInfo.triggerGroups = null;
      
                levelInfo.Save();
            }

        }



    }
}