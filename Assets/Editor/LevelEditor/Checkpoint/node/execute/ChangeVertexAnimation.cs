using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("改变顶点动画")]
    public class ChangeVertexAnimation : ExecuteNode
    {
        public string uid             = ""; //查找顶点动画的标识
        public ShaderType shaderType  = ShaderType.WallFlow;
        public UVAnimaitonState state = UVAnimaitonState.Start;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(shaderType), shaderType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(state), state, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime  = Utils.FloatField("延迟时间", this.delayTime);
            this.uid        = Utils.TextField("UID", this.uid);
            this.shaderType = Utils.EnumPopup("ShaderType", this.shaderType);
            this.state = Utils.EnumPopup("AnimaitonState", this.state);
     
        }

    }
}