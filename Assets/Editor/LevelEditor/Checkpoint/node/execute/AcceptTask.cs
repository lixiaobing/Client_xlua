using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("接取任务")]
    public class AcceptTask : ExecuteNode
    {
        //任务Id
        public int taskId = 0;
        //子任务ID
        public int subTaskId = 0;
    
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(taskId), taskId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(subTaskId), subTaskId, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            taskId    =  Utils.UIntField("任务ID", taskId);        
            subTaskId =  Utils.UIntField("子任务ID", subTaskId);
        }
 
    }
}