using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    //设置属性
    [EnumDescription("设置属性(百分比)")]
    [Serializable]
    public class SetAttr : Action
    {
        public SelectTarget2 selectTarget = new SelectTarget2();
        //百分比属性
        public AttrPercent attrPercent = AttrPercent.HP;

        //百分比
        public int percent;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(selectTarget.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.KV(nameof(attrPercent), attrPercent, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(percent), percent, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {

            selectTarget.OnDraw();
            attrPercent = Utils.EnumPopup<AttrPercent>("属性",attrPercent);
            percent = (int)EditorGUILayout.Slider("百分比",percent*1f,0f,100f);
            //percent = Utils.IntField("百分比",percent);

        }
    }
}