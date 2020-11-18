using hjcd.level;
using hjcd.level.BehaviorTree;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace hjcd.level {
    public class Test : ScriptableObject
    {
        //导出类型
        public enum ExportMode { 
            Lua = 0, //lua
            Asset,
        
        }
        public static ExportMode exportMode = ExportMode.Asset;
        public static void ExportAI(BehaviorTree.BehaviorTree data)
        {
            string path = string.Format("Assets/ResourcesAsset/Config/Ai/AI{0}.asset", data.id);

            //string path = string.Format("Assets/AI{0}.asset", data.id);
            if (Utils.FileExists(path))
            {
                AssetDatabase.DeleteAsset(path);
            }
            AssetDatabase.CreateAsset(data, path);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }



        //[MenuItem("Tools/Level/TestAssetLoad")]
        public static BehaviorTree.BehaviorTree LoadAI(int id)
        {
            string path = string.Format("Assets/ResourcesAsset/Config/Ai/AI{0}.asset", id);
            BehaviorTree.BehaviorTree t = AssetDatabase.LoadAssetAtPath<BehaviorTree.BehaviorTree>(path);
            return t;
        }




        [MenuItem("Tools/Test %#F9")] //CTRL SHIFT F10
        public static void GetField()
        {

       
            var a = AssetDatabase.LoadAssetAtPath<AIConfig>(BehaviorTreeConst.GetBehaviorTreeExportFilePath(101));

            foreach (var variable in a.variables)
            {
                Debug.Log(variable.name + ":" + variable.value);
            }
            

            Debug.Log("AAAAAAA");
        }





    }


}
