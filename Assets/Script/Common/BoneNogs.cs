using System;
using UnityEngine;

public class BoneNogs:MonoBehaviour
{
    public GameObject Head;

    public GameObject _Head
    {
        get { return Head; }
        set { Head = value; }
    }

    public GameObject Center;

    public GameObject _Center
    {
        get { return Center; }
        set { Center = value; }
    }

    public GameObject LeftHand;

    public GameObject _LeftHand
    {
        get { return LeftHand; }
        set { LeftHand = value; }
    }

    public GameObject RightHand;

    public GameObject _RightHand
    {
        get { return RightHand; }
        set { RightHand = value; }
    }

    public GameObject LeftFoot;

    public GameObject _LeftFoot
    {
        get { return LeftFoot; }
        set { LeftFoot = value; }
    }

    public GameObject RightFoot;

    public GameObject _RightFoot
    {
        get { return RightFoot; }
        set { RightFoot = value; }
    }

    public GameObject Weapon;

    public GameObject _Weapon
    {
        get { return Weapon; }
        set { Weapon = value; }
    }

    public GameObject ShootHole;

    public GameObject _ShootHole
    {
        get { return ShootHole; }
        set { ShootHole = value; }
    }

    public GameObject Camera;

    public GameObject _Camera
    {
        get { return Camera; }
        set { Camera = value; }
    }

    public GameObject CameraTarget;

    public GameObject _CameraTarget
    {
        get { return CameraTarget; }
        set { CameraTarget = value; }
    }

    public EffectControll[] bodyEffects;

    public GameObject GetBoneNogByType(BoneNogType tp)
    {
        switch (tp)
        {
            case BoneNogType.Head:
                return Head;
            case BoneNogType.Center:
                return Center;
            case BoneNogType.LeftHand:
                return LeftHand;
            case BoneNogType.RightHand:
                return RightHand;
            case BoneNogType.LeftFoot:
                return LeftFoot;
            case BoneNogType.RightFoot:
                return RightFoot;
            case BoneNogType.Weapon:
                return Weapon;
            case BoneNogType.ShootHole:
                return ShootHole;
            case BoneNogType.Camera:
                return Camera;
            case BoneNogType.CameraTarget:
                return CameraTarget;
            default:
                return null;
        }
    }

    public GameObject GetBoneNogById(int tp)
    {
        string tpName = Enum.GetName(typeof(BoneNogType), tp);
        BoneNogType tps = GetBoneNogTypeByName(tpName);
        return GetBoneNogByType(tps);
    }

    public static BoneNogType GetBoneNogTypeByName(string tpName)
    {
        BoneNogType boneType = BoneNogType.None;
        string[] types = Enum.GetNames(typeof(BoneNogType));
        for (int i = 0; i < types.Length; i++)
        {
            if (types[i] == tpName)
            {
                boneType = (BoneNogType)i;
            }
        }
        return boneType;
    }

}

public enum BoneNogType
{
    None,
    Head,
    Center,
    LeftHand,
    RightHand,
    LeftFoot,
    RightFoot,
    Weapon,
    ShootHole,

    Camera,
    CameraTarget
}