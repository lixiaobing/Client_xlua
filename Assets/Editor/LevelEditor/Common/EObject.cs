

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System;

namespace hjcd.level.CheckPoint
{

    [Serializable]
    public  class EObject : BaseObject
    {
        public string uid = IDFactory.GetUUID();
        public ETransform position = new ETransform();



        [System.Xml.Serialization.XmlIgnore]
        private bool bListener = false;

        [System.Xml.Serialization.XmlIgnore]
        public bool foldOut = true;

        [System.Xml.Serialization.XmlIgnore]
        private bool edit = false;
        [System.Xml.Serialization.XmlIgnore]
        public bool Edit
        {
            get { return edit; }
            set { edit = value; }
        }




        public virtual void NewUUID()
        {
            this.uid = IDFactory.GetUUID();
        }
        public string name = "";

        public virtual string GetDefaultName()
        {
            return this.GetType().Name + this.uid.Substring(0, 4);
        }
        [System.Xml.Serialization.XmlIgnore]
        public string Name {
            get
            {
                if (string.IsNullOrEmpty(name)) {
                    name = this.GetDefaultName();
                }
                return name;
            }
            set 
            {
                name = value;
                if (this.gameObject) {
                    this.gameObject.name = name;
                }
            }

        }

        public void Select()
        {

            if (gameObject != null)
            {
                Selection.activeGameObject = gameObject;
            }
        }
        public void StickGround(GameObject gameObject = null)
        {
            ETransform.StickGround((gameObject != null) ? gameObject : this.gameObject); 
        }

        public virtual void OnUpdate(float deltaTime)
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



        public virtual void CreateObject() {

            this.AddTransformListener();
        }
        public virtual void Destroy()
        {
            if (gameObject != null)
            {
                GameObject.DestroyImmediate(gameObject);
                gameObject = null;
            }
            this.RemoveTransformListener();
        }


        protected void AddTransformListener()
        {

            if (!bListener)
            {
                TransformChange.onChange += OnTransformChange;
                bListener = true;
            }

        }
        protected void RemoveTransformListener()
        {
            if (bListener)
            {
                TransformChange.onChange -= OnTransformChange;
                bListener = false;
            }
        }
        protected virtual void OnChange(Transform transform) { 
        
        }
        public virtual void OnTransformChange(Transform transform)
        {
            if (this.gameObject && this.gameObject.transform == transform)
            {
                this.OnChange(transform);
            }
        }
        public void PushChange()
        {
            if (this.gameObject) {
                OnChange(this.gameObject.transform);
            }
        }
    }
}
