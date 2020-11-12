using System.Text;
using UnityEditor;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("改变空盒跟随状态")]
    public class ChangeSkyBoxFollow : ExecuteNode
    {
        //是否跟随角色
        public bool follow = true;  
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(follow), follow, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.follow = Utils.Toggle("天空盒跟随角色", this.follow);
        }
    }
}