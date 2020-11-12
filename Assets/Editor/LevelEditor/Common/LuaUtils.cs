using Framework;

using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Xml.Serialization;
using UnityEditor;
using UnityEngine;
using XLua;

namespace hjcd.level {
    public struct ModelInfo {
        public string name;
        public string path;
        public float scale;
        public bool result;
    }
    public static class LuaUtils
    {
        static LuaEnv luaState;
        static LuaUtils()
        {
            Initlize();
        }

        public static byte[] CustomLoader(ref string filepath) {
            Debug.LogWarning("LuaUtils Loader config"+ filepath);
            return null;
        
        }


        static void Initlize() {
            if (luaState == null) {
                luaState = new LuaEnv();
                luaState.AddLoader(CustomLoader);
/*                luaState.Start();
                //lua 路径
                luaState.AddSearchPath(Application.dataPath + "\\Lua/config/");*/
                //加载配置表
                Load("Monster");
                Load("DungeonGate");
                Load("DungeonConsole");
                Load("DungeonObstacle");
                Load("DungeonPlatform");
            }
        }


        static void Load(string config)
        {
            string script = string.Format("{0} = require('{0}')", config);
            luaState.DoString(script, config);
            //luaState.CheckTop();
        }

        //获取障碍物
        public static ModelInfo GetObstacle(int id)
        {
            ModelInfo modelInfo = new ModelInfo();
            if (id > 0)
            {
                LuaTable table = luaState.Global.Get<LuaTable>("DungeonObstacle");
                table = (LuaTable)table[id];
                if (table != null)
                {
                    modelInfo.result = true;
                    modelInfo.name = (string)table["name"];
                    table = (LuaTable)table["model_info"];
                    modelInfo.path = (string)table["path"];
                    //object o = table["scale"];
                    modelInfo.scale = (float)(double)table["scale"];
                    return modelInfo;
                }
            }
            Utils.Log(string.Format("DungeonObstacle[{0}] 不存在", id));
            modelInfo.path   = "Model/Monster/Origami";
            modelInfo.scale = 1;
            modelInfo.name = " 默认障碍";
            modelInfo.result = false;
            return modelInfo;
        }


        public static ModelInfo GetConsole(int id)
        {
            ModelInfo modelInfo = new ModelInfo();
            if (id > 0)
            {
                LuaTable table = luaState.Global.Get<LuaTable>("DungeonConsole");
                table = (LuaTable)table[id];
                if (table != null)
                {
                    modelInfo.result = true;
                    modelInfo.name = (string)table["name"];
                    table = (LuaTable)table["model_info"];
                    modelInfo.path = (string)table["path"];
                    return modelInfo;
                }
            }
            modelInfo.name = "Console";
            modelInfo.path = "Model/Monster/Origami";
            modelInfo.result = false;
            Utils.Log(string.Format("DungeonConsole[{0}] 不存在", id));
            return modelInfo;
        }



        public static bool GetGate(int id, out string name, out string path)
        {
            if (id > 0)
            {
                LuaTable table = luaState.Global.Get<LuaTable>("DungeonGate");
                table = (LuaTable)table[id];
                if (table != null)
                {
                    name = (string)table["name"];
                    //table = (LuaTable)table["model_info"];
                    path = (string)table["path"];
                    return true;
                }
            }
            name = "Gate";
            path = "";
            Utils.Log(string.Format("DungeonGate[{0}] 不存在", id));
            return false;
        }

        static Hashtable monsters;
        public static Hashtable GetMonsters()
        {   if (monsters == null) {
                LuaTable table = luaState.Global.Get<LuaTable>("Monster");
                //Hashtable hashtable = table.ToDictTable().ToHashtable();
                monsters = new Hashtable();
                foreach (var key in table.GetKeys())
                {
                    string name   = (string)((LuaTable)table[key])["name"];
                    var level     = ((LuaTable)table[key])["default_level"];
                    monsters[key.ToString()] = "[" + key +"]" +  name + " " + level+"级";
                }
            }

            return monsters;
        }

        public static bool GetMonster(int id ,out string name,out string path)
        {
            if(id > 0) { 
                LuaTable table = luaState.Global.Get<LuaTable>("Monster");

                table = (LuaTable)table[id];
                if (table != null)
                {
                    name  = (string)table["name"];
                    table = (LuaTable)table["model_info"];
                    path  = "Model/" + (string)table["path"];
                    return true;
                }
            }
            name = "Monster";
            path = "";
            Utils.Log(string.Format("Monster[{0}] 不存在", id));
            return false;
        }


        static Hashtable platforms;
        public static Hashtable GetPlatforms()
        {
            if (platforms == null)
            {
                LuaTable table = luaState.Global.Get<LuaTable>("DungeonPlatform");
                //Hashtable hashtable = table.ToDictTable().ToHashtable();
                
                platforms = new Hashtable();
                foreach (var key in table.GetKeys())
                {
                    /*                    string name = (string)((LuaTable)hashtable[key])["name"];
                                        var level = ((LuaTable)hashtable[key])["default_level"];
                                        platforms[key.ToString()] = "[" + key + "]" + name + " " + level + "级";*/

                    platforms[key.ToString()] = "[" + key + "]" + "Platform"; 
                }
            }

            return platforms;
        }


        //获取平台
        public static string GetPlatform(int id)
        {
            if (id > 0)
            {
                LuaTable table = luaState.Global.Get<LuaTable>("DungeonPlatform");
                table = (LuaTable)table[id];
                if (table != null)
                {
                    return (string)table["path"];
   
                }
            }
            Utils.Log(string.Format("DungeonPlatform[{0}] 不存在", id));
            return "";
        }


        static void Dispose() {
            monsters = null;
            if (luaState != null)
            {
                luaState.Dispose();
                luaState = null;
            }
        }
        //重先加载lua配置
        public static void Reload() {
            Utils.Log("LuaUtils Reload");
            Dispose();
            Initlize();
        }
    }
        






}