using hjcd.level;
using hjcd.level.BehaviorTree;
using System;
using System.Collections;
using System.Collections.Generic;
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
        public static void ExportAI(AIDataMgr data)
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
        public static AIDataMgr LoadAI(int id)
        {
            string path = string.Format("Assets/ResourcesAsset/Config/Ai/AI{0}.asset", id);
            AIDataMgr t = AssetDatabase.LoadAssetAtPath<AIDataMgr>(path);
            return t;
        }







    }


}
