using System.Text;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("场上怪物数量")]
    public class CheckMonsterNum : ConditionNode
    {
        //怪物数量
        public int num;
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(num), num, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系", relationalOperator);
            num = Utils.UIntField("数量", num);
        }
    }
}