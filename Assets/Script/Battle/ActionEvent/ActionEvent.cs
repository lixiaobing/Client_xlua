using System;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;

namespace Battle
{
    [System.Serializable]
    public class ActionEvent : ICloneable
    {
        public object Clone()
        {
            return this.MemberwiseClone();
        }

        static ActionEvent()
        {
            string [] types = System.Enum.GetNames(typeof(ActionEventKind));
            // 总数去掉一个None
            MaxType = types.Length - 1;
        }

        public static readonly int MaxType;

        public ActionEventKind _type;
        public ActionEventKind type { get => _type; set => _type = value; }


        public long _addTime;
        public long addTime { get => _addTime; set => _addTime = value; }


        public float _time;
        public float time { get => _time; set => _time = value; }


        public float _realTime;
        public float realTime { get => _realTime; set => _realTime = value; }


        public float _endTime;
        public float endTime { get => _endTime; set => _endTime = value; }


        public float _endRealTime;
        public float endRealTime { get => _endRealTime; set => _endRealTime = value; }


        public int _frame;
        public int frame { get => _frame; set => _frame = value; }


        public bool _toggle = false;
        public bool toggle { get => _toggle; set => _toggle = value; }


        public string _content = string.Empty;
        public string content { get => _content; set => _content = value; }


        public UnityEngine.Object _file;
        public UnityEngine.Object file { get => _file; set => _file = value; }


        public string _filePath = string.Empty;
        public string filePath { get => _filePath; set => _filePath = value; }


        public bool _isClear = false;
        public bool isClear { get => _isClear; set => _isClear = value; }


        public bool _lockRotation = false;
        public bool lockRotation { get => _lockRotation; set => _lockRotation = value; }


        public float _volume;
        public float volume { get => _volume; set => _volume = value; }

        public bool _mute;
        public bool mute { get => _mute; set => _mute = value; }


        public Vector3 _bulletShootPosition;
        public Vector3 bulletShootPosition { get => _bulletShootPosition; set => _bulletShootPosition = value; }


        public Vector3 _bulletShootDirection;
        public Vector3 bulletShootDirection { get => _bulletShootDirection; set => _bulletShootDirection = value; }


        public int _bulletId;
        public int bulletId { get => _bulletId; set => _bulletId = value; }


        public int _bulletCount;
        public int bulletCount { get => _bulletCount; set => _bulletCount = value; }


        public int _bulletInterval;
        public int bulletInterval { get => _bulletInterval; set => _bulletInterval = value; }


        public int _bulletScreenId;
        public int bulletScreenId { get => _bulletScreenId; set => _bulletScreenId = value; }


        public Vector3 _bulletScreenPosition;
        public Vector3 bulletScreenPosition { get => _bulletScreenPosition; set => _bulletScreenPosition = value; }


        public Vector3 _trapPosition;
        public Vector3 trapPosition { get => _trapPosition; set => _trapPosition = value; }


        public Vector3 _trapDirection;
        public Vector3 trapDirection { get => _trapDirection; set => _trapDirection = value; }


        public int _trapId;
        public int trapId { get => _trapId; set => _trapId = value; }


        public Vector3 _capsuleCenter;
        public Vector3 capsuleCenter { get => _capsuleCenter; set => _capsuleCenter = value; }


        public float _capsuleRadius;
        public float capsuleRadius { get => _capsuleRadius; set => _capsuleRadius = value; }


        public float _capsuleHeight;
        public float capsuleHeight { get => _capsuleHeight; set => _capsuleHeight = value; }


        public Vector3 _cameraPosition;
        public Vector3 cameraPosition { get => _cameraPosition; set => _cameraPosition = value; }


        public Vector3 _cameraAngle;
        public Vector3 cameraAngle { get => _cameraAngle; set => _cameraAngle = value; }


        public float _cameraSmooth;
        public float cameraSmooth { get => _cameraSmooth; set => _cameraSmooth = value; }


        public int _cameraEffectId;
        public int cameraEffectId { get => _cameraEffectId; set => _cameraEffectId = value; }


        public float _flowUpPower;
        public float flowUpPower { get => _flowUpPower; set => _flowUpPower = value; }


        public float _timeScale;
        public float timeScale { get => _timeScale; set => _timeScale = value; }


        public string _actionName = string.Empty;
        public string actionName { get => _actionName; set => _actionName = value; }


        public float _moveSpeed;
        public float moveSpeed { get => _moveSpeed; set => _moveSpeed = value; }


        public Vector3 _flagPosition;
        public Vector3 flagPosition { get => _flagPosition; set => _flagPosition = value; }


        public float _flagDirection;
        public float flagDirection { get => _flagDirection; set => _flagDirection = value; }


        public float _flagTime;
        public float flagTime { get => _flagTime; set => _flagTime = value; }


        public float _flagRealTime;
        public float flagRealTime { get => _flagRealTime; set => _flagRealTime = value; }


        public AttackFlagType _flagRange;
        public AttackFlagType flagRange { get => _flagRange; set => _flagRange = value; }


        public float _flagAngle;
        public float flagAngle { get => _flagAngle; set => _flagAngle = value; }


        public float _flagRadius;
        public float flagRadius { get => _flagRadius; set => _flagRadius = value; }


        public Vector3 _flagSize;
        public Vector3 flagSize { get => _flagSize; set => _flagSize = value; }


        public BoneNogType _boneNogType;
        public BoneNogType boneNogType { get => _boneNogType; set => _boneNogType = value; }


        public bool _isGlobalSpace;
        public bool isGlobalSpace { get => _isGlobalSpace; set => _isGlobalSpace = value; }


        public float _spaceTime;
        public float spaceTime { get => _spaceTime; set => _spaceTime = value; }


        public float _spaceRealTime;
        public float spaceRealTime { get => _spaceRealTime; set => _spaceRealTime = value; }

        public string _akEventName = string.Empty;
        public string akEventName { get => _akEventName; set => _akEventName = value; }


        public bool _isCustomLifeTime;
        public bool isCustomLifeTime { get => _isCustomLifeTime; set => _isCustomLifeTime = value; }


        public float _customLifeTime;
        public float customLifeTime { get => _customLifeTime; set => _customLifeTime = value; }


        public float _lookTargetSpeed;
        public float lookTargetSpeed { get => _lookTargetSpeed; set => _lookTargetSpeed = value; }


        public float _lookTargetTime;
        public float lookTargetTime { get => _lookTargetTime; set => _lookTargetTime = value; }


        public float _lookTargetRealTime;
        public float lookTargetRealTime { get => _lookTargetRealTime; set => _lookTargetRealTime = value; }


        public string _attackGroupTag;
        public string attackGroupTag { get => _attackGroupTag; set => _attackGroupTag = value; }


        public static ActionEventKind GetActionEventKind(string typeName)
        {
            return (ActionEventKind)System.Enum.Parse(typeof(ActionEventKind), typeName); ;
        }
    }

    public enum ActionEventKind
    {
        None = 0,

        AttackWindow = 15,
        RunWindow = 16,
        RushWindow = 17,
        SkillWindow = 33,
        SuperWindow = 34,
        ChangeWindow = 36,

        Forward = 7,
        Backward = 8,
        Leftward = 28,
        Rightward = 29,

        Attack = 10,
        AttackFlag = 23,
        Armor = 20,

        BehaviorTag = 31,
        Bullet = 11,
        BulletScreen = 12,

        CameraSpecial = 4,
        CameraFix = 5,
        CameraEffect = 6,
        Capsule = 27,

        EffectSave = 1,
        Effect = 38,

        FlowUp = 9,

        IgnoreCollision = 19,

        JumpTwice = 32,

        LookTarget = 30,

        ModelDisappear = 13,

        PlayAction = 21,

        Sound = 2,
        SceneDark = 14,
        SpaceCheck = 22,
        Speedbreaker = 24,
        Super = 25,
        Summon = 37,

        TimeScale = 3,
        Trap = 26,

        UseJoystick = 18,
        UserState = 35,

        Warning = 39,
    }

    public enum AttackCheckType
    {
        None = 0,
        Ring = 1,
        Range = 2,
        Ray = 3,
        Box = 4,
        Rect = 5,
        Sector = 6,
    }

    public enum AttackFlagType
    {
        Range = 2,
        Rect = 1,
        Sector = 0,
    }
}
