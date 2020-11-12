using System.Text;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("任务状态")]
    public class CheckTask : ConditionNode
    {
        //任务ID
        public int taskId ;
        //父任务ID
        public int parentId = 0;
        //任务状态
        public TaskStatus taskStatus = TaskStatus.Done;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(taskId), taskId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(parentId), parentId, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(taskStatus), taskStatus, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            taskId = Utils.UIntField("任务ID", taskId);
            parentId = Utils.UIntField("父任务ID", parentId);
            taskStatus = Utils.EnumPopup<TaskStatus>("状态", taskStatus);
        }



    }
}