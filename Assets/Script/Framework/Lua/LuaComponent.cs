using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using XLua;

namespace Framework
{
    public class LuaComponent : MonoBehaviour
    {
        LuaFunction destroyfunc = null;

        public LuaTable table
        {
            get;
            private set;
        }

        public LuaTable GetLuaComponent(GameObject go)
        {
            var luaCom = go.GetComponent<LuaComponent>();
            if (null == luaCom)
            {
                return null;
            }
            return luaCom.table;
        }

        public LuaComponent Bind(GameObject obj, LuaTable tb)
        {
            LuaComponent luaComp = obj.GetComponent<LuaComponent>();
            if (luaComp == null)
            {
                luaComp = obj.AddComponent<LuaComponent>();
            }
            table = tb;
            return luaComp;
        }

        protected void Awake()
        {
            var func = table.GetInPath<LuaFunction>("Awake");
            if (func != null)
                func.Call(table);
        }

        protected void Start()
        {
            var func = table.GetInPath<LuaFunction>("Start");
            if (func != null)
                func.Call(table);
        }

        protected void OnDestroy()
        {
            var func = table.GetInPath<LuaFunction>("Update");
            if (func != null)
                func.Call(table);
        }

        void OnControllerColliderHit(ControllerColliderHit target)
        {

        }

        void OnTriggerEnter(Collider target)
        {

        }

        void OnTriggerExit(Collider target)
        {

        }
    }
}