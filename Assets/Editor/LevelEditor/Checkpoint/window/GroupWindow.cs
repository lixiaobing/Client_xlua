using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.CheckPoint
{
    public class GroupWindow : BaseWindow
    {

        public static GroupWindow instance;


        [MenuItem("Tools/Level/关卡编辑 %#F11")] //CTRL SHIFT F10
        public static void OpenWindow()
        {
            if (instance == null)
            {
                GroupWindow window = BaseWindow.GetWindow<GroupWindow>();
                window.Initlize();
            }
        }
        private bool isPlaying;
        public  bool willOpenLevelMainWindow = false;
        public GroupWindow()
        {
            instance = this;
        }

        public override void Initlize(params object[] obj)
        {
            this.TitleContent = "关卡分组编辑";
            this.minSize = new Vector2(600, 800);
            this.maximized = true;
            this.isPlaying = EditorApplication.isPlaying;
        }




        public GroupList _groupList;
        public static string AssetPath = CheckPointConfig.groupFile;
        public GroupList groupList
        {
            get
            {
                if (_groupList == null)
                {
                    if (Utils.FileExists(AssetPath))
                    {
                        _groupList = Utils.AssetDeserialize<GroupList>(AssetPath);
                    }
                    else
                    {
                        _groupList = ScriptableObject.CreateInstance<GroupList>();
                        Group group = new Group();
                        group.id = 0;
                        group.name = "未分组";
                        _groupList.AddGroup(group);
                        Utils.AssetSerialize(AssetPath, _groupList);
                    }
                }

                return _groupList;
            }
        }

        void DoRepaint(EventCallBack eventCall)
        {
            this.Repaint();
        }

        void OnGUI()
        {
            EditorGUILayout.BeginVertical(Utils.Skin.box, GUILayout.ExpandHeight(true));

            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("新建分组"))
            {
                CreateGroupWindow.OpenWindow(this);
            }
            if (Utils.Button("新建关卡"))
            {
                CreateItemWindow.OpenWindow(this);
            }
            if (Utils.Button("重载配置表"))
            {
                LuaUtils.Reload();
            }
            if (Utils.Button("开始游戏"))
            {
                if (LevelMainWindow.instance) {
                    LevelMainWindow.ClosweWindow();
                    willOpenLevelMainWindow = true;
                }
                EditorSceneManager.OpenScene("Assets/Start.unity");
                EditorApplication.EnterPlaymode();
            }
            //转换旧MonsterID
            if (Utils.Button("导出所有"))
            {
                // Utils.TEST();
                if (this.groupList != null)
                {
                    ExportToExcel.MonsterExportAll(this.groupList.aIModels);
                }


/*                ObjectLevelInfo.TempTranlateData();*/

/*                //转换旧的ID
                foreach (Model model in this.groupList.aIModels)
                {
                    ObjectLevelInfo data = ObjectLevelInfo.Load_(model.id);
                    foreach (var trigger in data.triggers)
                    {
                        foreach (var node in trigger.executeNodes)
                        {
                            if (node.Type.Equals("CreateMonsters"))
                            {
                                CreateMonsters createMonsters = (CreateMonsters)node;
                                foreach (var monster in createMonsters.monsters)
                                {
                                    monster.NewUUID();
                                }
                            }
                        }
                    }
                    data.Save();

                }*/
            }
            EditorGUILayout.EndHorizontal();
            Group removeGroup = null;
            Model removeAIModel = null;
            GroupList groupList = this.groupList;

            for (int i = 0; i < groupList.groups.Count; i++)
            {
                //分组数据
                Group group = groupList.groups[i];
                EditorGUILayout.BeginVertical(Utils.Style1);
                EditorGUILayout.BeginHorizontal();
                extends[i] = EditorGUILayout.Foldout(extends[i], group.name);

                if (group.id != 0)
                {
                    group.name = EditorGUILayout.TextField(group.name, GUILayout.Width(60)); //修改分組
                    if (Utils.Button("删除分组", GUILayout.Width(60)))
                    {
                        //Utils.Log("删除分组");

                        if (Utils.DisplayDialog("删除警告", "删除分组'" + group.name + "'?", "确定", "取消"))
                        {
                            removeGroup = group;
                        }
                    }
                }

                EditorGUILayout.EndHorizontal();
                if (extends[i])
                {
                    foreach (Model model in groupList.aIModels)
                    {
                        if (model.groupId == group.id)
                        {

                            if (model.Draw(this))
                            {
                                removeAIModel = model;

                            }
                        }
                    }
                }
                EditorGUILayout.EndVertical();
            }

            EditorGUILayout.EndVertical();
            if (removeAIModel != null)
            {
                this.OnRemoveModel(removeAIModel);
            }
            if (removeGroup != null)
            {
                groupList.RemoveGroup(removeGroup);
            }
        }
        //创建分组
        public void OnCreateGroup(Group group)
        {

            groupList.AddGroup(group);
        }

        //创建关卡
        public void OnCreateModel(Model model)
        {
            groupList.AddAIModel(model);
            Group group = groupList.getGroup(model.groupId);
            ObjectLevelInfo.Create_(model, group.name);
        }
        //删除关卡
        public void OnRemoveModel(Model model)
        {

            if (Utils.DisplayDialog("删除警告", "删除'" + model.name + "'?", "确定", "取消"))
            {
                groupList.RemoveAIModel(model);
                ObjectLevelInfo.Delete_(model.id);
            }
        }
        //复制 
        public void OnCopyModel(Model srcModel)
        {
            //
            Model newModel = new Model();
            newModel.name = srcModel.id + "_copy";
            newModel.id = groupList.NextGlobalBehaviorTreeID();
            newModel.groupId = 0;
            if (ObjectLevelInfo.Copy_(srcModel, newModel))
            { //复制成功
                groupList.AddAIModel(newModel);
            }

        }

        
        //导出关卡怪物数据
        public void OnExportMonster(Model model)
        {
            ObjectLevelInfo.ExportMonster_(model);
        }
        //导出关卡
        public void OnExportBehaviorTree(Model model)
        {
            ObjectLevelInfo.Export_(model);
        }
        //打开行为树
        public void OnOpenBehaviorTree(Model model)
        {
            PlayerPrefs.SetInt("EditorCheckPoint", model.id);
            if (EditorApplication.isPlaying)
            {
                EditorApplication.ExitPlaymode();
                willOpenLevelMainWindow = true;
            }
            else {
                willOpenLevelMainWindow = false;
                LevelMainWindow.ClosweWindow();
                LevelMainWindow.OpenWindow();
            }  
        }

        //编辑行为树
        public void OnEditBehaviorTree(Model model)
        {

            ModifyWindow.OpenWindow(model);

        }

        public void SaveAssets()
        {
            this.groupList.SaveAssets();
        }

        public override void OnDestroyImp()
        {
            this.SaveAssets();
            LevelMainWindow.ClosweWindow();
            ModifyWindow.ClosweWindow();
        }

        private void Update()
        {
            if (isPlaying != EditorApplication.isPlaying) {
                isPlaying = EditorApplication.isPlaying;
                //Utils.Log("EditorApplication.isPlaying:" + EditorApplication.isPlaying);
                if (!EditorApplication.isPlaying)
                {
                    if (willOpenLevelMainWindow)
                    {
                        LevelMainWindow.OpenWindow();
                        willOpenLevelMainWindow = false;
                    }
                }else
                {
                    if (LevelMainWindow.instance) {
                        LevelMainWindow.ClosweWindow();
                        willOpenLevelMainWindow = true;
                    }
                }
               
            }
        }
    }


}