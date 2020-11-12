using System.Collections.Generic;
using System.Text;
using UnityEditor;
namespace hjcd.level.CheckPoint
{
    [EnumDescription("完成关卡")]
    public class PassCheckPoint : TriggerNode {

        public List<CheckPoint> checkPoints = new List<CheckPoint>();
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV_LIST(nameof(checkPoints), checkPoints, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            if (Utils.Button("新增")) {
                checkPoints.Add(new CheckPoint());
            }
            CheckPoint checkPoint = null;
            foreach (var item in checkPoints)
            {
                if (item.OnDraw()) {
                    checkPoint = item;
                }
            }
            if (checkPoint != null) {
                checkPoints.Remove(checkPoint);
            }
        }
    }
}