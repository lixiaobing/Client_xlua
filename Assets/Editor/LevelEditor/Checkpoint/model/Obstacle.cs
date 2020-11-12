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
    public class Obstacle :EObject, IExport
    {


        public int cid = 1;
        public ETransform transform = new ETransform(); //位置信息
 

        public Obstacle Clone() {
            Obstacle p = new Obstacle();
            p.uid = Utils.GetUUID();
            p.cid = this.cid;
            p.transform = this.transform.Clone();
            return p;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent +=  1;
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.K(nameof(transform), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(transform.ToLuaString(indent, newLine));
            indent -=  1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
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

            transform.DrawObstacle(gameObject);

            }

            EditorGUILayout.EndVertical();

        }

        public override void OnUpdate(float deltaTime) {
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
        public override void CreateObject() {

            base.CreateObject();
            if (gameObject == null)
            {
                GameObject parent = null;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.PROP_PARENT_NAME);
                }



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
                gameObject.name = this.Name;
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


       


        protected override void OnChange(Transform transform)
        {
            if (this.gameObject && this.gameObject.transform == transform)
            {
                this.transform.position = transform.position;
                this.transform.rotation = transform.eulerAngles;
                this.transform.scale = transform.localScale;
            }
        }
    }
   
}