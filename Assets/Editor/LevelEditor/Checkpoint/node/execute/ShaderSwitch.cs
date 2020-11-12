using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("Shader开关")]
    public class ShaderSwitch: ExecuteNode
    {
        public int shaderId = -1;
        public ShaderType shaderType = ShaderType.WallFlow;
        public bool shaderEnabled = false;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(shaderType), shaderType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(shaderId), shaderId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(shaderEnabled), shaderEnabled, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime  = Utils.FloatField("延迟时间", this.delayTime);
            this.shaderId   = Utils.UIntField("ShaderId", this.shaderId);
            this.shaderType = Utils.EnumPopup("Shader", this.shaderType);
            this.shaderEnabled    = Utils.Toggle("启用", this.shaderEnabled);
        }
    }
}