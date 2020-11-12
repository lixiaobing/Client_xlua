using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("播放视频")]
    public class PlayVideo : ExecuteNode
    {

        //视屏地址
        public string url = "";
        //是否淡入
        public bool fadeIn  = false;
        //时间
        public float time   = 0.2f;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(url), url, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(fadeIn), fadeIn, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(time), time, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime   = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.fadeIn      = Utils.Toggle("淡入", fadeIn);
            if (this.fadeIn) {
                this.time = Utils.FloatField("淡入时间(秒)", this.time);
            }
            Utils.TextField("视频文件", this.url);
            if (Utils.Button("选择视频文件"))
            {
                this.SelectFile();
            }
        }
      
        public void SelectFile() {
            string prefabFile = EditorUtility.OpenFilePanel("选择文件", Utils.ResourcesPath + "Video", "mp4,asf,mov,mpg,mpeg");
            if (prefabFile == null || prefabFile.Equals(""))
            {
                Utils.Log("未选择文件");
            }
            else
            {
                prefabFile = prefabFile.Replace(Utils.ResourcesPath, "").Replace(".mp4", "");

                this.url = prefabFile;
            }

        }
       
    }
}