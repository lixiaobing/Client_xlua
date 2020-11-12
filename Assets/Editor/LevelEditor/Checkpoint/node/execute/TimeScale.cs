using System.Text;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("游戏速度控制")]
    public class TimeScale : ExecuteNode
    {
        public int durationTime; //持续时间
        public float scale = 1.0f;      //time


        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(durationTime), durationTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(scale), scale, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw()
        {
            base.OnDraw();
            this.durationTime = Utils.IntField("持续时间(毫秒)", this.durationTime);
            this.scale        = Utils.UFloatField("TimeScale", this.scale);
        }


    }
}