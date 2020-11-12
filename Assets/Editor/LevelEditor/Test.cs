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

        //[MenuItem("Tools/Level/TestAsset")]
        public static void ExportAI(AIDataMgr data)
        {
            string path = "Assets/Editor/LevelEditor/AI" + data.id + ".asset";
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
            string path = "Assets/Editor/LevelEditor/AI" + id + ".asset";
            AIDataMgr t = AssetDatabase.LoadAssetAtPath<AIDataMgr>(path);
            return t;
        }







    }


}
