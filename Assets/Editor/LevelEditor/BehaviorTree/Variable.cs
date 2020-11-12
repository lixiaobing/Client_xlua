using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    [Serializable]
    public class Variable :IExport//: ScriptableObject
    {
        //是否是共享变量
        public bool share = false;
        //变量名
        public string name;
        //变量值
        public float value;

        public VariableChangeType changgeType = VariableChangeType.None;
        //变化间隔
        public float interval = 1f;
        //变化值
        public float changeValue = 0f;
        public float minValue = 0f;
        public float maxValue = 1f;
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder content = new StringBuilder();
            content.Append(ExportUtils.F_CurlyBracesLeft(indent,newLine));
            indent = indent + 1;
            content.Append(ExportUtils.KV(nameof(name),name, indent, true));
            content.Append(ExportUtils.KV(nameof(share), share, indent, true));
            content.Append(ExportUtils.KV(nameof(value), value, indent, true));
            content.Append(ExportUtils.KV(nameof(minValue), minValue, indent, true));
            content.Append(ExportUtils.KV(nameof(maxValue), maxValue, indent, true));
            content.Append(ExportUtils.KV(nameof(changgeType), changgeType, indent, true));
            content.Append(ExportUtils.KV(nameof(interval), interval, indent, true));
            content.Append(ExportUtils.KV(nameof(changeValue), changeValue, indent, true));
            indent = indent - 1;
            content.Append(ExportUtils.CurlyBracesRight);
            return content.ToString();
        }

        public void OnDraw()
        {
            share = Utils.Toggle("共享", share);
            name = Utils.TextField("变量名", name);
            value = Utils.FloatField("变量值", value);
        }
        public void OnDraw1(string text) {

            EditorGUILayout.BeginVertical(Utils.Style2);
            if (text != null) {
/*                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.Separator();*/
                EditorGUILayout.LabelField(text);
/*                EditorGUILayout.Separator();
                EditorGUILayout.EndHorizontal();*/
            } 
            share = Utils.Toggle("共享", share);
            name  = Utils.TextField("变量名", name);
            EditorGUILayout.EndVertical();
        }

        public bool OnDraw2()
        {
            EditorGUILayout.BeginVertical(Utils.Style2);
            //EditorGUILayout.BeginHorizontal();

            //share = Utils.Toggle("共享", share);
            share = false;
            name = Utils.TextField("变量名", name);
            value = Utils.FloatField("变量值", value);
            minValue = Utils.FloatField("最小值", minValue);
            maxValue = Utils.FloatField("最大值", maxValue);
            changgeType = Utils.EnumPopup("变化",changgeType);
            if (changgeType == VariableChangeType.Auto) {
                interval = Utils.FloatField("间隔(秒)", interval);
                changeValue = Utils.FloatField("变化值", changeValue);
            }
            //EditorGUILayout.EndHorizontal();
            bool ret = false;
            if (Utils.Button("删除"))
            {
                ret = true;
            }

            EditorGUILayout.EndVertical();
            return ret;
        }



    }
}