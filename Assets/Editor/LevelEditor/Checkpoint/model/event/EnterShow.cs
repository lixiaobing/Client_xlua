using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint.PlotEvent
{
    [EnumDescription("入场展示")]
    public class EnterShow : TimeEvent
    {   
        public int cid = 0;          //怪物ID
        public int duration = 0;      //展示时间
        public override void Draw(PlayPlot playPlot) {
            EditorGUILayout.BeginVertical(Utils.Style2);
            base.Draw(playPlot);
            cid = Utils.IntField("怪物CID", cid);
            duration = Utils.IntField("持续时间", duration);
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
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(duration), duration, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
    }
}