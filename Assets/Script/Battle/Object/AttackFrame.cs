using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
    [System.Serializable]
    public class AttackFrame : ScriptableObject
    {
        public string filePath = string.Empty;

        [Header("【Attack Check Config】"), Space(10)]
        public AttackCheckType attackCheckType = AttackCheckType.None;


        //攻击点
        public Vector3 attackCheckVector = Vector3.zero;
        //优先目标
        public bool attackPriorityTarget = false;
        //攻击半径
        public float attackRadius = 0;

        //攻击范围
        public Vector3 attackRangePosition = Vector3.zero;
        //优先目标
        public bool attackRangeTarget = false;
        //攻击半径
        public float attackRangeRadius = 0;

        //球中心
        public Vector3 attackBallCenter = new Vector3(0, 1, 0);
        //球半径
        public float attackBallRadius = 0;

        //射线起始
        public Vector3 attackRayStart = new Vector3(0, 1, 0);
        //射线结束
        public Vector3 attackRayEnd = new Vector3(0, 1, 3);

        //盒子中心
        public Vector3 attackBoxCenter = new Vector3(0, 1, 1);
        //盒子角度
        public float attackBoxAngle = 0;
        //盒子体积
        public Vector3 attackBoxSize = Vector3.one;

        //扇形原点
        public Vector3 attackSectorPosition = new Vector3(0, 0, 0);
        //扇形朝向
        public float attackSectorDirection = 0;
        //扇形半径
        public float attackSectorRadius = 0;
        //扇形角度
        public float attackSectorAngle = 0;

        //环形中心
        public Vector3 attackRingPosition = new Vector3(0, 0, 0);
        //环形半径(外)
        public float attackRingRadiusMax = 0;
        //环形半径(内)
        public float attackRingRadiusMin = 0;

        //矩形中心
        public Vector3 attackRectCenter = new Vector3(0, 0, 0);
        //矩形旋转角度
        public float attackRectAngle = 0;
        //矩形尺寸
        public Vector3 attackRectSize = new Vector3(0, 0, 0);

        //攻击特效
        public string attackEffectPath = string.Empty;

        //攻击检测延迟时间
        public float attackDelayTime = 0;
        //攻击检测检测时间
        public float attackCheckTime = 0;
        //暂停调试
        public bool debugPause = false;

        public float warningTime = 0;


        [Header("【Be Attacked Config】"), Space(10)]
        //受击
        public string beAttackedAction = string.Empty;
        //受击(空中)
        public string beAttackedActionAir = string.Empty;
        //受击浮空程度
        public float beAttackedFlowUp = 10;
        //受击动作重置
        public bool beAttackedReset = true;

        //命中特效
        //public string hitEffectPath = string.Empty;
        /*
        //特效骨骼
        public BoneNogType hitEffectBoneNog = BoneNogType.None;
        //特效空间
        public bool hitEffectGlobal = false;
        //特效清理
        public bool hitEffectClear = false;
        //特效锁定
        public bool hitEffectLockRotation = false;
        */

        //命中音效
        //public string hitSoundPath = string.Empty;

        [Header("【Freeze Frame Config】"), Space(10)]
        //延迟定帧数
        public int freezeFrameDelay = 0;
        //对方定帧数
        public int freezeFrameTarget = 0;
        //自身定帧数
        public int freezeFrameSelf = 0;
        //对方定帧数(空中)
        //public int freezeFrameTargetAir = 0;
        //自身定帧数(空中)
        //public int freezeFrameSelfAir = 0;

        [Header("【Camera Config】"), Space(10)]
        //相机震动
        public int cameraEffectId = 0;

        /*
        public bool moveToggle = false;
        public float moveSpeed = 1;
        public List<Vector3> movePaths = new List<Vector3>();
        */

    }
}
