using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class TypeWriter : MonoBehaviour
{

    public float charsPerSecond = 0.1f;//打字时间间隔
    private string words;//保存需要显示的文字

    private bool isActive = false;
    private float time;//计时器
    private Text text {
        get {
            if (_text == null) {
                _text = GetComponent<Text>();
            }
            return _text; 
        }
    }
    private int currentPos = 0;//当前打字位置
    public UnityEvent onFinish = new UnityEvent();
    // Use this for initialization
    private Text _text;
    void Awake()
    {
        time = 0;
        charsPerSecond = Mathf.Max(0.2f, charsPerSecond);
        _text = GetComponent<Text>();
    }
    public bool IsActive {
        get { return this.isActive; }
    }
    public void Play(string content)
    {
        this.words = content;
        this.isActive = true;
        this.currentPos = 0;
        this.time = 0;
        this.text.text = "";
    }
    public void Pause()
    {
        this.isActive = false;
    }

    public void RePlay()
    {
        Play(this.words);
    }
    //跳到末尾
    public void Skip()
    {
        this.isActive = false;
        this.currentPos = 0;
        this.time = 0;
        this.text.text = this.words;
    }


    void Update()
    {
        if (isActive)
        {
            time += Time.deltaTime;
            if (time >= charsPerSecond)
            {//判断计时器时间是否到达
                time = 0;
                currentPos++;
                text.text = words.Substring(0, currentPos);//刷新文本显示内容

                if (currentPos >= words.Length)
                {
                    _OnFinish();
                }
            }

        }
    }

    void _OnFinish()
    {
        isActive = false;
        time = 0;
        currentPos = 0;
        text.text = words;
        this.onFinish.Invoke();
    }

    protected void OnDestroy()
    {
        this.onFinish.RemoveAllListeners();
    }

}