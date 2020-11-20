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

        LuaFunction UpdateEvent;
        LuaFunction LateUpdateEvent;
        LuaFunction FixedUpdateEvent;

        void Awake()
        {
            Instance = this;
        }

        public void Init()
        {
            UpdateEvent = LuaManager.Instance.GetFunction("Update");
            LateUpdateEvent = LuaManager.Instance.GetFunction("LateUpdate");
            FixedUpdateEvent = LuaManager.Instance.GetFunction("FixedUpdate");
        }

        void Update()
        {
            UpdateEvent?.Action(Time.deltaTime, Time.unscaledDeltaTime);
        }

        void LateUpdate()
        {
            LateUpdateEvent?.Action(0);
        }

        void FixedUpdate()
        {
            FixedUpdateEvent?.Action(Time.fixedDeltaTime);
        }

        void OnDestroy()
        {
            UpdateEvent = null;
            LateUpdateEvent = null;
            FixedUpdateEvent = null;
        }
    }

}

