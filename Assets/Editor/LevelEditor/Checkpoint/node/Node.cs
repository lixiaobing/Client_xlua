using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    public class Node : BaseObject,IExport{

        public string id = IDFactory.GetUUID();
        public bool enable = true;

        public virtual string Type { get { return this.GetType().Name; } }
        public virtual string Description { get { return Utils.GetDescription(this.GetType()); } }

        private bool listener = false;
        public virtual void OnDraw()
        {
            Utils.LabelField("类型", Description);
            Utils.TextField("ID(无法修改)", id);
        }
        public virtual void Destroy() {
            EventCenter.GetInstance(EventCenterType.CPEditor).Dispatch(new EventCallBack(MessageType.REMOVE_NODE, this));
            if (gameObject != null)
            {
                GameObject.DestroyImmediate(gameObject);
                gameObject = null;
            }
            this.RemoveTransformListener();
        }

        public virtual void OnUpdate(float deltaTime)
        {

        }

        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            sb.Append(ExportUtils.KV(nameof(id), id, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(Type), Type, indent + 1, true));
            sb.Append(ExportUtils.KV(nameof(enable), enable, indent + 1, true));
            
            sb.Append(ToStringEx(indent + 1, newLine));
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
        public virtual string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();

            return sb.ToString();
        }

        public virtual void CreateObject() {
            this.AddTransformListener();
        }
        public void DoFocus() {
            if (gameObject != null) {
                UnityEditor.Selection.activeGameObject = gameObject;
            }
        }


        public static void SetActiveGameObject(GameObject gameObject)
        {
            if (gameObject != null)
            {
                UnityEditor.Selection.activeGameObject = gameObject;
            }
        }

        public virtual void NewUUID() {
             this.id = IDFactory.GetUUID();
        }
        public void AddTransformListener() {

            if (!listener) {
                TransformChange.onChange += OnTransformChange;
                listener = true;
            }

        }
        public void RemoveTransformListener()
        {
            if (listener) {
                TransformChange.onChange -= OnTransformChange;
                listener = false;
            }
        }
        protected virtual void OnTransformChange(Transform transform)
        {
            if (this.gameObject != null && this.gameObject.transform == transform) {

                this.OnChange(transform);
            }
        }
        protected virtual void OnChange(Transform transform) { 
        
        }



        public string name = "";

        public virtual string GetDefaultName()
        {
            return this.GetType().Name + this.id.Substring(0, 4);
        }
        [System.Xml.Serialization.XmlIgnore]
        public string Name
        {
            get
            {
                if (string.IsNullOrEmpty(name))
                {
                    name = this.GetDefaultName();
                }
                return name;
            }
            set
            {
                name = value;
                if (this.gameObject)
                {
                    this.gameObject.name = name;
                }
            }

        }
    }
}