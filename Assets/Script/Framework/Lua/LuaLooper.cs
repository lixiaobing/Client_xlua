using System;
using UnityEngine;
using UnityEngine.Events;
using XLua;

namespace Framework
{
    public class LuaLooper : MonoBehaviour
    {
        public static LuaLooper Instance
        {
            get;
            private set;
        }

        public LuaFunction UpdateEvent
        {
            get;
            private set;
        }

        public LuaFunction LateUpdateEvent
        {
            get;
            private set;
        }

        public LuaFunction FixedUpdateEvent
        {
            get;
            private set;
        }

        void Awake()
        {
            Instance = this;
        }

        public void Init()
        {
            LuaFunction UpdateEvent = LuaManager.Instance.GetFunction("Update");
            LuaFunction LateUpdateEvent = LuaManager.Instance.GetFunction("LateUpdate");
            LuaFunction FixedUpdateEvent = LuaManager.Instance.GetFunction("FixedUpdate");
        }

        void Update()
        {
            if(UpdateEvent != null)
                UpdateEvent.Call(new object[]{Time.deltaTime, Time.unscaledDeltaTime});
        }

        void LateUpdate()
        {
            if (LateUpdateEvent != null)
                LateUpdateEvent.Call();
        }

        void FixedUpdate()
        {
            if (FixedUpdateEvent != null)
                FixedUpdateEvent.Call(new object[] { Time.fixedDeltaTime });
        }

        void OnDestroy()
        {
            if (UpdateEvent != null)
            {
                UpdateEvent.Dispose();
                UpdateEvent = null;
            }
            if (LateUpdateEvent != null)
            {
                LateUpdateEvent.Dispose();
                LateUpdateEvent = null;
            }
            if (FixedUpdateEvent != null)
            {
                FixedUpdateEvent.Dispose();
                FixedUpdateEvent = null;
            }
        }
    }

}

