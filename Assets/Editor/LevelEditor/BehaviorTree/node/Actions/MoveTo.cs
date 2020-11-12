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
        public List<Vector3Ex> positions = new List<Vector3Ex>();
        //移动速度
        public float speed    = 4;
        //最大移动时间
        public int loopTimes=-1;
        //移动类型
        public MoveType moveType = MoveType.WALK;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(ExportUtils.KV_LIST<Vector3Ex>(nameof(positions), positions, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(moveType), moveType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(speed), speed, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(loopTimes), loopTimes, indent, newLine));

            return sb.ToString();
        }

        public override void OnInspector()
        {
            moveType = Utils.EnumPopup<MoveType>("移动方式", moveType);
            speed = Utils.UFloatField("移动速率",speed);
            loopTimes = Utils.IntField("循环次数(-1无限循环)", loopTimes);

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("位置");
            if (Utils.Button("添加", GUILayout.MaxWidth(100))) {
                positions.Add(new Vector3Ex());
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginVertical(GUI.skin.box);
            bool remove = false;
            Vector3Ex removeVector = null;
            foreach (var position in positions)
            {
                EditorGUILayout.BeginHorizontal();
                position.position = EditorGUILayout.Vector3Field("", position.position);
                if(Utils.Button("删除",GUILayout.MaxWidth(100))) {
                    removeVector = position;
                    remove = true;
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
            if (remove) {
                positions.Remove(removeVector);
            }
        }
    }
}