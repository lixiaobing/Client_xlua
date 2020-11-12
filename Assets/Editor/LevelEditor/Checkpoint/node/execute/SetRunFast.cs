using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("设置快跑模式")]
    public class SetRunFast : ExecuteNode
    {
        //是否是快跑模式
        public bool runFast = true; 

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(runFast), runFast, indent, newLine));
            return sb.ToString();
        }

        Vector2 scrollPosition;
        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.runFast = Utils.Toggle("快跑模式",this.runFast);
        }
    }
}