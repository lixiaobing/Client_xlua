using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("控制触发器")]
    public class ControlTrigger : ExecuteNode
    {
        //触发器ID
        public string triggerId;
        //激活关闭
        public bool active;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(triggerId), triggerId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(active), active, indent, newLine));

            return sb.ToString();
        }

        public override void OnDraw() {
            base.OnDraw();

            this.triggerId = Utils.TextField("触发器ID)", this.triggerId);

            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);

            this.active = Utils.Toggle("状态(勾选激活否则关闭)", this.active);
   
        }
    }
}