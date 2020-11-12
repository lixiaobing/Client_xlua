using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
using hjcd.level.CheckPoint.PlotEvent;
using UnityEngine.Playables;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("播放音频")]
    public class PlaySound : ExecuteNode {

        public AudioType audioType = AudioType.BackgroundMusic;
        public string eventName = "";
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(eventName), eventName, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(audioType), audioType, indent, newLine));

            return sb.ToString();
        }
        public override void OnDraw() {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            audioType = Utils.EnumPopup("音频类型",audioType);
            if (Utils.Button("选择音效事件"))
            {
/*                new AkWwiseComponentPicker.PickerCreator
                {
                    objectType = WwiseObjectType.Event,
                    wwiseObjectReference = null,
                    pickerPosition = AkUtilities.GetLastRectAbsolute(new Rect(200, 200, 200,200)),
                    selectCallback = (eventname) =>
                    {
                        eventName = eventname;
                    },
                    serializedObject = null
                };*/

            }
            Utils.TextField("音效事件", this.eventName);
            if (string.IsNullOrEmpty(this.eventName))
            {
                Utils.LabelTip("请选填写事件名称");
            }
        }



    }
}