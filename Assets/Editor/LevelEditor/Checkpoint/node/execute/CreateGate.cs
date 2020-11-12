using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建门")]
    public class CreateGate : ExecuteNode
    {

        public ETransform gate   = ETransform.CreateGateData();
        private string modelPath = "Dungeon/Common/Obj_Gate/jz_men001";
        public int cid = 1;
        public bool active = true;

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(active), active, indent, newLine));
            sb.Append(ExportUtils.K(nameof(gate), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(gate.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.Comma);
            return sb.ToString();
        }

        public override void OnDraw()
        {
  
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            this.cid = Utils.UIntField("cid", cid);
            this.Name = Utils.TextField("名称", this.Name);
            this.active = Utils.Toggle("是否激活", this.active);

            bool ret = LuaUtils.GetGate(this.cid, out string name, out string path);
            if (ret) {
                if (!path.Equals(this.modelPath)) {
                    this.modelPath = path;
                    if (gameObject != null)
                    {
                        GameObject.DestroyImmediate(gameObject);
                        gameObject = null;
                    }
                }
            }

            CreateObject();
            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("贴地"))
            {
                ETransform.StickGround(this.gameObject);
            }
            if (Utils.Button("选中"))
            {
                DoFocus();
            }
            EditorGUILayout.EndHorizontal();
            gate.OnDraw(this.gameObject, null, false);


            gate.DrawGate(this.gameObject);
            this.OnUpdate(Time.deltaTime);
        }



        public override void OnUpdate(float deltaTime)
        {
            if (gameObject != null)
            {
                AnimationPlay player = gameObject.GetComponent<AnimationPlay>();
                if (player != null)
                {
                    player.Simulate();
                }
            }

        }

        public override void CreateObject()
        {
            this.AddTransformListener();
            if (this.gameObject == null)
            {
                GameObject parent = null;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.GATE_PARENT_NAME);
                }


                this.gameObject = Utils.CreateGameObject(this.modelPath);
                this.gameObject.transform.SetParent(parent.transform);
                this.gameObject.name = this.Name;
                this.gameObject.transform.position = gate.position;
                this.gameObject.transform.localScale = gate.scale;
                this.gameObject.transform.eulerAngles = gate.rotation;

                BoxCollider[] collider = this.gameObject.GetComponentsInChildren<BoxCollider>();
                if (collider.Length > 0)
                {
                    gate.size = collider[0].size;  //TODO 碰撞位置和 可能和原物体产生偏差
                }else {
                    Debug.LogError("CreateGate"+ this.modelPath + " not found BoxCollider!");

                }

                //主要方便用于贴地
                CharacterController characterController = this.gameObject.GetComponent<CharacterController>();
                if (characterController == null) {
                    characterController = this.gameObject.AddComponent<CharacterController>();
                    characterController.center = new Vector3(0, 0.86f, 0);
                    characterController.height = 1.58f;
                    characterController.radius = 0.5f;
                }
            }
        }


        public override void Destroy()
        {
            base.Destroy();
        }
        protected override void OnChange(Transform transform)
        {
            gate.position = this.gameObject.transform.position ;
            gate.scale    = this.gameObject.transform.localScale;
            gate.rotation = this.gameObject.transform.eulerAngles;
        }

    }

}