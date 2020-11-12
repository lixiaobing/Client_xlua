using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class ActionEventConfig : ScriptableObject
{
    public abstract ActionEventKind kind { get; }
    public virtual string[] CollectAssetPaths() { return null; }
}

// 开关事件
public abstract class ToggleConfig : ActionEventConfig { public bool toggle; }

// 闪避事件
public abstract class MoveCurve : ActionEventConfig
{
    public float startTime = 0;
    public float startRealTime = 0;

    public float endTime = 0;
    public float endRealTime = 0;
    //支持缩放
    public bool isZoom = false;
    //支持补偿（仅前移使用）
    public bool isCompensate = false;

    public AnimationCurve curve = new AnimationCurve();
}