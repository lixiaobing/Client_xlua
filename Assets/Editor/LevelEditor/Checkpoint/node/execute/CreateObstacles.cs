using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建障碍物")]
    public class CreateObstacles : ExecuteNode,IOperate
    {

        public List<Obstacle> props = new List<Obstacle>();
        private Obstacle preRemove;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST<Obstacle>(nameof(props), props, indent, newLine));
            return sb.ToString();
        }

        private Vector2 scrollPosition = new Vector2();
        public override void OnDraw() {
            base.OnDraw();
            CreateObject();
            delayTime = Utils.FloatField("延迟", delayTime);
    
            if (Utils.Button("新增障碍物")) {
                this.Create();
            }

            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = 0; i < props.Count; i++)
            {
                props[i].OnDraw(this);
            }
        

            EditorGUILayout.EndScrollView();
            Del(); //删除预删除的对象
            OnUpdate(Time.deltaTime); 

        }
        public override void OnUpdate(float deltaTime)
        {
            foreach (var porp in props)
            {
                porp.OnUpdate(Time.deltaTime);
            }
        }
        public void Create() {
            Obstacle prop = new Obstacle();
            prop.Parent = this;
            prop.CreateObject();
            props.Add(prop);
        }


        public void Del() {
            if (this.preRemove != null) {
                props.Remove(this.preRemove);
                this.preRemove.Destroy();
                this.preRemove = null;
            }
        }

        public override void CreateObject()
        {
            foreach (var prop in props)
            {
                prop.CreateObject();
            }

        }
        public override void Destroy()
        {
            base.Destroy();
            foreach (var porp in props)
            {
                porp.Destroy();
            }
        }

        void IOperate.Copy(object obj)
        {
            Obstacle p = (Obstacle)obj;
            props.Add(p.Clone());
        }

        void IOperate.PreDel(object obj)
        {
            preRemove = (Obstacle)obj;
        }

        public override void NewUUID()
        {
            base.NewUUID();
            foreach (var prop in props)
            {
                prop.NewUUID();
            }
        }
    }
}