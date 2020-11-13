using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint.PlotEvent
{
    [EnumDescription("播放动作")]
    public class PlayAction : TimeEvent
    {
        public string uid = "";             //角色ID
        public string actionName = "";  //
        public override void Draw(PlayPlot playPlot) {
            EditorGUILayout.BeginVertical(LGUISkin.Style2);
            base.Draw(playPlot);
            uid        = Utils.TextField("角色UID", uid);
            actionName = Utils.TextField("动画名称", actionName);
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
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(actionName), actionName, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
    }
}