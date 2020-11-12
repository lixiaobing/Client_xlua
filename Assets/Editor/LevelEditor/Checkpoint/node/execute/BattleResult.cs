using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("游戏结果")]
    public class BattleResult : ExecuteNode
    {
        public BattleResultType battleResultType = BattleResultType.VICTORY;



/*        public int durationTime = 0; //慢镜头持续时间
        public float scale = 1.0f;      //时间缩放*/
        public bool isTimeScale = true;      //时间缩放
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(battleResultType), battleResultType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(isTimeScale), isTimeScale, indent, newLine));
     /*       sb.Append(ExportUtils.KV(nameof(durationTime), durationTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(scale), scale, indent, newLine));*/

            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();

            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.battleResultType = Utils.EnumPopup<BattleResultType>("战斗结果",this.battleResultType);

            isTimeScale = Utils.Toggle("是否播放慢镜头", isTimeScale);

/*            if (isTimeScale) {
                this.durationTime = Utils.IntField("持续时间(毫秒)", this.durationTime);
                this.scale = Utils.FloatField("TimeScale", this.scale);
            }*/

        }
    }
}