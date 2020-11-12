using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.BehaviorTree
{
    public class Vector3Ex : IExport
    {
 
        public Vector3 position = Vector3.zero;
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            indent = 0;
            /*            sb.Append(ExportUtils.F_CurlyBracesLeft(indent,false));
                        sb.Append(ExportUtils.KV(nameof(position.x), position.x));
                        sb.Append(ExportUtils.KV(nameof(position.y), position.y));
                        sb.Append(ExportUtils.KV(nameof(position.z), position.z));
                        sb.Append(ExportUtils.F_CurlyBracesRight(indent, false));*/

            sb.Append($"Vector3({position.x},{position.y},{position.z})");
            return sb.ToString();
        }
    }
}