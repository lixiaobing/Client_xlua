using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("顺序节点")]
    [Serializable]
    public class Sequence : Composites
    {
        public override void OnInspector()
        {
            EditorGUILayout.LabelField("选从左至右挨个执行的元件，如果遇到某个元件返回false，则跳回父节点");
            abortType = Utils.EnumPopup("打断类型",abortType);
        
        }
        public override Texture2D GetTexture2D()
        {
            return LGUISkin.Textures.textureSequence;
        }
    }
}