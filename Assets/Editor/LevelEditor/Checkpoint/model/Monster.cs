using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{

    [Serializable]
    public class Monster : EObject,IExport
    {
        public string groupId; //编辑分组 父节点ID

        //public new string uid = Utils.GenerateMonsterID().ToString();
        public long cid; //怪物ID
        public int group; //分组ID
        public int tag; //唯一标识
        public float delayTime = 200;//延迟创建的时间
        public string mask;
        public int level =0; //怪物等级

        public override void NewUUID() {
            uid = IDFactory.GenerateMonsterID().ToString();
        }
        public Monster Clone() {
            Monster monster = new Monster();
            monster.groupId = this.groupId;
            monster.cid = this.cid;
            monster.group = this.group;
            monster.tag = this.tag;
            monster.delayTime = this.delayTime;
            monster.level = this.level;
            monster.position = this.position.Clone();
            monster.Parent = this.Parent;
            return monster;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent += 1;
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(level), level, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(group), group, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(tag), tag, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(mask), mask, indent, newLine));
            sb.Append(ExportUtils.K(nameof(position), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(position.ToLuaString(indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }

        public void SetLocalPositon (Vector3 position){
            position.y = gameObject.transform.localPosition.y;
            gameObject.transform.localPosition = position;
            this.position.position = gameObject.transform.position;
        }
        public void SetLocalEulerAngles(Vector3 position)
        {
            position.x = 0;
            position.z = 0;
            gameObject.transform.localEulerAngles = position;
            this.position.rotation = gameObject.transform.eulerAngles;
        }

        private bool flag = true;
        //返回是否被删除
        public void OnDraw(CreateMonsters host)
        {
           EditorGUILayout.BeginVertical(LGUISkin.Style2);
       /*     EditorGUILayout.BeginVertical(GUI.skin.box);*/
            flag =  EditorGUILayout.InspectorTitlebar(flag, gameObject);
            if (flag) { 
            
            
          
            EditorGUILayout.BeginHorizontal();

            if (Utils.Button("选中"))
            {
                this.Select();
            }

            if (Utils.Button("贴地"))
            {
                this.StickGround();
                this.Select();
            }

            if (Utils.Button("复制"))
            {
                host.Copy(this);
            }
            if (Utils.Button("删除"))
            {
                host.PreDel(this);
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.TextField("怪物UID", this.uid);
            this.Name = EditorGUILayout.TextField("名称", this.Name);
             EditorGUILayout.BeginVertical();
            DrawMonsterList();

            //this.level = EditorGUILayout.IntField("怪物等级", this.level);
            this.level = (int)EditorGUILayout.Slider("指定等级", this.level,0,999);

            this.delayTime = EditorGUILayout.FloatField("延迟时间(毫秒)", this.delayTime);
/*            this.tag = EditorGUILayout.IntField("标签", this.tag);*/
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical();
            this.tag = EditorGUILayout.IntField("标签", this.tag);
            this.group = EditorGUILayout.IntField("分组", this.group);
            EditorGUILayout.EndVertical();


          //EditorGUILayout.EndHorizontal();
            mask = EditorGUILayout.TextField("备注", mask);


            CreateObject();

            position.DrawMonster(gameObject);

            }

            EditorGUILayout.EndVertical();

/*            OnUpdate(Time.deltaTime);*/
        }
        private void DrawMonsterList() {

            Hashtable monsters = LuaUtils.GetMonsters();
            string[] options = new string[monsters.Keys.Count];
            int[] values = new int[monsters.Keys.Count];
            int index = 0;



            foreach (var key in monsters.Keys)
            {
                values[index] = int.Parse(key.ToString());
                index++;
            }

            Array.Sort(values, (int a, int b) => {  return a.CompareTo(b); });

            for (int i = 0; i < values.Length; i++)
            {
                options[i] =  monsters[values[i].ToString()].ToString();
            }

            //默认一个怪
            if (cid == 0)
            {
                cid = values[0];
            }
            int _cid = EditorGUILayout.IntPopup("怪物CID", (int)cid, options, values);
            //long _cid = EditorGUILayout.LongField("怪物CID", this.cid);
            if (this.cid != _cid)
            {
                this.cid = _cid;
                this.Destroy();
            }
            //Utils.Log("cid:" + cid);
        }
        public override void CreateObject() {
            base.CreateObject();
              if (gameObject == null)
              {
                 //string name , path;
                 if(!LuaUtils.GetMonster((int)this.cid, out string  name, out string  path)){

                    name = this.uid.ToString();
                    path = ObjectLevelInfo.BORN_PREFAB_NAME;
                 }

                GameObject parent;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.BRUSH_PARENT_NAME);
                }
                  gameObject = Utils.CreateGameObject(path);
                  Animator animator = gameObject.GetComponent<Animator>();
                  animator.Play("Idle");
                  animator.Update(10);
                  gameObject.transform.SetParent(parent.transform);
                  gameObject.name = this.Name;
                  gameObject.transform.position = position.position;
                  gameObject.transform.localScale = position.scale;
                  gameObject.transform.eulerAngles = position.rotation;

                  CharacterController characterController = gameObject.AddComponent<CharacterController>();
                  characterController.center = new Vector3(0, 0.86f, 0);
                  characterController.height = 1.58f;
                  characterController.radius = 0.5f;


              }
        }
        protected override void OnChange(Transform transform)
        {
            this.position.position = transform.position;
            this.position.scale    = transform.localScale;
            this.position.rotation = transform.eulerAngles;
        }
    }
   
}