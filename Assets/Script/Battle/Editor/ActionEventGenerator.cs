using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace Battle
{
    public class ActionEventGenerator
    {
        public static string ExportScriptPath = Application.dataPath + "/Script/Battle/ActionEvent/ActionConfig/ActionEventConfig/";

        [MenuItem("Tools/Battle/ClearActionEventScript", false, 200)]
        public static void ClearConfigScript()
        {
            if (Directory.Exists(ExportScriptPath))
                Directory.Delete(ExportScriptPath, true);
            AssetDatabase.Refresh();
        }

        [MenuItem("Tools/Battle/GenerateActionEventScript", false, 201)]
        public static void GenerateActionEventScript()
        {
            Type type = typeof(ActionEventKind);
            string[] actionEventNames = System.Enum.GetNames(type);

            List<string> exportPropertys = new List<string>();
            for (int i = 0; i < actionEventNames.Length; ++i)
            {
                exportPropertys.Clear();
                string exprotTypeName = actionEventNames[i];
                //ActionEventKind exportType = (ActionEventKind)System.Enum.Parse(typeof(ActionEventKind), actionEventNames[i]);
                PropertyInfo[] infos = typeof(ActionEvent).GetProperties();
                for (var x = 0; x < infos.Length; x++)
                {
                    PropertyInfo info = infos[x];
                    if (ActionEventPack.CheckExportAttr(actionEventNames[i], info.Name))
                        exportPropertys.Add(info.Name);
                }
                ExportScript(exprotTypeName, exportPropertys);
            }

            AssetDatabase.Refresh();
        }

        private static void ExportScript(string exprotTypeName, List<string> exportPropertys)
        {
            if (!Directory.Exists(ExportScriptPath))
                Directory.CreateDirectory(ExportScriptPath);

            Type actionEventType = typeof(ActionEvent);
            PropertyInfo[] infos = actionEventType.GetProperties();

            string fileName = exprotTypeName + "EventConfig.cs";
            string filePath = ExportScriptPath + fileName;
            StringBuilder sbAttrs = new StringBuilder();
            if (exportPropertys.Count > 0)
            {
                for (int i = 0; i < exportPropertys.Count; ++i)
                {
                    string property = exportPropertys[i];
                    for (var x = 0; x < infos.Length; x++)
                    {
                        PropertyInfo info = infos[x];
                        string arrtType = PropertyToName(info.PropertyType);
                        if (info.Name!="None" && info.Name == property)
                        {
                            sbAttrs.Append($"        public {arrtType} {property};\n");
                        }
                    }
                }
            }
            string strAttrs = sbAttrs.ToString();

            StringBuilder sbContent = new StringBuilder();

            sbContent.Append("using UnityEngine;\n\n");
            sbContent.Append("namespace Battle\n");
            sbContent.Append("{\n");
            sbContent.Append($"    public partial class {exprotTypeName}EventConfig : ActionEventConfig\n");
            sbContent.Append("    {\n");
            sbContent.Append($"        public override ActionEventKind type => ActionEventKind.{exprotTypeName};\n");
            if (!string.IsNullOrEmpty(strAttrs))
                sbContent.Append(sbAttrs);
            sbContent.Append("    }\n");
            sbContent.Append("}\n");

            File.WriteAllText(filePath, sbContent.ToString());
        }

        private static string PropertyToName(Type PropertyType)
        {
            switch (PropertyType.Name.ToLower())
            {
                case "int32":
                    return "int";
                case "int16":
                    return "short";
                case "byte":
                    return "byte";
                case "single":
                    return "float";
                case "boolean":
                    return "bool";
                case "string":
                    return "string";
                default:
                    return PropertyType.Name;
            }
        }
    }
}
