using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("改变门的状态")]
    public class SetGateState : ExecuteNode
    {
        public string uid = "";
        public bool active = false;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(active), active, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.uid    = Utils.TextField("uid", uid);
            this.active = Utils.Toggle("是否激活", active);
        }
    }

}