using hjcd.level.CheckPoint.PlotEvent;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [XmlInclude(typeof(TriggerGroup))]
    [XmlInclude(typeof(EObject))]
    [XmlInclude(typeof(BaseObject))]
    public class TriggerGroupGroup:EObject
    {
  
        public List<TriggerGroup> triggerGroups = new List<TriggerGroup>();


       

        public void CreateTriggerGroup()
        {
            TriggerGroup triggerGroup = new TriggerGroup();
            triggerGroup.Name = triggerGroup.GetDefaultName();  //"分组" + triggerGroup.uid.Substring(0, 4);
            triggerGroup.Parent = this;
            triggerGroup.CreateObject();
            triggerGroups.Add(triggerGroup);
        }
        public override void CreateObject()
        {
            if (this.gameObject == null) {
                this.gameObject = new GameObject(this.Name);
                var parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.TRIGGER_PARENT_NAME);
                gameObject.transform.SetParent(parent.transform);
            }
        }

        public string ToLuaString(int indent, bool newLine)
        {
            return "";
        }

        /*         public string ToLuaString(int indent, bool newLine)
                 {
                     StringBuilder sb = new StringBuilder();
                     sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
                     sb.Append(ExportUtils.KV(nameof(id), id, indent + 1, true));
                     sb.Append(ExportUtils.KV(nameof(enable), enable, indent + 1, true));
                     sb.Append(ExportUtils.KV(nameof(unlimited), unlimited, indent + 1, true));
                     sb.Append(ExportUtils.KV(nameof(desc), desc, indent + 1, true));
                     sb.Append(ExportUtils.KV(nameof(loopTimes), loopTimes, indent + 1, true));


                     sb.Append(ExportUtils.KV(nameof(reachConditionNum), reachConditionNum, indent + 1, true));
                     sb.Append(ExportUtils.KV(nameof(excuteNum), excuteNum, indent + 1, true));
                     sb.Append(ExportUtils.KV(nameof(triggerExecutType), triggerExecutType, indent + 1, true));

                     sb.Append(ExportUtils.KV_LIST<TriggerNode>(nameof(triggerNodes), triggerNodes, indent + 1, true));
                     sb.Append(ExportUtils.KV_LIST<ConditionNode>(nameof(conditionNodes), conditionNodes, indent + 1, true));
                     sb.Append(ExportUtils.KV_LIST<ExecuteNode>(nameof(executeNodes), executeNodes, indent + 1, true,false));
                     sb.Append(ExportUtils.F_CurlyBracesRight(0, false));
                     return sb.ToString();
                 }*/

        public override void Destroy() {
            foreach (var item in triggerGroups)
            {
                item.Destroy();
            }
            base.Destroy();
        }


        //重先生成子节点ID
        public void GenerateChildID()
        {
/*            foreach (var node in this.triggerNodes)
            {
                node.NewUUID();
            }
            foreach (var node in this.conditionNodes)
            {
                node.NewUUID();
            }
            foreach (var node in this.executeNodes)
            {
                node.NewUUID();
            }*/
        }
    }


}

