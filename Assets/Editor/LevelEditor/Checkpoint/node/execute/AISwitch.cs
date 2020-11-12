using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("AI开关")]
    public class AISwitch : ExecuteNode
    {
        //提示ID

        public SwitchType switchType = SwitchType.ON;
        public float offTime; 
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(switchType), switchType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(offTime), offTime, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            switchType    = Utils.EnumPopup<SwitchType>("开启状态" , switchType);
            if (switchType == SwitchType.OFF_TIME) {
                this.offTime = Utils.FloatField("时间", this.offTime);
            }
        }
    }
}