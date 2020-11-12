using System;
using UnityEngine;
using UnityEngine.Events;
using XLua;

namespace Framework
{
    public class LuaLooper : MonoBehaviour
    {
        public UnityEvent UpdateEvent
        {
            get;
            private set;
        }

        public UnityEvent LateUpdateEvent
        {
            get;
            private set;
        }

        public UnityEvent FixedUpdateEvent
        {
            get;
            private set;
        }

        void Awake()
        {
            UpdateEvent = new UnityEvent();
            LateUpdateEvent = new UnityEvent();
            FixedUpdateEvent = new UnityEvent();
        }

        void Update()
        {
            UpdateEvent.Invoke();
        }

        void LateUpdate()
        {
            LateUpdateEvent.Invoke();
        }

        void FixedUpdate()
        {
            FixedUpdateEvent.Invoke();
        }

        void OnDestroy()
        {
            UpdateEvent.RemoveAllListeners();
            UpdateEvent = null;
            LateUpdateEvent.RemoveAllListeners();
            LateUpdateEvent = null;
            FixedUpdateEvent.RemoveAllListeners();
            FixedUpdateEvent = null;
        }
    }

}

