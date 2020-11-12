using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("返回值取反")]
    [Serializable]
    public class ReturnInverse : Decorator 
    {
/*        public override void OnInspector()
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("子节点返回值取反");
            EditorGUILayout.EndHorizontal();
        }*/
    }
}