using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("随机节点")]
    [Serializable]
    public class Random : Composites
    {


        public override void OnInspector()
        {
            EditorGUILayout.LabelField("权重");
            EditorGUILayout.BeginVertical(GUI.skin.box,GUILayout.MinHeight(50));
            if (links.Count == 0) {
                EditorGUILayout.Space();
            }
            //權重
            foreach(Link link in links)
            { 
                link.weight = Utils.FloatField(link.child.Substring(0, 5),link.weight); 
            }
            EditorGUILayout.EndVertical();
        }

        public override Texture2D GetTexture2D()
        {
            return LGUISkin.Textures.textureRandom;
        }
    }
}