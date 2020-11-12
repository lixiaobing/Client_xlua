using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
using hjcd.level.CheckPoint.PlotEvent;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("播放剧情(弃用)")]
    public class PlayPlot : ExecuteNode
    {

        public int fadeInTime = 0;
        public int fadeOutTime = 0;

        //prefab 文件
        public string prefab = "Timeline/test_01";
        //位置信息
        public ETransform position = new ETransform();

        public List<TimeEvent> events = new List<TimeEvent>();
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fadeInTime), fadeInTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fadeOutTime), fadeOutTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(prefab), prefab, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(position), position, indent, newLine));
            sb.Append(ExportUtils.KV_LIST<TimeEvent>(nameof(events), events, indent, newLine));
            return sb.ToString();
        }

        private bool active;
        private Vector2 scrollPos;
        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.fadeInTime  = Utils.IntField("黑屏淡入时间", this.fadeInTime);
            this.fadeOutTime = Utils.IntField("黑屏淡出时间", this.fadeOutTime);
            Utils.TextField("剧情文件", this.prefab); 
            active = Utils.Toggle("演示", active);
            if (gameObject != null) {

                position.OnDraw(gameObject);

            }
            else {
                position.OnDraw();
            }
           
            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("选择Prefab"))
            {
                this.SelectPrefab();
            }
            if (Utils.Button("新增事件"))
            {
                ShowMenu();
            }
            EditorGUILayout.EndHorizontal();
            scrollPos=  EditorGUILayout.BeginScrollView(scrollPos);
            for (int i = 0; i < events.Count; i++)
            {
                events[i].Draw(this);
            }
            EditorGUILayout.EndScrollView();
            this.DoRemove();
            this.SetActive(active);
        }
        private TimeEvent preRemoveObj;
        public void PreRemove(TimeEvent dialog) {
            preRemoveObj = dialog;
        }
        public void DoRemove()
        {
            if (preRemoveObj != null) {
                this.events.Remove(preRemoveObj);
            }
        }
        public void SelectPrefab() {

            string prefabFile = EditorUtility.OpenFilePanel("选择文件", Utils.ResourcesPath + "Timeline", "prefab");
            if (prefabFile == null || prefabFile.Equals(""))
            {
                Utils.Log("未选择文件");
            }
            else
            {
                prefabFile  = prefabFile.Replace(Utils.ResourcesPath, "").Replace(".prefab", "");

                if (!this.prefab.Equals(prefabFile)) {
                    this.prefab = prefabFile;
                    if (this.gameObject != null)
                    {
                        GameObject.DestroyImmediate(this.gameObject);
                        this.gameObject = null;
                    }

                }
            }

        }

        public void OnAddCallback(object obj)
        {
            TimeEvent timeEvent = Utils.CreateInstance<TimeEvent>(obj.ToString());
            events.Add(timeEvent);
        }

        public void ShowMenu()
        {

/*            GenericMenu.MenuFunction2 function = OnAddCondtionNodeCallback;*/
            UnityEditor.GenericMenu menu = new GenericMenu();
            foreach (System.Type type in NodeType.events)
            {
                menu.AddItem(new GUIContent(Utils.GetDescription(type)), false, OnAddCallback, type.FullName);
            }
            menu.ShowAsContext();
        }

        public void SetActive(bool active)
        {
            if (active)
            {
                if (!string.IsNullOrEmpty(this.prefab)) {
                    if (this.gameObject == null)
                    {
                        Object prefab = Utils.LoadAsset(this.prefab);
                        this.gameObject = (GameObject)GameObject.Instantiate(prefab);
                        this.gameObject.name = "TimeLine_" + this.id;
                    }
                }
            }
            if (this.gameObject != null) {
                this.gameObject.SetActive(active);
                this.gameObject.transform.position    = position.position;
                this.gameObject.transform.localScale  = position.scale;
                this.gameObject.transform.eulerAngles = position.rotation;
            }
        }
    }
}