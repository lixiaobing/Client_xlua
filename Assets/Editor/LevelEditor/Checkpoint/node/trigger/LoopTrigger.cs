using System.Text;
using UnityEditor;
namespace hjcd.level.CheckPoint
{
    [EnumDescription("间隔触发")]
    public class LoopTrigger : TriggerNode {
        //进入关卡超过多少毫秒触发
        public int time;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(time), time, indent, newLine));
            return sb.ToString();
        }


        public override void OnDraw() {
            base.OnDraw();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("时间（毫秒）");
            time = EditorGUILayout.IntField(time);
            EditorGUILayout.EndHorizontal();
        }
    }
}