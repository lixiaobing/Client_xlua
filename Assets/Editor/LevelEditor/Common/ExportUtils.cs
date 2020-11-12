#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;
using System;
using hjcd.level.BehaviorTree;
using hjcd.level.CheckPoint;

namespace hjcd.level
{

    static class ExportUtils
    {
        public static string Return = "return";
        public static string Space = " ";
        public static string Tab = "\t";

        public static string Comma = ",";
        public static string EqualSign = "=";

        public static string BracesLeft  = "[";
        public static string BracesRight = "]";
        public static string CurlyBracesLeft = "{";
        public static string CurlyBracesRight = "}";
        public static string QuotationMarks = "\"";

        public static string NewLine = "\n";
        public static bool PURE  = false;


        public static HashSet<string> IncludeIntPropertiesToFixed = new HashSet<string>()
        {
        };

        public static string AddTab(string text,int indent ,bool newLine)
        {
            StringBuilder content = new StringBuilder();
            if (newLine) {
                content.Append(NewLine);
            }
            content.Append(Indent(indent));
            content.Append(text);
            return content.ToString();
        }


        public static string F_CurlyBracesLeft(int indent,bool newLine) {
            return AddTab(CurlyBracesLeft,indent, newLine);
        }
        public static string F_CurlyBracesRight(int indent, bool newLine)
        {
            return AddTab(CurlyBracesRight, indent, newLine);
        }
        public static string F_BracesRight(int indent, bool newLine)
        {
            return AddTab(BracesRight, indent, newLine);
        }
        public static string F_BracesLeft(int indent, bool newLine)
        {
            return AddTab(BracesLeft, indent, newLine);
        }



        public static string Indent(int num) {
            StringBuilder content = new StringBuilder();
            while (num > 0) {
                content.Append(Tab);
                num--;
            }
            return content.ToString();
        }
        public static string KV_LIST<T>(object key, List<T> list) where T : IExport
        {

            return KV_LIST<T>(key,list, 0,true);
        }

        public static string KV_LIST<T>(object key, List<T> list, int indent, bool newLine) where T : IExport
        {
            return KV_LIST<T>(key, list, indent , newLine,true);
        }
        public static string KV_LIST<T>(object key, List<T> list,int indent,bool newLine ,bool endComma) where T: IExport
        {
            StringBuilder content = new StringBuilder();
            content.Append(F_BracesLeft(indent,newLine));
            if (key is string)
            {
                content.Append(QuotationMarks);
                content.Append(key);
                content.Append(QuotationMarks);
            }
            else
            {
                content.Append(key);
            }
            content.Append(BracesRight);
            content.Append(EqualSign);
            content.Append(F_CurlyBracesLeft(0,false));
            int index = 0;
            foreach (T t in list)
            {
                index += 1;
                content.Append(F_BracesLeft(indent + 1,true));
                content.Append(index);
                content.Append(BracesRight);
                content.Append(EqualSign);
                content.Append(t.ToLuaString(indent + 1, true));
                content.Append(Comma); //逗号
            }
            content.Append(F_CurlyBracesRight(indent, true));
            if (endComma) {
                content.Append(Comma); //逗号
            }

/*            content.Append(NewLine); //逗号*/
            return content.ToString();
        }


        public static string KV_LIST_VALUE<T>(object key, List<T> list, int indent, bool newLine, bool endComma)
        {
            StringBuilder content = new StringBuilder();
            content.Append(F_BracesLeft(indent, newLine));
            if (key is string)
            {
                content.Append(QuotationMarks);
                content.Append(key);
                content.Append(QuotationMarks);
            }
            else
            {
                content.Append(key);
            }
            content.Append(BracesRight);
            content.Append(EqualSign);
            content.Append(F_CurlyBracesLeft(0, false));
            int index = 0;
            foreach (T t in list)
            {
                index += 1;
                content.Append(F_BracesLeft(indent + 1, true));
                content.Append(index);
                content.Append(BracesRight);
                content.Append(EqualSign);

                if (t is string)
                {
                    content.Append(QuotationMarks);
                    content.Append(t);
                    content.Append(QuotationMarks);
                } else if (t is float) {


                        content.Append(t);
               
                }
                else
                {
                    content.Append(t);
                }
                content.Append(Comma); //逗号
            }
            content.Append(F_CurlyBracesRight(indent, true));
            if (endComma)
            {
                content.Append(Comma); //逗号
            }

            /*            content.Append(NewLine); //逗号*/
            return content.ToString();
        }


        public static string KV(object key, object value)
        {
            return KV(key, value, 0, false);
        }

/*        public static string KV(object key, object value, int indent)
        {
            return KV(key, value, indent, false);
        }
        public static string KV(object key, object value, bool newLine)
        {
            return KV(key, value, 0, newLine);
        }*/

        public static string KV(object key, object value,int indent,bool newLine)
        {
            value = (value == null)? "" : value;
            StringBuilder content = new StringBuilder();
            if (newLine) {
                content.Append(NewLine);
            }
            content.Append(Indent(indent));
            content.Append(BracesLeft);
            if (key is string)
            {
                content.Append(QuotationMarks);
                content.Append(key);
                content.Append(QuotationMarks);
            }
            else {
                content.Append(key);
            }

            content.Append(BracesRight);
            content.Append(EqualSign);

            if (value is string)
            {
                content.Append(QuotationMarks);
                content.Append(value);
                content.Append(QuotationMarks);
            }
            else if (value is bool)
            {
                content.Append(value.ToString().ToLower());
            }
            else if (value is Enum)
            {
                //content.Append((int)value);
                int e = (int)value;
                string enumType = Utils.GetDescription(value);
                content.Append($"{e} --[[{value.ToString()}({enumType})]]");
            }
            else if (value is Vector2)
            {
                Vector2 v = (Vector2)value;

/*                    content.Append(CurlyBracesLeft);
                    content.Append(KV(nameof(v.x), v.x));
                    content.Append(KV(nameof(v.y), v.y));
                    content.Append(CurlyBracesRight);*/

                    content.Append($"Vector2({v.x},{v.y})");
                
            }
            else if (value is Vector3)
            {
                Vector3 v = (Vector3)value;
   
                
                    /*                 content.Append(CurlyBracesLeft);
                                     content.Append(KV(nameof(v.x), v.x));
                                     content.Append(KV(nameof(v.y), v.y));
                                     content.Append(KV(nameof(v.z), v.z));
                                     content.Append(CurlyBracesRight);*/
                    content.Append($"Vector3({v.x},{v.y},{v.z})");
                
            }
            else if (value is ETransform)
            {
                ETransform v = (ETransform)value;
                content.Append(v.ToLuaString(indent, newLine));
            }
            else if (value is IExport) {
                IExport v = (IExport)value;
                content.Append(v.ToLuaString(indent, newLine));
            }
            else if (value is float)
            {
     
                    content.Append(value);
                
            }
            else
            {
 
                 content.Append(value);
                
            }

            content.Append(Comma); //逗号
/*            content.Append(NewLine); //逗号*/
            return content.ToString();

        }


        public static string K(object key, int indent,bool newLine)
        {
            StringBuilder content = new StringBuilder();
            content.Append(F_BracesLeft(indent, newLine));
            if (key is string)
            {
                content.Append(QuotationMarks);
                content.Append(key);
                content.Append(QuotationMarks);
            }
            else
            {
                content.Append(key);
            }
            content.Append(BracesRight);
            return content.ToString();
        }
        public static void AddNote(StringBuilder sb ,string notes,int indent, bool newLine) {
            if (newLine) {
                sb.Append(ExportUtils.NewLine);
            }
            sb.Append(ExportUtils.Indent(indent));
            sb.Append("--");
            sb.Append(notes);
        }
        public static string KV_ENUM<T>(int indent, bool newLine)
        {
            Type type = typeof(T);
            StringBuilder content = new StringBuilder();
            content.Append(F_BracesLeft(indent, newLine));
       
            content.Append(QuotationMarks);
            content.Append(type.Name);
            content.Append(QuotationMarks);
   
            content.Append(BracesRight);
            content.Append(EqualSign);
            content.Append(F_CurlyBracesLeft(0, false));
     
            foreach (object t in Enum.GetValues(type))
            {
                AddNote(content, Utils.GetDescription((T)t), indent + 1, true); //添加注释
                content.Append(F_BracesLeft(indent + 1, true));
                content.Append(QuotationMarks);
                content.Append(Enum.GetName(type, t));
                content.Append(QuotationMarks);
                content.Append(BracesRight);
                content.Append(EqualSign);
                content.Append((int)t);
                content.Append(Comma); //逗号
            }

            content.Append(F_CurlyBracesRight(indent, true));
            content.Append(Comma); //逗号
              
            return content.ToString();
        }

    }
}
#endif