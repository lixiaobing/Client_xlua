using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BulletScreenSet Name", menuName = "X-Create BulletScreenSet")]
[System.Serializable]
public class BulletScreenSet: ScriptableObject
{
    public string filePath = string.Empty;

    public BulletShootDirection direction;
    public Vector3 directionVector;

    public Vector3 splitAngle;
    public BulletShootSplitWay splitWay;
    public int splitCount;
    public int splitDelay;

    public Vector3 moveAngle;


    public static Vector3 GetVerticalVector(Vector3 vec)
    {
        if (vec.z == 0)
            return new Vector3(0, 0, -1);

        return new Vector3(-vec.z / vec.x, 0, 1).normalized;
    }

    public static Vector3 GetDirectionVector(Transform trans, BulletShootDirection direc)
    {
        switch (direc)
        {
            case BulletShootDirection.Front:
                return trans.forward;
            case BulletShootDirection.Back:
                return -trans.forward;
            case BulletShootDirection.Up:
                return trans.up;
            case BulletShootDirection.Down:
                return -trans.up;
            case BulletShootDirection.Right:
                return trans.right;
            case BulletShootDirection.Left:
                return -trans.right;
        }
        return Vector3.zero;
    }
}

public enum BulletShootDirection
{
    Front,
    Back,
    Left,
    Right,
    Up,
    Down
}

public enum BulletShootSplitWay
{
    Add,
    Reduce,
    AddAndReduce
}


