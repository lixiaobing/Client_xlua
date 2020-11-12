using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("返回FALSE")]
    [Serializable]
    public class ReturnFalse : Decorator 
    {

/*        public override void OnInspector()
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("固定返回FALSE");
            EditorGUILayout.EndHorizontal();
        }*/
    }
}