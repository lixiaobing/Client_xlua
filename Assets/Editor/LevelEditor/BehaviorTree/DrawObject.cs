﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Runtime.Serialization;

namespace hjcd.level.BehaviorTree
{
    [Serializable]
    public class DrawObject : ScriptableObject
    {
        public string uuid = IDFactory.GetUUID(); //唯一标识
        public virtual string Type { get { return this.GetType().Name; } }
        public virtual string Description { get{return Utils.GetDescription(this.GetType()); } }
        public virtual void OnDraw(Vector2 offset) {

        }
        public virtual void OnDrawIcon(float scale)
        {
            GUILayout.Box(LGUISkin.GetStyle("Abort").normal.background, LGUISkin.GetStyle("Icon"), GUILayout.Width(60 * scale), GUILayout.Height(35 * scale));
        }
        public virtual void OnInspectorDraw()
        {

        }
        public virtual void OnInspector()
        {

        }
        public void SetFocus()
        {
            if (CanFocus()) {
                BehaviorTree.Instance.SetFocus(this);
            }
        }
        public virtual bool Focused()
        {
            DrawObject drawObject = BehaviorTree.Instance.Focus();
            return drawObject == this;
        }
        public virtual bool TryFocus(Vector2 position) {
            return false;
        }
        public virtual void RemoveSelf(bool containChild = false)
        {
            
        }

        public virtual bool CanFocus()
        {
            return true;
        }

        public virtual string ToLuaString(int indent, bool newLine)
        {
            throw new NotImplementedException();
        }

        public string getSimpleUUID() {
            return "[" + this.uuid.Substring(0, 5) + "]";
        }
    }
}