using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("销毁平台")]
    public class DestoryPlatform : ExecuteNode
    {

        public class PDestoryPlatform_Platform : IExport
        {
            public string uid;
            public float time;
            public string ToLuaString(int indent, bool newLine)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
                indent += 1;
                sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
                sb.Append(ExportUtils.KV(nameof(time), this.time, indent, newLine));
                indent = indent - 1;
                sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
                return sb.ToString();
            }
        }

        public List<PDestoryPlatform_Platform> childs = new List<PDestoryPlatform_Platform>();
        public override void NewUUID()
        {
            base.NewUUID();
        }
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST(nameof(childs), childs, indent, newLine));
            return sb.ToString();
        }



        Vector2 scrollPosition;
        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            if (Utils.Button("新增平台")) {
                PDestoryPlatform_Platform p = new PDestoryPlatform_Platform();
                this.childs.Add(p);
            }
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = childs.Count -1; i > -1; i--)
            {
                var p = childs[i];
                GUILayout.BeginVertical(Utils.Style2);
                p.uid = Utils.TextField("UID", p.uid);
                p.time = Utils.UFloatField("延迟删除时间(秒)", p.time);
                if (Utils.Button("删除"))
                {
                    childs.RemoveAt(i);
                }
                GUILayout.EndVertical();
            }
            EditorGUILayout.EndScrollView();
        }

        public override void CreateObject()
        {
            base.CreateObject();

        }
    }
}