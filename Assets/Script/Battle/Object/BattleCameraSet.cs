using UnityEngine;
[CreateAssetMenu(fileName = "BattleCameraSet Name", menuName = "X-Create BattleCameraSet")]
[System.Serializable]
public class BattleCameraSet : ScriptableObject
{
    //常规视角
    public bool normalEnable = true;
    public NormalCameraParams normalParams = new NormalCameraParams();

    //侧面视角
    public bool sideEnable = true;
    public SideCameraParams sideParams = new SideCameraParams();

    //顶部视角
    public bool topEnable = true;
    public TopCameraParams topParams = new TopCameraParams();


}

[System.Serializable]
public struct NormalCameraParams
{
    [Header("--普通机位")]
    public Vector3 normalPosition;
    public Vector3 normalAngle;
    public float normalSmooth;

    [Header("--战斗机位")]
    public Vector3 battlePosition;
    public Vector3 battleAngle;
    public float battleSmooth;

    [Header("--通关机位")]
    public Vector3 clearPosition;
    public Vector3 clearAngle;
    public float clearSmooth;

    [Header("--休闲机位")]
    public Vector3 relaxPosition;
    public Vector3 relaxAngle;
    public float relaxSmooth;

    [Header("--其他参数")]

    public Vector3 wallFixPosition;
    public float wallFixSmooth;

    public float minRotateY;
    public float maxRotateY;

    public float moveRotateSpeed;
    public float attackFixSpeed;
}

[System.Serializable]
public struct SideCameraParams
{
    public float followSpeed;
    public float defaultDistance;
}

[System.Serializable]
public struct TopCameraParams
{
    public float followSpeed;
    public float defaultHeight;
}
