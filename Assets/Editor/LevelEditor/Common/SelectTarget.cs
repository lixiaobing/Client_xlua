using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level {


    //目标选择器
    public class SelectTarget :IExport
    {

        public SelectTargetType selectTargetType = SelectTargetType.ANY_PLAYER;
        public int targetId;
        public void OnDraw() {
            OnDraw("目标选择");
        }
        public void OnDraw(string title)
        {
            selectTargetType = Utils.EnumPopup<SelectTargetType>(title,selectTargetType);
            if (selectTargetType == SelectTargetType.DESIGNATE_MONSTER || selectTargetType == SelectTargetType.DESIGNATE_PLAYER)
            {
                targetId = Utils.IntField("指定ID",targetId);
            }
        }

        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(selectTargetType), selectTargetType, indent,newLine));
            sb.Append(ExportUtils.KV(nameof(targetId), targetId, indent, newLine));
            return sb.ToString();
        }

        //导出是使用
        public override string ToString()
        {
            return "";
        }
    }
}