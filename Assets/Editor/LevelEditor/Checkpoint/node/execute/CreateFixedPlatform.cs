using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建固定平台")]
    public class CreateFixedPlatform : ExecuteNode
    {
        public class CreateFixedPlatformPlatform_Platform : EObject ,IExport
        {
            public int    cid = 1;
            //删除类型
            public PlatformDeleteType deleteType = PlatformDeleteType.None;
            //删除时间
            public float deleteTime;
            //恢复时间
            public float recoveryTime;

            protected override void OnChange(Transform transform)
            {
                this.position.position = transform.position;
                this.position.rotation = transform.eulerAngles;
                this.position.scale = transform.localScale;
            }
            public string ToLuaString(int indent, bool newLine)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
                indent += 1;
                sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
                sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
                sb.Append(ExportUtils.KV(nameof(recoveryTime), this.recoveryTime, indent, newLine));
                sb.Append(ExportUtils.KV(nameof(deleteType), this.deleteType, indent, newLine));
                indent = indent - 1;
                sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
                return sb.ToString();
            }



            public void DrawPlatformList()
            {

                Hashtable paltforms = LuaUtils.GetPlatforms();
                string[] options = new string[paltforms.Keys.Count];
                int[] values = new int[paltforms.Keys.Count];
                int index = 0;



                foreach (var key in paltforms.Keys)
                {
                    values[index] = int.Parse(key.ToString());
                    index++;
                }

                Array.Sort(values, (int a, int b) => { return a.CompareTo(b); });

                for (int i = 0; i < values.Length; i++)
                {
                    options[i] = paltforms[values[i].ToString()].ToString();
                }

                //默认一个怪
                if (cid == 0)
                {
                    cid = values[0];
                }
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("平台CID");
                int _cid = EditorGUILayout.IntPopup("", (int)cid, options, values);
                EditorGUILayout.EndHorizontal();
                //long _cid = EditorGUILayout.LongField("怪物CID", this.cid);
                if (this.cid != _cid)
                {
                    this.cid = _cid;
                    this.Destroy();
                }
                //Utils.Log("cid:" + cid);
            }



            public override void CreateObject()
            {
                base.CreateObject();
                if (gameObject == null)
                {
                    string path = LuaUtils.GetPlatform((int)this.cid);
                    if(path == null)
                    {

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
                        parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.PLATFORM_PARENT_NAME);
                    }
                    gameObject = Utils.CreateGameObject(path);
/*                    Animator animator = gameObject.GetComponent<Animator>();
                    animator.Play("Idle");
                    animator.Update(10);*/
                    gameObject.transform.SetParent(parent.transform);
                    gameObject.name = this.Name;
                    gameObject.transform.position = position.position;
                    gameObject.transform.localScale = position.scale;
                    gameObject.transform.eulerAngles = position.rotation;
/*
                    CharacterController characterController = gameObject.AddComponent<CharacterController>();
                    characterController.center = new Vector3(0, 0.86f, 0);
                    characterController.height = 1.58f;
                    characterController.radius = 0.5f;*/


                }
            }
        }

        public List<CreateFixedPlatformPlatform_Platform> childs = new List<CreateFixedPlatformPlatform_Platform>();
        public override void NewUUID()
        {
            base.NewUUID();
        }
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST(nameof(childs), childs, indent, newLine));
            return sb.ToString();
        }



        Vector2 scrollPosition;
        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            if (Utils.Button("新增平台"))
            {
                this.AddPlatform();
            }
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = childs.Count - 1; i > -1; i--)
            {
                var p = childs[i];
                GUILayout.BeginVertical(Utils.Style2);
                Utils.TextField("UID", p.uid);
                //p.cid = Utils.IntField("CID", p.cid);


                p.DrawPlatformList();

                p.CreateObject();

                p.deleteTime = Utils.UFloatField("删除时间", p.deleteTime);
                p.recoveryTime = Utils.UFloatField("恢复时间", p.recoveryTime);
                p.deleteType = Utils.EnumPopup("删除类型",p.deleteType);
                p.position.DrawPlatform(p.gameObject);

                if (Utils.Button("删除"))
                {
                    childs.RemoveAt(i);
                }
                GUILayout.EndVertical();
            }
            EditorGUILayout.EndScrollView();
        }
        public void AddPlatform()
        {
            CreateFixedPlatformPlatform_Platform p = new CreateFixedPlatformPlatform_Platform();
            p.Name = p.GetDefaultName();//"特效" + effect.uid.Substring(0, 8);
            p.Parent = this.Parent;
            p.CreateObject();
            Node.SetActiveGameObject(p.gameObject);
            childs.Add(p);
        }
        public override void CreateObject()
        {
            base.CreateObject();
            foreach (var p in childs)
            {
                p.Parent = this.Parent;
                p.CreateObject();
            }

        }
    }
}         