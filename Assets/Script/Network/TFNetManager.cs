using Framework;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OneSocket
{
    public int LastStatus = 0;
    public TFSocketClient socket = null;
}

public class TFNetManager : MonoBehaviour
{
    private TFSocketClient GsocketClient = null;
    private static List<OneSocket> SocketList = new List<OneSocket>();
    private int LastStatus = 0;

    public static TFNetManager Instance
    {
        get;
        protected set;
    }

    void Awake()
    {
        //GsoketClient = TFSocketClient.GetInstance();
        Instance = this;
        //this.loadLuaFile("net/NetWork.lua");
    }

    //获取当前服务器状态
    public int GetSocketStatus()
    {
        return GsocketClient.GetSocketStatus();
    }

    public void RegisterSocket(TFSocketClient _socket)
    {
        SocketList.Add(new OneSocket {
            LastStatus = 0,
            socket = _socket
        });
    }

    public void RemoveSocket(TFSocketClient _socket)
    {
        for (int i = 0; i < SocketList.Count; i++)
        {
            if (SocketList[i].socket == _socket)
            {
                SocketList[i].socket = null;
                SocketList.RemoveAt(i);
                break;
            }
        }
    }    

    public void SetLastStatus(TFSocketClient _socket ,int status)
    {
        foreach(var socket in SocketList)
        {
            if (socket.socket == _socket)
            {
                socket.LastStatus = status;
            }
        }
        //LastStatus = status;
    }

    // Use this for initialization
    void Start () {
        //test
        //GetInstance().ConnectServer("127.0.01", 9999);
    }
	
	// Update is called once per frame
	void Update() {

        foreach (var target in SocketList)
        {
            if (target.socket == null)
            {
                return;
            }

            if (target.LastStatus != (int)target.socket.GetSocketStatus())
            {
                target.socket.ExecuteSocketStatusEvent();
            }
            //取出队列的数据传给lua
            Queue<TFByteBuffer> ReceiveQueue = target.socket.GetReceiveQueue();
            if (ReceiveQueue.Count > 0)
            {
                TFByteBuffer bytes = ReceiveQueue.Dequeue();
                LuaManager.Instance.CallFunction("NetHelper.Receive", new object[] { bytes });
            }
            //取出发送队列直接发送
            Queue<TFByteBuffer> WriteQueue = target.socket.GetWriteQueue();
            if (WriteQueue.Count > 0)
            {
                TFByteBuffer GmaeByte = WriteQueue.Dequeue();
                target.socket.WriteMessage(GmaeByte);
            }
        }
        
    }
}
