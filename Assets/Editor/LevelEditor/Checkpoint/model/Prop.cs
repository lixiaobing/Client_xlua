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
    public class Prop : IExport
    {


        public string uid = IDFactory.GetUUID();
        public int cid = 1;
        public ObjectData transform = new ObjectData(); //位置信息
        private GameObject gameObject;

        public void NewUUID() {
            uid = IDFactory.GetUUID();
        }
        public Prop Clone() {
            Prop p = new Prop();
            p.uid = IDFactory.GetUUID();
            p.cid = this.cid;
            p.transform = this.transform.Clone();
            return p;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.K(nameof(transform), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(transform.ToLuaString(indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }

        public void StickGround() {
            ObjectData.StickGround(gameObject);
        }
        private bool flag = true;
        //返回是否被删除
        public void OnDraw(IOperate host)
        {
            //EditorGUILayout.BeginVertical(GUI.skin.box);
            EditorGUILayout.BeginVertical();
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



            EditorGUILayout.TextField("UID", this.uid);
            int cid = EditorGUILayout.IntField("CID", this.cid);

            if (this.cid != cid)
            {
                this.cid = cid;
                this.ReCreateObject();
            }
            else {

                CreateObject();
            }

            transform.OnDraw(gameObject,null,false);

            }

            EditorGUILayout.EndVertical();

        }
        public void Select() {

            if (gameObject != null)
            {
                Selection.activeGameObject = gameObject;
            }
        }
        public void Destroy() {
            if (gameObject != null) {
                GameObject.DestroyImmediate(gameObject);
                gameObject = null;
            }
        }

        public void OnUpdate(float deltaTime) {
            if (gameObject != null)
            {
                AnimationPlay player = gameObject.GetComponent<AnimationPlay>();
                if (player != null)
                {
                    player.Simulate();
                }
            }
        }
        public void ReCreateObject()
        {
            this.Destroy();
            CreateObject();
        }
        public void CreateObject() {

            if (gameObject == null)
            {
                GameObject parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.PROP_PARENT_NAME);
                ModelInfo modelInfo = LuaUtils.GetObstacle(this.cid);
                gameObject = Utils.CreateGameObject(modelInfo.path);
                /*                Animator animator = gameObject.GetComponent<Animator>();
                                if (animator != null) {
                                    animator.Play("Close_Idle");
                                    animator.Update(10);
                                }*/

                /*                EffectControll effectControll = gameObject.GetComponent<EffectControll>();
                                if (effectControll != null)
                                {
                                    GameObject.DestroyImmediate(effectControll);
                                }
                                gameObject.AddComponent<AnimationPlayer>();*/

                //transform.scale = Vector3.one; //new Vector3(modelInfo.scale, modelInfo.scale, modelInfo.scale);
                gameObject.transform.SetParent(parent.transform);
                gameObject.name = "obstacle_" + this.uid.Substring(0, 8);//前8位ID
                gameObject.transform.position = transform.position;
                gameObject.transform.localScale = transform.scale;
                gameObject.transform.eulerAngles = transform.rotation;

                //添加角色控制器便于贴地
                CharacterController characterController = gameObject.AddComponent<CharacterController>();
                characterController.center = new Vector3(0, 0.86f, 0);
                characterController.height = 1.58f;
                characterController.radius = 0.5f;


            }
        }
    }
   
}