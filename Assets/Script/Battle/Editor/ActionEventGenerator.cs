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

        #region 导出脚本
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
            Debug.Log("导出脚本完毕");
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
                            sbAttrs.Append($"        public {arrtType} {property};\r\n");
                        }
                    }
                }
            }
            string strAttrs = sbAttrs.ToString();

            // 导出格式如下：
            //namespace Battle
            //{
            //    public partial class {0}EventConfig : ActionEventConfig
            //    {
            //        public override ActionEventKind type => ActionEventKind.{0};
            //        {1}
            //        {2}
            //        {...}
            //        {n}
            //    }
            //}

            StringBuilder sbContent = new StringBuilder();
            sbContent.Append("using UnityEngine;\r\n\r\n");
            sbContent.Append("namespace Battle\r\n");
            sbContent.Append("{\r\n");
            sbContent.Append($"    public partial class {exprotTypeName}EventConfig : ActionEventConfig\r\n");
            sbContent.Append("    {\r\n");
            sbContent.Append($"        public override ActionEventKind type => ActionEventKind.{exprotTypeName};\r\n");
            if (!string.IsNullOrEmpty(strAttrs))
                sbContent.Append(sbAttrs);
            sbContent.Append("    }\r\n");
            sbContent.Append("}\r\n");

            string newContent = sbContent.ToString();
            string oldContent = "";

            if (File.Exists(filePath))
                oldContent = File.ReadAllText(filePath);
            if(newContent != oldContent)
                File.WriteAllText(filePath, newContent);
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
        #endregion

        #region 导出数据
        public static string ExportConfigPath = Application.dataPath + "/ResourcesAsset/Config/Action/";

        [MenuItem("Tools/Battle/ClearActionEventConfig", false, 202)]
        public static void ClearActionEventConfig()
        {
            if (Directory.Exists(ExportConfigPath))
                Directory.Delete(ExportConfigPath, true);
            AssetDatabase.Refresh();
        }


        [MenuItem("Tools/Battle/GenerateActionEventConfigAll", false, 203)]
        public static void GenerateActionEventConfig()
        {
            string[] modelTypeTabs = { "Hero", "Monster", "Summon", "Dungeon" };
            for(int i=0; i< modelTypeTabs.Length; ++i)
            {
                string modelTabName = modelTypeTabs[i];
                string selectModelFolder = Application.dataPath + "/ResourcesWork/Model/" + modelTabName + "/";

                string[] heroFolders = Directory.GetDirectories(selectModelFolder);
                List<string> heroPaths = new List<string>();

                foreach (string path in heroFolders)
                {
                    heroPaths.AddRange(Directory.GetFiles(path, "*.controller"));
                    heroPaths.AddRange(Directory.GetFiles(path, "*.overrideController"));
                }

                string[] paths = heroPaths.ToArray();

                Array.Sort(paths, (a, b) =>
                {
                    string namea = Path.GetFileNameWithoutExtension(a);
                    string nameb = Path.GetFileNameWithoutExtension(b);
                    return string.CompareOrdinal(namea, nameb);
                });

                foreach (string path in paths)
                {
                    string fileName = Path.GetFileNameWithoutExtension(path);
                    string[] folders = Path.GetDirectoryName(path).Split('\\');
                    string folderName = folders[folders.Length - 1];

                    string selectFolder = folderName;
                    string selectFile = Path.GetFileNameWithoutExtension(path);
                    ActionEventPack selectEventPack = LoadActionEventPack(modelTabName, selectFolder, selectFile);
                    ExportActionEventPack(selectEventPack, fileName);
                }
            }
            
            AssetDatabase.Refresh();
        }

        [MenuItem("Tools/Battle/GenerateActionEventConfigSelect", false, 204)]
        public static void GenerateActionEventConfigSelect()
        {
            if (!Selection.activeObject || !(Selection.activeObject is ActionEventPack))
                return;
            ActionEventPack pack = Selection.activeObject as ActionEventPack;
            ExportActionEventPack(pack, pack.name, true);
        }

        private static ActionEventPack LoadActionEventPack(string tabName, string folderName, string animatorName)
        {
            string packPath = $"Assets/ResourcesWork/Model/{tabName}/{folderName}/{animatorName}.asset";
            ActionEventPack pack = AssetDatabase.LoadAssetAtPath<ActionEventPack>(packPath);
            if (pack == null)
            {
                ActionEventPack obj = ScriptableObject.CreateInstance<ActionEventPack>();
                AssetDatabase.CreateAsset(obj, packPath);
                AssetDatabase.Refresh();

                pack = obj;
            }
            return pack;
        }

        private static void ExportActionEventPack(ActionEventPack actionEventPack, string fileName, bool refresh = false)
        {
            if (actionEventPack)
            {
                string eventConfigFilePath = ExportConfigPath + fileName + ".asset";
                string eventConfigFoldPath = ExportConfigPath + fileName + "/";

                if (File.Exists(eventConfigFilePath))
                    File.Delete(eventConfigFilePath);
                if (Directory.Exists(eventConfigFoldPath))
                    Directory.Delete(eventConfigFoldPath, true);
                Directory.CreateDirectory(eventConfigFoldPath);

                ActionEventPackConfig config = ScriptableObject.CreateInstance<ActionEventPackConfig>();
                AssetDatabase.CreateAsset(config, eventConfigFilePath.Replace(Application.dataPath, "Assets"));

                int subPackCount = actionEventPack.clipPacks.Count;
                config.subPacks = new ActionEventPackConfig.SubPack[subPackCount];

                var editorActionEventType = typeof(ActionEvent);

                Dictionary<string, ActionEventConfig> createRefAssets = new Dictionary<string, ActionEventConfig>();

                for (int i = 0; i < subPackCount; ++i)
                {
                    ActionEventSubPack subPackEditor = actionEventPack.clipPacks[i];
                    if (subPackEditor != null)
                    {
                        config.subPacks[i] = new ActionEventPackConfig.SubPack();
                        var subPackData = config.subPacks[i];
                        subPackData.stateName = subPackEditor.stateName;
                        subPackData.frameLength = subPackEditor.frameLength;
                        subPackData.events = new ActionEventConfig[subPackEditor.events.Count];

                        for(int j=0; j< subPackData.events.Length; ++j)
                        {
                            var editorActionEvent = subPackEditor.events[j];
                            string eventFilePath = eventConfigFoldPath + subPackData.stateName + "_" + j.ToString("00") + ".asset";
                            ActionEventConfig eventConfig = typeof(ActionEventConfig).Assembly.CreateInstance(string.Format("Battle.{0}EventConfig", editorActionEvent.type.ToString())) as ActionEventConfig;
                            if (eventConfig != null)
                            {
                                //AssetDatabase.CreateAsset(eventConfig, eventFilePath.Replace(Application.dataPath, "Assets"));

                                createRefAssets.Add(eventFilePath.Replace(Application.dataPath, "Assets"), eventConfig);

                                subPackData.events[j] = eventConfig;

                                Type typeEventConfig = eventConfig.GetType();
                                var fields = typeEventConfig.GetFields(BindingFlags.Public | BindingFlags.Instance);
                                for(int k=0; k< fields.Length; ++k)
                                {
                                    var actionEventField = fields[k];
                                    var editorActionEventProperty = editorActionEventType.GetProperty(fields[k].Name);
                                    if (editorActionEventProperty != null)
                                    {
                                        object obj = editorActionEventProperty.GetValue(editorActionEvent);
                                        actionEventField.SetValue(eventConfig, obj);
                                    }
                                }
                                //EditorUtility.SetDirty(eventConfig);
                            }
                        }
                    }
                }

                if (createRefAssets.Count > 0)
                {
                    foreach(var kv in createRefAssets)
                    {
                        AssetDatabase.CreateAsset(kv.Value, kv.Key);
                    }
                }

                EditorUtility.SetDirty(config);
                if (refresh)
                {
                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();
                }
            }
            
        }
        #endregion
    }
}
