using UnityEngine;

[System.Serializable]
public class MoveCurve : ScriptableObject
{
    public string filePath = string.Empty;

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
