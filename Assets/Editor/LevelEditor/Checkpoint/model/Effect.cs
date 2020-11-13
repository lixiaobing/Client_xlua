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
    public class Effect : EObject ,IExport
    {
     
        public string effectPath = "Effect/Common/MonsterBorn";
        public float durationTime  = -1;//持续时间(毫秒)

        public Effect Clone() {
            Effect effect = new Effect();
            effect.effectPath = this.effectPath;
            effect.durationTime = this.durationTime;
            effect.position = this.position.Clone();
            return effect;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent += 1;
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV("name",this.Name, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(durationTime), durationTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(effectPath), effectPath, indent, newLine));
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
        }
        public void SetLocalEulerAngles(Vector3 position)
        {
            position.x = 0;
            position.z = 0;
            gameObject.transform.localEulerAngles = position;
        }

        private bool flag = true;
        //返回是否被删除
        public void OnDraw(CreateEffect host)
        {
            EditorGUILayout.BeginVertical(LGUISkin.Style2);
            CreateObject();
            flag = EditorGUILayout.InspectorTitlebar(flag, gameObject);
            if (flag)
            {

                EditorGUILayout.BeginHorizontal();
                if (Utils.Button("文件"))
                {
                    string file_path = EditorUtility.OpenFilePanel("选择文件", Utils.ResourcesPath + "Effect", "asset");
                    if (file_path == null || file_path.Equals(""))
                    {
                        Utils.Log("未选择文件");
                    }
                    else
                    {
                        file_path = file_path.Replace(Utils.ResourcesPath, "").Replace(".asset", "");
                        CreateObject(file_path);
                    }
                }
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
                this.durationTime = Utils.FloatField("持续时间(毫秒)", this.durationTime);
                this.Name = Utils.TextField("名称", this.Name);
                Utils.TextField("UID", this.uid);
                Utils.LabelField("特效文件", this.effectPath);
                position.DrawEffect(gameObject);
            }
            EditorGUILayout.EndVertical();

            OnUpdate(Time.deltaTime);

  
        }
        public override void CreateObject()
        {
            base.CreateObject();
            this.CreateObject(this.effectPath);
        }
        public void CreateObject(string pfefabPath) {
            if (!this.effectPath.Equals(pfefabPath)) {
                if (gameObject != null) {
                    GameObject.DestroyImmediate(gameObject);
                    gameObject = null;
                }
                this.effectPath = pfefabPath;
            }

            if (gameObject == null)
            {
                GameObject parent = null;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.EFFECT_PARENT_NAME);
                }


                gameObject = Utils.CreateEffect(this.effectPath);
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

        protected override void OnChange(Transform transform) {
            this.position.position = transform.position;
            this.position.rotation = transform.eulerAngles;
            this.position.scale    = transform.localScale;
        }

    }
   
}