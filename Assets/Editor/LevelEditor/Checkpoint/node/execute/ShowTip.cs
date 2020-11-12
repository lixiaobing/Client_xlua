using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("关卡提示")]
    public class ShowTip : ExecuteNode
    {
        //提示ID
        public int tipId = 0;
        //标题ID
        public int titleId = 0;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(tipId), tipId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(titleId), titleId, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.titleId = Utils.IntField("标题信息", this.titleId);
            this.tipId = Utils.IntField("提示信息", this.tipId);
        }
    }
}