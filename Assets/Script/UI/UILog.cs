using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UILog : MonoBehaviour
{
    Button btnOpen;
    Transform panel;
    Button btnClose;
    Button btnClear;

    ScrollPoolVertical scrollPool;

    List<UILogData> logRecords = new List<UILogData>();

    Text detail;

    public static UILog Instance;

    void Start()
    {
        btnOpen = this.transform.Find("BtnOpen").GetComponent<Button>();
        panel = this.transform.Find("Panel");
        btnClose = panel.Find("BtnClose").GetComponent<Button>();
        btnClear = panel.Find("BtnClear").GetComponent<Button>();

        scrollPool = panel.Find("Scroll View/Viewport/Area").GetComponent<ScrollPoolVertical>();

        detail = panel.Find("Detail/Scroll View/Viewport/Area/Content").GetComponent<Text>();

        btnOpen.onClick.AddListener(onClickOpen);
        btnClose.onClick.AddListener(onClickClose);
        btnClear.onClick.AddListener(onClickClear);

        Instance = this;

        Application.logMessageReceived += onLog;
    }

    int clickCount = 0;
    float clickTime = 0;

    void Update()
    {
        if (clickCount > 0 && Time.time - clickTime >= 1)
        {
            clickCount = 0;
            clickTime = 0;
        }
    }

    void onClickOpen()
    {
        clickCount++;
        clickTime = Time.time;

        if (clickCount >= 3)
        {
            panel.gameObject.SetActive(true);

            RefeshList();

            clickCount = 0;
            clickTime = 0;
        }
    }

    void onClickClear()
    {
        logRecords.Clear();

        detail.text = "";

        RefeshList();
    }

    void onClickClose()
    {
        panel.gameObject.SetActive(false);
    }

    void onLog(string message, string stackTrace, LogType type)
    {
        UILogData data = new UILogData();
        data.time = string.Format("{0} {1}", DateTime.Now.ToString("HH:mm:ss"), Time.frameCount);
        data.message = message;
        data.stackTrace = stackTrace;
        data.type = type;

        logRecords.Add(data);
        //GameLog.Log("XXXX " + logRecords.Count);

        if (panel.gameObject.activeSelf)
        {
            RefeshList();
        }
    }

    void RefeshList()
    {
        scrollPool.InitPool(logRecords.Count, (int index, GameObject cell) =>
        {
            UILogData data = logRecords[index - 1];

            UILogCell box = cell.transform.GetComponent<UILogCell>();
            box.Refresh(data, index - 1);
        });

        scrollPool.InitListSize(logRecords.Count);
    }

    public void ShowDetail(UILogData data)
    {
        string content = string.Format("{0}\n{1}", data.message, data.stackTrace);
        detail.text = content;
    }
}



public struct UILogData
{
    public string time;
    public string message;
    public string stackTrace;
    public LogType type;
}