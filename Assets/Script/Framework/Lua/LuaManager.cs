using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using UnityEngine;
using XLua;

namespace Framework
{
    public class LuaManager:MonoBehaviour
    {
        public static LuaManager Instance
        {
            get;
            protected set;
        }

        public LuaEnv luaEnv = null;
        public LuaLooper looper = null;
        public LuaCoroutine coroutine = null;

        void Awake()
        {
            Instance = this;

            luaEnv = new LuaEnv();
            luaEnv.AddLoader(CustomLoader);

            looper = this.gameObject.AddComponent<LuaLooper>();
            coroutine = this.gameObject.AddComponent<LuaCoroutine>();
        }

        public void Init()
        {
            DoFile("Main");
            CallFunction("main");
        }

        public void DoString(string code)
        {
            luaEnv.DoString(code);
        }

        public void DoFile(string filePath)
        {
            luaEnv.DoString(string.Format("require('{0}')", filePath));
        }

        public LuaFunction GetFunction(string funcName)
        {
            return luaEnv.Global.GetInPath<LuaFunction>(funcName);
        }

        public object[] CallFunction(string funcName, object[] args=null)
        {
            var func = GetFunction(funcName);
            return func.Call(args);
        }
        

        void Update()
        {
            if (luaEnv != null)
            {
                luaEnv.Tick();
            }
        }

        byte[] CustomLoader(ref string filePath)
        {
            string path = string.Empty;

            if (GameConst.isDevelop)
            {
                if (filePath.IndexOf("LoginWindow")>-1)
                {
                    var X = path;
                }
                path = Path.Combine(Application.dataPath, GameConst.luaCodePath);
                path = Path.Combine(path, filePath);
                path = path + ".lua";

                if (File.Exists(path))
                {
                    return File.ReadAllBytes(path);
                }
            }

            return null;
        }

        void OnDestroy()
        {
            luaEnv.Dispose();
        }
    }
}

