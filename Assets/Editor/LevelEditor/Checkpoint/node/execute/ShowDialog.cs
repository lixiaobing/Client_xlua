using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("显示对话")]
    public class ShowDialog : ExecuteNode
    {

        public int dialogId = 0;
 
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(dialogId), dialogId, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.dialogId = Utils.IntField("对话ID", this.dialogId);;
        }
    }
}