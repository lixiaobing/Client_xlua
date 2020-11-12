#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
namespace hjcd.level
{
    public abstract class View 
    {
        public View() {
           
        }
        public abstract void OnDraw();
        public virtual void OnDestroy() {
        }
    }
}
#endif