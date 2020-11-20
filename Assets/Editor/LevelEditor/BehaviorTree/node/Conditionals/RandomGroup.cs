using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("随机组节点")]
    [Serializable]
    public class RandomGroup : Conditional
    {
        public List<float> probabilitys = new List<float>();

        public override void OnInspector()
        {
            if (probabilitys.Count < 1) {
                probabilitys.Add(50);
            }
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("概率组");
            if (Utils.Button("新增")) {
                probabilitys.Add(50);
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginVertical(GUI.skin.box,GUILayout.MinHeight(50));
            if (probabilitys.Count == 0) {
                EditorGUILayout.Space();
            }
            int removeIndex = -1;
            //權重
            for (int i = 0; i < probabilitys.Count; i++)
            {
                EditorGUILayout.BeginHorizontal();
                probabilitys[i] = EditorGUILayout.IntSlider("Index" + i, (int)probabilitys[i], 0, 100);
                if (probabilitys.Count > 1)
                {
                    if(Utils.Button("删除"))
                    {
                        removeIndex = i;
                    }
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
            if (removeIndex > -1) {
                probabilitys.RemoveAt(removeIndex);
            }
        }
    }
}