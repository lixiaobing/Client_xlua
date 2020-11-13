using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using XLua;

namespace Framework
{
    public class LuaComponent : MonoBehaviour
    {

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

        public static LuaComponent Bind(GameObject obj, LuaTable tb)
        {
            LuaComponent luaComp = obj.GetComponent<LuaComponent>();
            if (luaComp == null)
            {
                luaComp = obj.AddComponent<LuaComponent>();
            }
            luaComp.table = tb;
            return luaComp;
        }

        protected void OnDestroy()
        {
            var func = table.GetInPath<LuaFunction>("OnDestroy");
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