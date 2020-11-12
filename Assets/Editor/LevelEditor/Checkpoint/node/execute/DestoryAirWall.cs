using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("删除空气墙")]
    public class DestoryAirWall: ExecuteNode
    {

        //删除的空气墙ID
        public string wallId = "";
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(wallId), wallId, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间", this.delayTime);
            this.wallId = Utils.TextField("空气墙ID", this.wallId);

        }
    }
}