using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("场上怪物同时攻击数量")]
    public class ChangeAttackMode : ExecuteNode
    {
        
        public int attackModeId = 0; // 

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(attackModeId), attackModeId, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            //this.delayTime = Utils.IntField("延迟时间(毫秒)", this.delayTime);
            this.attackModeId = Utils.IntField("攻击模式CID", this.attackModeId);
        }
    }
}