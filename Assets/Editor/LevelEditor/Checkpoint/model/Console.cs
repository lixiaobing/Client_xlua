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
    public class Console : EObject,IExport
    {
        public int cid = 1;   //关联配置表
        public void OnDraw(CreateConsoles createConsoles) {
            EditorGUILayout.BeginVertical(LGUISkin.Style2);
            this.Name = Utils.TextField("名字", this.Name);
            Utils.TextField("UID", this.uid);
            int cid = Utils.IntField("CID", this.cid);
            if (cid != this.cid) {
                this.cid = cid;
                this.Destroy();
            }

            this.CreateObject();
            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("选中"))
            {
                this.Select();
            }
            if (Utils.Button("贴地"))
            {
                this.StickGround();
            }
            if (Utils.Button("删除"))
            {
                createConsoles.PreDel(this);
            }
            EditorGUILayout.EndHorizontal();
            position.DrawConsole(gameObject);
            EditorGUILayout.EndVertical();

        }
        public override void CreateObject() {
            base.CreateObject();
            if (this.gameObject == null) {
                GameObject parent = null;
                if (this.Parent != null) {
                    parent = this.Parent.GetGameObject();
                }
                else {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.CONSOLE_PARENT_NAME);
                }
                
                ModelInfo modelInfo = LuaUtils.GetConsole(this.cid);
                gameObject = Utils.CreateGameObject(modelInfo.path);
                gameObject.transform.SetParent(parent.transform);
                gameObject.name = "操作台" + this.uid.Substring(0, 8);  //this.DefaultName;//前8位ID
                gameObject.transform.position = position.position;
                gameObject.transform.localScale = position.scale;
                gameObject.transform.eulerAngles = position.rotation;

                CharacterController characterController = gameObject.AddComponent<CharacterController>();
                characterController.center = new Vector3(0, 0.86f, 0);
                characterController.height = 1.58f;
                characterController.radius = 0.5f;


            }
        }


        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.K(nameof(position), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(position.ToLuaString(indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }

 

        protected override void OnChange(Transform transform)
        {
            if (this.gameObject && this.gameObject.transform == transform)
            {
                this.position.position = transform.position;
                this.position.rotation = transform.eulerAngles;
                this.position.scale = transform.localScale;
            }
        }
    }
}