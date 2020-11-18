using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("指定位置移动")]
    [Serializable]
    public class MoveTo : Action
    {
        public List<Vector3> positions = new List<Vector3>();
        //移动速度
        public float speed    = 4;
        //最大移动时间
        public int loopTimes =-1;
        //移动类型
        public MoveType moveType = MoveType.WALK;

        public override void OnInspector()
        {
            moveType = Utils.EnumPopup<MoveType>("移动方式", moveType);
            speed = Utils.UFloatField("移动速率",speed);
            loopTimes = Utils.IntField("循环次数(-1无限循环)", loopTimes);

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("位置");
            if (Utils.Button("添加", GUILayout.MaxWidth(100))) {
                positions.Add(new Vector3());
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginVertical(GUI.skin.box);
            for (int i = positions.Count-1; i > -1; i--)
            {
                Vector3 position = positions[i];
                EditorGUILayout.BeginHorizontal();
                Vector3 pos = EditorGUILayout.Vector3Field("", position);
                position.Set(pos.x, pos.y, pos.z);
                if (Utils.Button("删除",GUILayout.MaxWidth(100))) {
                    positions.RemoveAt(i);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();

        }
    }
}