using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{

    [Serializable]
    public class CheckPoint : IExport
    {


        public int id        = 0; //关卡ID
        public int passTimes = 1; //通关次数



        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(ExportUtils.KV(nameof(id), id, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(passTimes), passTimes, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }

       
        public bool OnDraw()
        {
            bool remove = false;
            EditorGUILayout.BeginVertical(Utils.Style2);
            if (Utils.Button("删除")) {
                remove = true;
            }
            this.id        = Utils.IntField("关卡ID", id);
            this.passTimes = Utils.UIntField("通关次数", passTimes);
            EditorGUILayout.EndVertical();
            return remove;
        }
    }
   
}