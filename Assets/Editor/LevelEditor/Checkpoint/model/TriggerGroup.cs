using hjcd.level.CheckPoint.PlotEvent;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    public class TriggerGroup: EObject, IExport
    {
    
        public List<Trigger> triggers = new List<Trigger>();


 
        public Trigger CreateTrigger()
        {
            Trigger trigger = new Trigger();
            trigger.Name   = trigger.GetDefaultName();
            trigger.Parent = this;
            trigger.CreateObject();
            triggers.Add(trigger);
            return trigger;
        }
      
        public string ToLuaString(int indent, bool newLine)
        {
            return "";
        }

        public override void CreateObject()
        {
            base.CreateObject();
            if (this.gameObject == null) {
                this.gameObject = new GameObject(this.Name);
                //找父节点
                if (Parent != null) {
                    this.gameObject.transform.SetParent(Parent.GetGameObject().transform);
                }
            }
        }
        public override void Destroy()
        {
            foreach (var trigger in triggers)
            {
                trigger.Destroy();
            }
            base.Destroy();
        }

/*
         //重先生成子节点ID
         public void GenerateChildID() 
         {
             foreach (var node in this.triggerNodes)
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
             }
         }*/
    }


}

