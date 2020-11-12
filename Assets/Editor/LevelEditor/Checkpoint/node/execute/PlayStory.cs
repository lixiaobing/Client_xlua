using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
using hjcd.level.CheckPoint.PlotEvent;
using UnityEngine.Playables;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("播放剧情2")]
    public class PlayStory : ExecuteNode
    {
        //剧情文件分2钟形式 
        //1.直接和场景编辑在一起的 
        //2.通过prefab加载

        public int fadeInTime = 0;
        public int fadeOutTime = 0;
        int selectIndex;
        //剧情物体名称
        public string stroyObjectName;
        //相机切换是否需要过渡过
        public bool transition = true;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fadeInTime), fadeInTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fadeOutTime), fadeOutTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(transition), transition, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(stroyObjectName), stroyObjectName, indent, newLine));
            return sb.ToString();
        }
        UnityEngine.Object obj;
        void DrawGameObjectName() {
            if (!string.IsNullOrEmpty(stroyObjectName) && obj == null) {
                GameObject story = GameObject.FindWithTag("Story");
                if (story != null) {
 /*                   string name = stroyObjectName.Replace(story.name + "/", "");*/
                    Transform tf = story.transform.Find(stroyObjectName);
                    if (tf != null) {
                        obj = tf.GetComponent<PlayableDirector>();
                    }
                }

            }

            obj =  Utils.ObjectField("剧情组件选择", obj, typeof(PlayableDirector),true);
            if (obj != null) {
                PlayableDirector playableDirector = (PlayableDirector)obj;
                stroyObjectName = this.GetTransPath(playableDirector.transform);
            }


            /*PlayableDirector[] array = GameObject.FindObjectsOfType<PlayableDirector>();
            if (array.Length < 1)
            {
                Utils.LabelTip("无法找到剧情组件", UnityEditor.MessageType.Warning);
                selectIndex = 0;
                stroyObjectName = "";
            }
            else {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("剧情对象选择");
                string[] options = new string[array.Length];
                selectIndex = 0;
                for (int index = 0; index < array.Length; index++)
                {
                    options[index] = array[index].gameObject.name;
                    if (stroyObjectName != "") {
                        if (stroyObjectName == Utils.GetTransPath(array[index].transform)) {
                            selectIndex = index;
                        }
                    }
                }
                selectIndex     = EditorGUILayout.Popup(selectIndex, options);
                stroyObjectName = Utils.GetTransPath(array[selectIndex].transform);
                EditorGUILayout.EndHorizontal();
            }*/
            Utils.LabelField("剧情对象", string.IsNullOrEmpty(stroyObjectName) ? "NULL":stroyObjectName);
            if (string.IsNullOrEmpty(stroyObjectName)) {
                Utils.LabelTip("请选择剧情组件", UnityEditor.MessageType.Warning);
            }
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.fadeInTime  = Utils.IntField("黑屏淡入时间", this.fadeInTime);
            this.fadeOutTime = Utils.IntField("黑屏淡出时间", this.fadeOutTime);
            this.transition  = Utils.Toggle("相机融合", this.transition);
            this.DrawGameObjectName();  
        }


        public string GetTransPath(Transform trans)
        {
            if (!trans.parent || trans.parent.tag == "Story")
            {
                return trans.name;

            }
            return GetTransPath(trans.parent) + "/" + trans.name;
        }
    }
}