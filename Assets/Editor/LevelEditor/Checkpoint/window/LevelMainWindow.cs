using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.CheckPoint
{
    public class LevelMainWindow : BaseWindow, IOperate
    {
        public static LevelMainWindow instance;






        public static void OpenWindow()
        {
            BaseWindow.OpenWindow<LevelMainWindow>();
            //PlayerPrefs
        }

        public static void ClosweWindow()
        {
            if (instance != null)
            {
                instance.Close();
                instance = null;
            }

        }



        public ObjectLevelInfo data;
        ~LevelMainWindow()
        {
            if (instance == this) {
                instance = null;
            }
            
        }

        public LevelMainWindow()
        {
            instance = this;
            extends[0] = false;
            extends[1] = true;
            extends[2] = false;
            extends[3] = false;
            EventCenter.GetInstance(EventCenterType.CPEditor).RegisterListener(MessageType.REPAINT, DoRepaint);

        }


        private void LoadData()
        {
            if (data == null)
            {
                int id = PlayerPrefs.GetInt("EditorCheckPoint");
                data = ObjectLevelInfo.Load_(id);
            }
        }


        void DoRepaint(EventCallBack eventCall)
        {
            this.Repaint();
        }



        void OnGUI()
        {
            LoadData();
            DrawMenu();
            if (data != null)
            {
                DrawLevel();
            }
        }

        Vector2 bornScrollPos;
        Vector2 wallScrollPos;
        Vector2 triggerScrollPos;
        Vector2 propScrollPos;
        void DrawLevel()
        {
            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginVertical(Utils.Style1);
            Utils.LabelField("关卡ID", data.id.ToString());
            Utils.LabelField("关卡名称", data.name);
            Utils.LabelField("分组类型", data.groupName);
            //data.groupType = Utils.EnumPopup<LevelGroupType>("分组类型", data.groupType);
            data.playStartAnimation = Utils.Toggle("开场动画", data.playStartAnimation);
            data.fadeIn             = Utils.Toggle("开场淡入(无开场动画时生效)", data.fadeIn);
            data.SceneObject = Utils.ObjectField("场景文件", data.sceneObject, typeof(SceneAsset), false);
            data.cameraEffect.OnDraw();//警戒效果
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("关卡音乐");
            string btnName = string.IsNullOrEmpty(data.soundEventName)?"事件选择": data.soundEventName; 
            if (Utils.Button(btnName)) {

/*                new AkWwiseComponentPicker.PickerCreator
                {
                    objectType = WwiseObjectType.Event,
                    wwiseObjectReference = null,
                    pickerPosition = AkUtilities.GetLastRectAbsolute(new Rect(200, 400, 200, 200)),
                    selectCallback = (eventname) =>
                    {
                        data.soundEventName = eventname;
                    },
                    serializedObject = null
                };*/
            }
            Utils.LabelTip("AkWwiseComponentPicker not found", UnityEditor.MessageType.Error);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.LabelField("注释");
            data.desc = GUILayout.TextField(data.desc);
            EditorGUILayout.EndVertical();
            DrawGameObjects();
            DrawBorns();
            DrawTriggers();
            //_DrawTriggers();
            DrawProps();
            EditorGUILayout.EndVertical();
        }

        public void DrawGameObjects() 
        {
            EditorGUILayout.BeginVertical(Utils.Style1);
            EditorGUILayout.BeginHorizontal();
            bool ret = EditorGUILayout.Foldout(extends[3], "关卡据点和区域");
            this.SetExtend(3, ret);
            if (Utils.Button("刷新", GUILayout.MaxWidth(100)))
            {
                data.LoadLevelNogs();
            }
            EditorGUILayout.EndHorizontal();
            if (extends[3])
            {
                EditorGUILayout.BeginVertical(Utils.Style2);
                for (int i = 0; i < data.strongholds.Count; i++)
                {
                    var item= data.strongholds[i];
                    Utils.LabelField("据点"+i, item);
                }
                for (int i = 0; i < data.areas.Count; i++)
                {
                    var item = data.areas[i];
                    Utils.LabelField("区域" + i, item);
                }
                for (int i = 0; i < data.walls.Count; i++)
                {
                    var item = data.walls[i];
                    Utils.LabelField("区域墙" + i, item);
                }
                EditorGUILayout.EndVertical();
            }
            EditorGUILayout.EndVertical();
        }

        //出生点
        public void DrawBorns()
        {
            EditorGUILayout.BeginVertical(Utils.Style1);
            EditorGUILayout.BeginHorizontal();
            bool ret = EditorGUILayout.Foldout(extends[0], "出生点");
            this.SetExtend(0, ret);
            if (Utils.Button("新增", GUILayout.MaxWidth(100)))
            {
                data.AddBornPoint();
            }
            EditorGUILayout.EndHorizontal();
            if (extends[0])
            {
                EditorGUILayout.BeginVertical(GUILayout.ExpandHeight(true));
                bornScrollPos = EditorGUILayout.BeginScrollView(bornScrollPos, GUILayout.ExpandHeight(true));

                if (data.borns.Count > 0)
                {
                    foreach (Born born in data.borns)
                    {
                        born.OnDraw(this);
                    }

                    DoDelBorn();
                }
                else
                {

                    Utils.LabelTip("点击新增按钮添加出生点(至少需要一个出生点)", UnityEditor.MessageType.Error);
                }
                EditorGUILayout.EndScrollView();
                EditorGUILayout.EndVertical();
            }
            EditorGUILayout.EndVertical();

        }

        //场景道具
        public void DrawProps()
        {
            EditorGUILayout.BeginVertical(Utils.Style1);
            EditorGUILayout.BeginHorizontal();
            bool ret = EditorGUILayout.Foldout(extends[2], "可破坏物");
            this.SetExtend(2, ret);
            if (Utils.Button("新增", GUILayout.MaxWidth(100)))
            {
                data.AddProp();
            }
            EditorGUILayout.EndHorizontal();
            if (extends[2])
            {
                EditorGUILayout.BeginVertical(GUILayout.ExpandHeight(true));
                propScrollPos = EditorGUILayout.BeginScrollView(propScrollPos, GUILayout.ExpandHeight(true));
                if (data.props.Count > 0)
                {
                    //Trigger removeTrigger = null;
                    foreach (Obstacle prop in data.props)
                    {
                        prop.OnDraw(this);
                    }
                }
                else
                {
                    Utils.LabelTip("点击新增按钮添加道具");
                }
                EditorGUILayout.EndScrollView();
                EditorGUILayout.EndVertical();
            }
            EditorGUILayout.EndVertical();

            DoDelProp();
        }


        public void DrawTriggers() {
            EditorGUILayout.BeginVertical(Utils.Style1);
    
            EditorGUILayout.BeginHorizontal();
            bool ret = EditorGUILayout.Foldout(extends[1], "触发器");
            this.SetExtend(1, ret);
            if (Utils.Button("新增", GUILayout.MaxWidth(100)))
            {
                data.AddTriggerGroupGroup();
            }
            EditorGUILayout.EndHorizontal();
            if (ret)
            {

                EditorGUILayout.BeginVertical(GUILayout.ExpandHeight(true));
                triggerScrollPos = EditorGUILayout.BeginScrollView(triggerScrollPos, GUILayout.ExpandHeight(true));
                if (data.triggerGroupGroups.Count > 0)
                {
                    for (int index = data.triggerGroupGroups.Count - 1; index > -1; index--)
                    {
                        var triggerGroup = data.triggerGroupGroups[index];

                        EditorGUILayout.BeginHorizontal();
                        Utils.Box(triggerGroup.Name, GUILayout.ExpandWidth(true), GUILayout.MinWidth(150));
                        if (Utils.Button("打开", GUILayout.MaxWidth(100)))
                        {
                            TriggerGroupWindow.CloseWindow();
                            TriggerGroupWindow.OpenWindow<TriggerGroupWindow>(triggerGroup);
                        }

                        if (triggerGroup.Edit)
                        {
                            triggerGroup.Name = EditorGUILayout.TextField(triggerGroup.Name);
                            if (Utils.Button("完成", GUILayout.MaxWidth(100)))
                            {
                                triggerGroup.Edit = false;
                            }
                        }
                        else
                        {
                            if (Utils.Button("改名", GUILayout.MaxWidth(100)))
                            {
                                triggerGroup.Edit = true;
                            }
                        }




                        if (Utils.Button("刪除", GUILayout.MaxWidth(100)))
                        {
                            data.triggerGroupGroups.RemoveAt(index);
                            triggerGroup.Destroy();
                        }

                        EditorGUILayout.EndHorizontal();
                    }
                }
                else
                {
                    Utils.LabelTip("点击新增分组按钮，创建分组");
                }
                EditorGUILayout.EndScrollView();
                EditorGUILayout.EndVertical();
            }
    
            

            //trigger_groups
            EditorGUILayout.EndVertical();



        }
        

        //触发器
        public void _DrawTriggers()
        {


            EditorGUILayout.BeginVertical(Utils.Style1);

            EditorGUILayout.BeginHorizontal();
            bool ret = EditorGUILayout.Foldout(extends[1], "触发器");
            this.SetExtend(1, ret);
            if (Utils.Button("新增分组", GUILayout.MaxWidth(100)))
            {
                data.AddTriggerGroup();
            }

            if (Utils.Button("排序↑", GUILayout.MaxWidth(100)))
            {
                data.SortTriggers(false);
            }
            if (Utils.Button("排序↓", GUILayout.MaxWidth(100)))
            {
                data.SortTriggers(true);
            }

            EditorGUILayout.EndHorizontal();






            if (extends[1])
            {
                EditorGUILayout.BeginVertical(GUILayout.ExpandHeight(true));
                triggerScrollPos = EditorGUILayout.BeginScrollView(triggerScrollPos, GUILayout.ExpandHeight(true));

                if (data.triggerGroups.Count > 0)
                {
                    Trigger removeTrigger = null;
                    Group removeGroup = null;
                    foreach (var group in data.triggerGroups)
                    {
                        EditorGUILayout.BeginVertical(Utils.Style2);
                        EditorGUILayout.BeginHorizontal();
                        group.foldOut = EditorGUILayout.Foldout(group.foldOut, group.Name());
                        if (group.Edit)
                        {
                            group.name = EditorGUILayout.TextField(group.name);
                            if (Utils.Button("完成", GUILayout.MaxWidth(100)))
                            {
                                group.Edit = false;
                                data.Save();
                            }

                        }
                        else
                        {
                            if (Utils.Button("修改名称", GUILayout.MaxWidth(100)))
                            {
                                group.Edit = true;
                            }
                        }
                        if (Utils.Button("删除分组", GUILayout.MaxWidth(100)))
                        {
                            removeGroup = group;

                        }

                        if (Utils.Button("新增", GUILayout.Width(100)))
                        {

                            data.AddTrigger(group.id);
                            group.foldOut = true;
                        }
                        EditorGUILayout.EndHorizontal();
                        if (group.foldOut)
                        {
                            for (int i = 0; i < data.triggers.Count; i++)
                            {
                                Trigger trigger = data.triggers[i];
                                if (trigger.groupId == group.id)
                                {
                                    EditorGUILayout.BeginHorizontal();
                                    Utils.Box(trigger.id.ToString() + trigger.Desc, GUILayout.ExpandWidth(true));

                                    if (Utils.Button("编辑", GUILayout.MaxWidth(80)))
                                    {
                                        TriggerWindow.CloseWindow();
                                        this.Open<TriggerWindow>(trigger);
                                    }
                                    if (Utils.Button(trigger.enable ? "已激活" : "未激活", trigger.enable ? Color.yellow : Color.red, GUILayout.MaxWidth(80)))
                                    {
                                        trigger.enable = !trigger.enable;
                                    }

                                    if (Utils.Button("复制", GUILayout.MaxWidth(80)))
                                    {
                                        data.CloneTrigger(trigger);
                                    }

                                    if (Utils.Button("刪除", GUILayout.MaxWidth(80)))
                                    {
                                        removeTrigger = trigger;
                                    }
                                    EditorGUILayout.EndHorizontal();
                                }
                            }


                        }
                        EditorGUILayout.EndVertical();
                    }
                    if (removeTrigger != null)
                    {
                        data.RemoveTrigger(removeTrigger);
                    }
                    if (removeGroup != null)
                    {

                        data.RemoveTriggerGroup(removeGroup);
                    }
                }
                else
                {
                    Utils.LabelTip("点击新增分组按钮，创建触发器分组");
                }








                EditorGUILayout.EndScrollView();
                EditorGUILayout.EndVertical();
            }

            EditorGUILayout.EndVertical();

        }
        public void DrawMenu()
        {

            GUILayout.BeginHorizontal(GUI.skin.customStyles[258], GUILayout.ExpandWidth(true));

            if (Utils.Button("保存", GUILayout.Width(80), GUILayout.Height(30)))
            {
                DoSave();
            }
            if (Utils.Button("导出", GUILayout.Width(80), GUILayout.Height(30)))
            {
                DoExport();
            }
            if (Utils.Button("导出怪物", GUILayout.Width(80), GUILayout.Height(30)))
            {
                DoExportMonster();
            }

            if (Utils.Button("进入关卡", GUILayout.Width(80), GUILayout.Height(30)))
            {
                if (EditorApplication.isPlaying)
                {
                    return;
                }
                DoSave();
                DoExport();
                this.Close();
                PlayerPrefs.SetInt("dungeon_script", data.id); //设置将要打开的关卡
                EditorSceneManager.OpenScene("Assets/Start.unity");
                EditorApplication.EnterPlaymode();
            }


            GUILayout.EndHorizontal();
        }
        //保存
        private void DoSave()
        {
            if (data != null)
            {
                //string savePath = EditorUtility.SaveFilePanelInProject("保存文件", "", "xml", "请填写文件名");
                data.Save();
            }

        }
        private void DoExportMonster()
        {
            if (this.data != null)
            {
                this.data.ExportMonster();
            }
        }


        //导出
        private void DoExport()
        {
            if (this.data != null)
            {
                this.data.Export();
            }
        }
        float m_lastUpdateTime = 0;
        private void Update()
        {

            if (this.position.width < 1)
            {
                //this.position = new Rect(0, 0, 500, 800);
                Utils.Log("w:" + this.position.width + " h:" + this.position.height);
            }


            float curTime = Time.realtimeSinceStartup;
            float dt = curTime - m_lastUpdateTime;
            if (dt < 0)
            {
                dt = 0.004f;
            }
            m_lastUpdateTime = curTime;
            if (data != null)
            {
                data.Update(dt);
            }

        }
        public override void OnDestroyImp()
        {
            Debug.Log("OnDestroy");
            TriggerGroupWindow.CloseWindow();
            EventCenter.GetInstance(EventCenterType.CPEditor).RemoveListener(MessageType.REPAINT, DoRepaint);
        }
        public override void Initlize(params object[] obj)
        {
            this.TitleContent = "关卡编辑";
            this.minSize = new Vector2(500, 800);
            this.maximized = true;
            //this.maxSize = this.minSize;

        }

        void IOperate.Copy(object obj)
        {

            if (obj is Obstacle)
            {
                Obstacle prop = ((Obstacle)obj).Clone();
                prop.CreateObject();
                data.props.Add(prop);
            }
            else if (obj is Born)
            {
                Born born = ((Born)obj).Clone();
                born.CreateObject();
                data.borns.Add(born);
            }
        }

        private Obstacle removeProp = null;
        private Born removeBorn = null;
        void IOperate.PreDel(object obj)
        {
            if (obj is Obstacle)
            {
                removeProp = (Obstacle)obj;
            }
            else if (obj is Born)
            {
                removeBorn = (Born)obj;
            }

        }

        void DoDelProp()
        {

            if (removeProp != null)
            {
                data.props.Remove(removeProp);
                removeProp.Destroy(); //删除游戏对象
                removeProp = null;
            }
        }

        void DoDelBorn()
        {

            if (removeBorn != null)
            {
                data.borns.Remove(removeBorn);
                removeBorn.Destroy(); //删除游戏对象
                removeBorn = null;
            }
        }


    }
}