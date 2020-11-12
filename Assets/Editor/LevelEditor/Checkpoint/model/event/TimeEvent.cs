using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint.PlotEvent
{


    [EnumDescription("剧情事件")]
    public class TimeEvent : IExport
    {

        public virtual string Type { get { return this.GetType().Name; } }
        public virtual string Description { get { return Utils.GetDescription(this.GetType()); } }

        public int triggerTime = 0; //触发时间（毫秒）
/*        public string des;          //备注*/
        public bool pause;          // 是否暂停
       
        public virtual void Draw(PlayPlot playPlot) {
            Utils.LabelField("名称", Description);
            triggerTime = Utils.IntField("触发时间",triggerTime);
            pause       = Utils.Toggle("暂停剧情", pause);
        }

        public virtual string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(Type), Type, indent , true));
            sb.Append(ExportUtils.KV(nameof(triggerTime), triggerTime, indent, newLine));
        /*    sb.Append(ExportUtils.KV(nameof(des), des, indent, newLine));*/
            sb.Append(ExportUtils.KV(nameof(pause), pause, indent, newLine));
            return sb.ToString();
        }
    }
}