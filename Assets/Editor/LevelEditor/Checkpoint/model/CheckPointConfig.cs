using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{

    //[CreateAssetMenu]
    public class CheckPointConfig : ScriptableObject
    {
        public const string exportDir = "Assets/Lua/config/level/";
        public const string groupFile = "Assets/Editor/LevelEditor/_project/config/levelGroup.asset";
        public const string MonsterIDFactoryFile = "Assets/Editor/LevelEditor/_project/config/MonsterIDFactory.asset";
        //Ai 存放目录
        public const string checkPointDir  = "Assets/Editor/LevelEditor/_project/level/";

        //行为树完整的路径
        public static string GetFilePath(int id) { 
            return string.Format(checkPointDir + "{0}.xml", id);
        }

        public static string GetExportFilePath(int id)
        {
            return string.Format(exportDir + "level_{0}.lua", id);
        }
    }
}