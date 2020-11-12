using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("移除特效")]
    public class RemoveEffect : ExecuteNode
    {
        public List<string> childs = new List<string>();
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST_VALUE<string>(nameof(childs), childs, indent, newLine, true));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            if (Utils.Button("新增"))
            {
                childs.Add("");
            }
            
            for (int i = 0; i < childs.Count; i++)
            {
                EditorGUILayout.BeginHorizontal();
                childs[i] = EditorGUILayout.TextField("Index"+ i, childs[i]);
                if (Utils.Button("移除",GUILayout.Width(100))) {
                    this.PreDel(i);   
                }
                EditorGUILayout.EndHorizontal();
            }
            DoDel();
        }
        private int preDelIndex = -1;
        private void PreDel(int index) {
            preDelIndex = index;
        }
        private void DoDel()
        {
            if (preDelIndex >= 0) {
                childs.RemoveAt(preDelIndex);
                preDelIndex = -1;
            } 
        }
    }
}