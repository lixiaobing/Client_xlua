using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{
    [EnumDescription("传送角色")]
    public class SetPosition: ExecuteNode
    {
        public string uid = "";          //怪物ID
        //角色位置
        public ETransform position = new ETransform();

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(position), position, indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.CreateObject();
            uid = Utils.TextField("UID", uid);
            position.DrawPosition(this.gameObject);

            OnUpdate(Time.deltaTime);
        }

        public override void OnUpdate(float deltaTime)
        {
            if (gameObject != null)
            {
                if (gameObject != null)
                {
                    Animator animator = gameObject.GetComponent<Animator>();
                    animator.Update(deltaTime);
                }
            }
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
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.POSITION_PARENT_NAME);
                }




                gameObject = Utils.CreateGameObject(ObjectLevelInfo.BORN_PREFAB_NAME);
                gameObject.transform.SetParent(parent.transform);
                Animator animator = gameObject.GetComponent<Animator>();
                animator.Play("Idle");
                animator.Update(10);
      /*          gameObject.transform.SetParent(parent.transform);*/
                gameObject.transform.position = position.position;
                gameObject.transform.eulerAngles = position.rotation;

                CharacterController characterController = gameObject.AddComponent<CharacterController>();
                characterController.center = new Vector3(0, 0.86f, 0);
                characterController.height = 1.58f;
                characterController.radius = 0.5f;

            }
            this.gameObject.name = "传送点_" + this.id;
        }
        protected override void OnChange(Transform transform)
        {
            this.position.position = transform.position;
            this.position.rotation = transform.eulerAngles;
        }
    }
}