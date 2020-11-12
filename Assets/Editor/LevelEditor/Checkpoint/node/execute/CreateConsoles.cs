using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建操作台")]
    public class CreateConsoles : ExecuteNode
    {

        public List<Console> consoles = new List<Console>();
        private Console preRemove;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST<Console>(nameof(consoles), consoles, indent, newLine));
            return sb.ToString();
        }

        private Vector2 scrollPosition = new Vector2();
        public override void OnDraw() {
            base.OnDraw();
            CreateObject();
            delayTime = Utils.FloatField("延迟", delayTime);
    
            if (Utils.Button("新增操作台")) {
                this.Create();
            }


            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = 0; i < consoles.Count; i++)
            {
                Console console = consoles[i];
                console.OnDraw(this);
            }
            EditorGUILayout.EndScrollView();
            Del(); //删除预删除的对象
            OnUpdate(Time.deltaTime); 

        }
        public override void OnUpdate(float deltaTime)
        {
            //Debug.LogError("CreateConsoles onupdate");
            for (int i = 0; i < consoles.Count; i++)
            {
                Console console = consoles[i];
                console.OnUpdate(Time.deltaTime);
            }

        }



    
        public void Create() {
            Console console = new Console();
            console.Name = console.GetDefaultName(); // "操作台" + console.uid.Substring(0, 8);
            console.Parent = this.Parent;
            console.CreateObject();
            consoles.Add(console);
        }
        public void Copy(Console monster) {
/*            Monster newMonster = monster.Clone();
            newMonster.groupId = this.id;
            newMonster.CreateObject();
            this.monsters.Add(newMonster);*/
        }
        public void PreDel(Console console)
        {
            preRemove = console;

        }
        public void Del() {
            if (this.preRemove != null) {
                consoles.Remove(this.preRemove);
                this.preRemove.Destroy();
                this.preRemove = null;
            }
        }

        public override void CreateObject()
        {
            foreach (var console in consoles)
            {
                console.Parent = console.Parent;
                console.CreateObject();
            }

        }
        public override void Destroy()
        {
            base.Destroy();

            foreach (var console in consoles)
            {
                console.Destroy();
            }
        }


        public override void NewUUID()
        {
            base.NewUUID();
            foreach (var console in consoles)
            {
                console.NewUUID();
            }
        }
    }
}