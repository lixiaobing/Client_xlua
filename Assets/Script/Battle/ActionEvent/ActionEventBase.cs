using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace Battle
{
    public abstract class ActionEventBase
    {
        private int stateID;
        public bool isComplete { get; private set; }
        public bool isLoaded { get; protected set; }
        protected ActionEventConfig configBase { get; private set; }

        public void SetConfig(ActionEventConfig config) { this.configBase = config; OnInitConfig(); }
        public void SetAsset(Object originAsset, Transform parent) { }

        public void Play(int stateID) 
        { 
            this.stateID = stateID; 
            OnEnter(); 
        }

        public void Stop()
        {
            isComplete = true;
        }

        public void Reset()
        {
            isComplete = false;
            OnReset();
        }

        // OnCall
        public virtual void OnInitConfig() { }
        public virtual void OnSetAsset() { }
        public virtual void OnReset() { }

        public virtual void OnEnter() { }
        public virtual void OnUpdate() { }
        public virtual void OnExit() { }

        private static System.Type[] eventTypes = new System.Type[ActionEvent.MaxType];
        static ActionEventBase()
        {
            int eventCount = ActionEvent.MaxType;
            string eventName;
            for (int i = 0; i < eventCount; ++i)
            {
                eventName = string.Concat(((ActionEventKind)i).ToString(), "Event");
                eventTypes[i] = System.Type.GetType(eventName);
                if (eventTypes[i] == null)
                    Debug.Log("事件类型未实现: " + eventName);
            }
        }

        public static ActionEventBase Create(ActionEventConfig eventConfig)
        {
            if (eventConfig != null)
            {
                System.Type tp = eventTypes[(int)eventConfig.type];
                ActionEventBase ae = null;
                if (tp != null)
                {
                    ae = System.Activator.CreateInstance(tp) as ActionEventBase;
                    ae.SetConfig(eventConfig);
                }
                return ae;
            }
            else
                return null;
        }
    }

    public abstract class ActionEventT<T> : ActionEventBase where T : ActionEventConfig
    {
        protected T desc;
        public override void OnInitConfig()
        {
            desc = configBase as T;
        }
    }
}