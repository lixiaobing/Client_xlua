using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("设置区域")]
    public class SetArea : ExecuteNode
    {

        //区域
        public int area = 0;
    
    
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(area), area, indent, newLine));

            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            area =  Utils.UIntField("区域", area);
        }
 
    }
}