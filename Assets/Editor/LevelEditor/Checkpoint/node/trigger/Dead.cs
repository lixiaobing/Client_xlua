using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("目标死亡")]
    public class Dead : TriggerNode {
        public SelectTarget selectTarget = new SelectTarget();
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;
        public int num;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(selectTarget.ToLuaString( indent, newLine));
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(num), num, indent, newLine));
            return sb.ToString();
        }



        public override void OnDraw()
        {
            base.OnDraw();
            Utils.DrawSelectTarget("选择对象",selectTarget);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("对比关系", relationalOperator);
            num = Utils.IntField("数量",num);
        }
    }
}