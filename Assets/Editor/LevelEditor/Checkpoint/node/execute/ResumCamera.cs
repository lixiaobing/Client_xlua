using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("还原摄像机")]
    public class ResumCamera : ExecuteNode
    {
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            return sb.ToString();
        }
        public override void OnDraw()
        {
            base.OnDraw();
            delayTime = Utils.FloatField("延迟时间", delayTime);
        }
    }
}