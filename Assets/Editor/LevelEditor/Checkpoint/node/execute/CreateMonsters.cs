using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("刷怪组")]
    public class CreateMonsters : ExecuteNode
    {


        public ETransform position    = new ETransform();
        public List<Monster> monsters = new List<Monster>();
        private Monster preRemoveMonster;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST<Monster>(nameof(monsters), monsters, indent, newLine));
            return sb.ToString();
        }

        private Vector2 scrollPosition = new Vector2();
        public override void OnDraw() {
            base.OnDraw();
            CreateObject();
            this.Name = Utils.TextField("名字", this.Name);
            delayTime = Utils.FloatField("延迟", delayTime);
            position.DrawGroup(gameObject);

            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("新增怪物")) {
                this.Create();
            }
            if (Utils.Button("设置模板"))
            {
                this.Set();
            }
            EditorGUILayout.EndHorizontal();
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = 0; i < monsters.Count; i++)
            {
                Monster monster = monsters[i];
                monster.OnDraw(this);
            }
            EditorGUILayout.EndScrollView();
            Del(); //删除预删除的对象
            OnUpdate(Time.deltaTime); 

        }
        public override void OnUpdate(float deltaTime)
        {
            foreach (var monster in monsters)
            {
                monster.OnUpdate(deltaTime);
            }
        }


        public void OnBrushSet(BushInfo obj)
        {
            int count   = monsters.Count;
            bool fixDir = obj.fixDir;
            Utils.Log("OnBrushSet:::::::::::::::"+ obj.brushType+" 参数:"+ obj.parameter1);
            switch (obj.brushType) {
                case BrushType.Ring: //环形
                    {
                        float r = obj.parameter1;
                        float angle = 360 / count;
                        for (int i = 0; i < count; i++)
                        {
                            Monster monster = monsters[i];
                            float radian = angle * i * 3.14f / 180;

                            Utils.Log("angle:" + (angle * i) + "  " + radian + " " + (r * Mathf.Cos(radian)) + "  " + (Mathf.Sin(radian)));
                            monster.SetLocalPositon(new Vector3(r * Mathf.Cos(radian), 0, r * Mathf.Sin(radian)));
                            if (fixDir)
                            {
                                monster.SetLocalEulerAngles(Vector3.zero);
                            }
                        }
                    }

                    break;
                case BrushType.Line: //线形
                    {
                        float spacing = obj.parameter1;
                        float length = spacing * (count - 1);
                        float startX = -length / 2;
                        for (int i = 0; i < count; i++)
                        {
                            Monster monster = monsters[i];
           /*                 Utils.Log("startX:" + (startX + spacing * i));*/
                            monster.SetLocalPositon(new Vector3(startX + spacing * i, 0, 0));
                            if (fixDir)
                            {
                                monster.SetLocalEulerAngles(Vector3.zero);
                            }
                        }
                    }
                    break;
                case BrushType.Arc:  //弧形
                    {
                        float r = obj.parameter1;
                        float angle = obj.parameter2;
                        Monster monster = monsters[0];
                        monster.SetLocalPositon(Vector3.zero);
                        for (int i = 0; i < count-1; i++)
                        {
                            monster = monsters[i+1];
                            float radian = (90　+　angle * i)  * 3.14f / 180;
                            Utils.Log("angle:" + (angle * i) + "  " + radian + " " + (r * Mathf.Cos(radian)) + "  " + (Mathf.Sin(radian)));
                            monster.SetLocalPositon(new Vector3(r * Mathf.Cos(radian), 0, r * Mathf.Sin(radian)));
                            if (fixDir)
                            {
                                monster.SetLocalEulerAngles(Vector3.zero);
                            }
                        }

                    }
                    break;
            }
        }

        public void Set() {

            SetBrushTypeWindow.OpenWindow(this.OnBrushSet);
        }
        public void Create() {
            Monster monster = new Monster();
            monster.Name = monster.GetDefaultName();
            monster.Parent = this;
            monster.groupId = this.id;
            monster.CreateObject();
            monsters.Add(monster);
        }
        public void Copy(Monster monster) {
            Monster newMonster = monster.Clone();
            newMonster.groupId = this.id;
            newMonster.CreateObject();
            this.monsters.Add(newMonster);
        }
        public void PreDel(Monster monster)
        {
            preRemoveMonster = monster;

        }
        public void Del() {
            if (this.preRemoveMonster != null) {
                monsters.Remove(this.preRemoveMonster);
                this.preRemoveMonster.Destroy();
                this.preRemoveMonster = null;
            }
        }

        public override void CreateObject()
        {
            base.CreateObject();
            if (gameObject == null) {
                GameObject parent ;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.BRUSH_PARENT_NAME);
                }
                gameObject = new GameObject(this.Name);              //ObjectLevelInfo.FindParent("分组_" + this.id);
                gameObject.transform.SetParent(parent.transform);
            }
            //
            foreach (var monster in monsters)
            {
                monster.Parent = this;
                monster.CreateObject();
            }

        }


        public override void NewUUID()
        {
            base.NewUUID();
            foreach (var monster in monsters)
            {
                monster.NewUUID();
                monster.groupId = this.id;
            }
        }

        protected override void OnChange(Transform transform) {
            transform = this.gameObject.transform;
            Vector3 offset = transform.position - this.position.position;
            this.position.position = transform.position;
            this.position.scale = Vector3.zero;
            this.position.rotation = Vector3.one;
            foreach (var item in monsters)
            {
               item.position.position += offset;
            }

        }
    }
}