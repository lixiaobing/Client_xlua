using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("关卡事件显示")]
    public class ShowEvent : ExecuteNode
    {

        public string title   = "标题";
        public string content = "内容";
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(title), title, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(content), content, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.title = Utils.TextField("标题", this.title);
            this.content = Utils.TextField("内容", this.content);
        }
    }
}