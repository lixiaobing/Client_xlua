using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("播放相机效果")]
    public class PlayCameraEffect : ExecuteNode
    {

        //视屏地址
        public CameraEffect cameraEffect = new CameraEffect();

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cameraEffect), cameraEffect, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            this.delayTime     = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            cameraEffect.OnDraw();


        }       
    }
}