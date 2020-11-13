using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level {


    //目标选择器
    public class SelectTarget2 :IExport
    {

        public SelectTargetType2 selectTargetType = SelectTargetType2.SELF;
        //指定目标的ID
        public int targetId;
        //自定义的阵营
        public Camp camp = Camp.ALL;
        //自定义的目标状态
        public TargetState targetState = TargetState.HP_MIN;

        public string ToLuaString(int indent, bool newLine)
        {
/*            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(selectTargetType), selectTargetType, indent,newLine));
            sb.Append(ExportUtils.KV(nameof(targetId), targetId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(camp), camp, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(targetState), targetState, indent, newLine));
            return sb.ToString();
            */
            return "";
        }
    }
}