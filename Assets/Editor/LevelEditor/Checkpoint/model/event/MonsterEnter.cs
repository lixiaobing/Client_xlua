using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint.PlotEvent
{
    [EnumDescription("角色入场")]
    public class MonsterEnter : TimeEvent
    {
        public string uid = IDFactory.GetUUID();     //唯一ID
        public int cid = 0;          //怪物ID
        public ETransform position = new ETransform();
        public override void Draw(PlayPlot playPlot) {
            EditorGUILayout.BeginVertical(LGUISkin.Style2);
            base.Draw(playPlot);
            Utils.TextField("怪物UID", uid);
            cid = Utils.IntField("怪物CID", cid);
            //挂网信息展示
            position.OnDraw();
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
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(position), position, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
    }
}