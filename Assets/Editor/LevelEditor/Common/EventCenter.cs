using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

namespace hjcd.level
{

    public enum EventCenterType { 
        FSMEditor,  //状态机编辑
        AIEditor,   //行为树編輯
        CPEditor,   //关卡编辑
    }
    public enum MessageType
    {
        REPAINT,
        REMOVE_NODE, //节点被移除
    }

    public class EventCallBack
    {
        protected System.Object[] arguments;  //参数
        protected MessageType type;  //事件类型
        protected System.Object sender;    //发送者

        // bean函数
        public MessageType Type
        {
            get { return type; }
            set { type = value; }
        }

        public System.Object[] Params
        {
            get { return arguments; }
            set { arguments = value; }
        }

        public System.Object Sender
        {
            get { return sender; }
            set { sender = value; }
        }

        // 常用函数
        public override string ToString()
        {
            return type + " [ " + ((sender == null) ? "null" : sender.ToString()) + " ] ";
        }

        public EventCallBack Clone()
        {
            return new EventCallBack(type, arguments, sender);
        }

        // 构造函数
        public EventCallBack(MessageType type)
        {
            Type = type;
        }
        public EventCallBack(MessageType type, System.Object sender)
        {
            Type = type;
            Sender = sender;
        }
        public EventCallBack(MessageType type, System.Object[] args, System.Object sender)
        {
            Type = type;
            arguments = args;
            Sender = sender;
        }
    }

    public delegate void EventListenerDelegate(EventCallBack evt);


    public class EventCenter
    {
        static readonly Dictionary<EventCenterType, EventCenter> eventMgrs = new Dictionary<EventCenterType, EventCenter>();
        public static EventCenter GetInstance(EventCenterType eventMgrType) {
            if (!eventMgrs.ContainsKey(eventMgrType)) {
                eventMgrs.Add(eventMgrType, new EventCenter());
            }
            return eventMgrs[eventMgrType];
        }

        // 所有的消息
        Dictionary<MessageType, EventListenerDelegate> notifications = new Dictionary<MessageType, EventListenerDelegate>(); 
        public  void RegisterListener(MessageType type, EventListenerDelegate listener)
        {
            if (listener == null)
            {
                Debug.LogError("registerObserver: listener不能为空");
                return;
            }

            // 将新来的监听者加入调用链，这样只要调用Combine返回的监听者就会调用所有的监听者
            //Debug.Log("NotifacitionCenter: 添加监视" + type);

            EventListenerDelegate myListener = null;
            notifications.TryGetValue(type, out myListener);
            notifications[type] = (EventListenerDelegate)Delegate.Combine(myListener, listener);
        }
        public void RemoveListener(MessageType type, EventListenerDelegate listener)
        {
            if (listener == null)
            {
                Debug.LogError("removeObserver: listener不能为空");
                return;
            }

            if (!notifications.ContainsKey(type)) 
            {
                return;
            }
            // 与添加的思路相同，只是这里是移除操作
            //Debug.Log("NotifacitionCenter: 移除监视" + type);
            notifications[type] = (EventListenerDelegate)Delegate.Remove(notifications[type], listener);
        }
        public  void RemoveAllListeners()
        {
            notifications.Clear();
        }
        public void Dispatch(EventCallBack evt)
        {
            EventListenerDelegate listenerDelegate;
            if (notifications.TryGetValue(evt.Type, out listenerDelegate))
            {
                try
                {
                    if (listenerDelegate != null)
                    {
                        // 执行调用所有的监听者
                        listenerDelegate(evt);
                    }

                }
                catch (System.Exception e)
                {
                    throw new Exception(string.Concat(new string[] { "Error dispatching event", evt.Type.ToString(), ": ", e.Message, " ", e.StackTrace }), e);
                }
            }
        }

    }
}