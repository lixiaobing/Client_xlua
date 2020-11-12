using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint.PlotEvent
{
    [EnumDescription("动作减缓")]
    public class SlowScale : TimeEvent
    {
        public int timeScale = 1000;     //角色ID
        public int duration  = 0;      //持续时间
        public override void Draw(PlayPlot playPlot) {
            EditorGUILayout.BeginVertical(Utils.Style2);
            base.Draw(playPlot);
            timeScale = Utils.IntField("TimeScale", timeScale);
            duration  = Utils.IntField("持续时间", duration);
            if (Utils.Button("删除"))
            {
                playPlot.PreRemove(this);
            }
            EditorGUILayout.EndVertical(); 
        }

        public override string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(base.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(timeScale), timeScale, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(duration), duration, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
    }
}