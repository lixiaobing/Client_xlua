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
    public class Born : EObject, IExport
    {
  
        public ETransform transform = new ETransform(); //位置信息 tfData

        public Born Clone() {
            Born p = new Born();
            p.uid = IDFactory.GetUUID();
            p.transform = this.transform.Clone();
            return p;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.K(nameof(transform), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(transform.ToLuaString(indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
        private bool flag = true;
        //返回是否被删除
        public void OnDraw(IOperate host)
        {
            //EditorGUILayout.BeginVertical(GUI.skin.box);
            EditorGUILayout.BeginVertical(LGUISkin.Style2);
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
            this.Name = EditorGUILayout.TextField("名称", this.Name);
            CreateObject();

            transform.DrawBorn(gameObject);

            }

            EditorGUILayout.EndVertical();

        }

        public void ReCreateObject()
        {
            gameObject = null;
            CreateObject();
        }
        public override void CreateObject() {
            base.CreateObject();
            if (gameObject == null)
            {
                GameObject parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.BORN_PARENT_NAME);
                gameObject = Utils.CreateGameObject(ObjectLevelInfo.BORN_PREFAB_NAME);
                Animator animator = gameObject.GetComponent<Animator>();
                animator.Play("Idle");
                animator.Update(10);
     

                gameObject.transform.SetParent(parent.transform);
                gameObject.name = this.Name;
                gameObject.transform.position = transform.position;
                gameObject.transform.localScale = Vector3.one;
                gameObject.transform.eulerAngles = transform.rotation;

                CharacterController characterController = gameObject.AddComponent<CharacterController>();
                characterController.center = new Vector3(0, 0.86f, 0);
                characterController.height = 1.58f;
                characterController.radius = 0.5f;
            }
        }

        protected override void OnChange(Transform _transform) {
            if (this.gameObject != null) {
                if (this.gameObject.transform == _transform)
                {
                    transform.position = _transform.position;
                    transform.rotation = _transform.eulerAngles;
                }
            }
        }

     
    }
   
}