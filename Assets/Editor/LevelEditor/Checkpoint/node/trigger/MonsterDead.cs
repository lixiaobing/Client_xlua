using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("怪物死亡")]
    public class MonsterDead : TriggerNode {

       /* public RelationalOperator relationalOperator = RelationalOperator.EQUAL;
        public int num;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(num), num, indent, newLine));
            return sb.ToString();
        }
        public override void OnDraw()
        {
            base.OnDraw();
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系", relationalOperator);
            num = Utils.IntField("数量",num);
        }*/
    }
}