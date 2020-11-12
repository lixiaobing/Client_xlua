using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("激活操作台")]
    public class ActiveConsole : ExecuteNode
    {
        //控制台的ID
        public string uid;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            return sb.ToString();
        }
        public override void OnDraw()
        {
            base.OnDraw();
            CreateObject();
            delayTime = Utils.FloatField("延迟", delayTime);
            uid = Utils.TextField("控制台UID", uid);
        }



    }
}
    