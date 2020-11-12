using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class GroupWindow : BaseWindow
    {

        public static GroupWindow instance;


        [MenuItem("Tools/Level/BehaviorTree %#F10")] //CTRL SHIFT F10
        public static void OpenWindow() {
            if (instance == null)
            {
                GroupWindow window = BaseWindow.GetWindow<GroupWindow>();
                window.Initlize();
            }
        }

        public GroupWindow() {
            instance = this;
        }

        public override void Initlize(params object[] obj)
        {
            this.TitleContent = "行为树分组编辑";
            this.minSize = new Vector2(600, 800);
            this.maximized = true;

        }


 

        public GroupList _groupList;
        public static string AssetPath = BehaviorTreeConfig.behaviorTreeGroup;
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
                        group.id    = 0;
                        group.name  = "未分组";
                        _groupList.AddGroup(group);

                        group = new Group();
                        group.id = -1;
                        group.name = "预制分组";
                        _groupList.AddGroup(group);

                        Utils.AssetSerialize(AssetPath, _groupList);
                    }
                }

                return _groupList;
            }
            }

        void DoRepaint(EventCallBack eventCall) {
            this.Repaint();
        }
        
        void OnGUI() {

            EditorGUILayout.BeginVertical(Utils.Style1,GUILayout.ExpandHeight(true));
            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("新建分组")) {
                CreateGroupWindow.OpenWindow(this);
            }
            if (Utils.Button("新建行为树"))
            {
                CreateBehaviorTreeWindow.OpenWindow(this);
            }
            EditorGUILayout.EndHorizontal();
            Group removeGroup = null;
            AIModel removeAIModel = null;
            GroupList groupList = this.groupList;

            for (int i = 0; i < groupList.groups.Count; i++)
            {
                //分组数据
                Group group = groupList.groups[i];
                EditorGUILayout.BeginVertical(Utils.Style1);
                EditorGUILayout.BeginHorizontal();
                extends[i] = EditorGUILayout.Foldout(extends[i], group.name);
              
                if (group.id > 0) {
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
                    foreach (AIModel model in groupList.aIModels)
                    {
                        if (model.groupId == group.id) {

                            if (model.Draw(this)) {
                                removeAIModel = model;

                            }
                        }
                    }
                }
                EditorGUILayout.EndVertical();
            }

            EditorGUILayout.EndVertical();
            if (removeAIModel != null) {
                this.OnRemoveBehaviorTree(removeAIModel);
            }
            if (removeGroup != null) {
                groupList.RemoveGroup(removeGroup);
            }
        }
        //创建行为树分组
        public void OnCreateAIGroup(Group group) {

            groupList.AddGroup(group);
        }
        //创建行为树
        public void OnCreateBehaviorTree(AIModel aIModel)
        {
            groupList.AddAIModel(aIModel);
            AIDataMgr.Create_(aIModel);

        }
        //删除行为树
        public void OnRemoveBehaviorTree(AIModel aIModel) {

            if (Utils.DisplayDialog("删除警告", "删除'" + aIModel.name + "'?", "确定", "取消"))
            {
                groupList.RemoveAIModel(aIModel);
                AIDataMgr.Delete_(aIModel);
            }
        }
        //复制 
        public void OnCopyBehaviorTree(AIModel aIModel)
        {
            //aIModel.id
            AIModel copyAIModel = new AIModel();
            copyAIModel.name = aIModel.id + "_copy";
            copyAIModel.id = groupList.NextGlobalBehaviorTreeID();
            copyAIModel.groupId = 0;
            if (AIDataMgr.Copy_(aIModel, copyAIModel))
            { //复制成功
                groupList.AddAIModel(copyAIModel);
            }
            
        }
        //导出行为树
        public void OnExportBehaviorTree(AIModel aIModel)
        {
            AIDataMgr.Export_(aIModel);
        }
        //打开行为树
        public void OnOpenBehaviorTree(AIModel aIModel)
        {
            BehaviorTreeMainWindow.OpenWindow(aIModel);
        }
        //编辑行为树
        public void OnEditBehaviorTree(AIModel aIModel)
        {
            //MainWindow.OpenWindow(aIModel);

            EditBehaviorTreeWindow.OpenWindow(aIModel);

        }

        public void SaveAssets() {
            this.groupList.SaveAssets();
        }

        public override void OnDestroyImp()
        {
            this.SaveAssets();
            BehaviorTreeMainWindow.ClosweWindow();
            EditBehaviorTreeWindow.ClosweWindow();
        }
  
    }


}