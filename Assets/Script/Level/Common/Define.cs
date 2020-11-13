using UnityEngine;

namespace hjcd.level {

    //关系运算
    public enum RelationalOperator
    {
        [EnumDescription("等于")]
        EQUAL = 0,  //等于
        [EnumDescription("小于")]
        LESS_THAN = 1, //小于
        [EnumDescription("大于")]
        GREATER_THAN = 2, //大于
        [EnumDescription("不等于")]
        NOT_EQUAL = 3, //不等于
        [EnumDescription("大于等于")]
        GREATER_THAN_OR_EQUAL = 4,  //大于等于
        [EnumDescription("小于等于")]
        LESS_THAN_OR_EQUAL = 5, //小于等于
    }
    //逻辑运算 + - * /
    public enum ArithmeticOperator
    {
        [EnumDescription("加")]
        ADD = 0,//加
        [EnumDescription("减")]
        REDUCE = 1,//减
        [EnumDescription("乘")]
        MULTIPLICATION = 2,//乘
        [EnumDescription("除")]
        EXCEPT = 3,//除
    }

    //简单逻辑运算 + - * /
    public enum SimpleArithmeticOperator
    {
        [EnumDescription("增加")]
        ADD   = 0,//加
        [EnumDescription("减少")]
        REDUCE = 1,//减
        [EnumDescription("赋值")]
        ASSIGNMENT = 2, //赋值 
    }

    //对象操作
    public enum TargetOperator
    {
        [EnumDescription("添加")]
        ADD = 0, //添加
        [EnumDescription("移除")]
        REMOVE = 1, //移除
    }


    // 所有属性
    public enum Attr
    {
        [EnumDescription("HP")]
        HP = 101,
        [EnumDescription("ARMOR")]
        ARMOR = 102,
    }

    // 有上限的属性
    public enum AttrPercent
    {
        [EnumDescription("HP")]
        HP = 101,
    }



    public enum LogicalOperator
    {
        [EnumDescription("逻辑与")]
        AND = 1,  
        [EnumDescription("逻辑或")]
        OR  = 2,  
    };
    //目标选择(关卡编辑器使用的)
    public enum SelectTargetType
    {
        [EnumDescription("任意玩家")]
        ANY_PLAYER = 1,
        [EnumDescription("任意怪物")]
        ANY_MONSTER = 2,
        [EnumDescription("指定玩家")]
        DESIGNATE_PLAYER = 3,
        [EnumDescription("指定怪物")]
        DESIGNATE_MONSTER = 4,
    };

    public enum SelectTargetType2
    {
        [EnumDescription("任意玩家")]
        ANY_PLAYER = 1,
        [EnumDescription("任意怪物")]
        ANY_MONSTER = 2,
        [EnumDescription("指定玩家")]
        DESIGNATE_PLAYER = 3,
        [EnumDescription("指定怪物")]
        DESIGNATE_MONSTER = 4,
        [EnumDescription("自己")]
        SELF = 5,
        [EnumDescription("队长")]
        LEADER = 6,
        [EnumDescription("自定")]
        CUSTOM = 7,
    };

    //角色状态
    public enum RoleState
    {
        [EnumDescription("待机")]
        IDLE = 1,
        [EnumDescription("移动")]
        RUN = 2,
        [EnumDescription("攻击")]
        ATTACK =3,
        [EnumDescription("受击")]
        HIT =4,
        [EnumDescription("闪避")]
        RUSH = 5,
    }

    //关卡分组类型
    public enum LevelGroupType
    {
        [EnumDescription("默认分组")]
        GROUP_1 = 1,
        [EnumDescription("其他分组")]
        GROUP_2 = 2,
    };

    //触发器执行类型
    public enum TriggerExecutType
    {
        [EnumDescription("顺序")]
        SEQUENCE = 1, 
        [EnumDescription("并行")]
        PARALLEL = 2, 
        [EnumDescription("随机")]
        RANDOM = 3,
    };

    //战斗结果
    public enum BattleResultType
    {

        [EnumDescription("胜利")]
        VICTORY = 1,
        [EnumDescription("失败")]
        LOSE = 2,
        [EnumDescription("平局")]
        PEACE= 3,
  
    }


    //触发区域类型
    public enum AreaType
    {

        [EnumDescription("立方体")]
        CUBE = 1,
        [EnumDescription("球体")]
        SPHERE = 2,

    }

    //单位攻击类型
    public enum AttackType
    {

        [EnumDescription("所有")]
        ALL = 0,
        [EnumDescription("近程")]
        SHORT_RANG = 1,
        [EnumDescription("远程")]
        LONG_RANG  = 2,
    }

    //开关
    public enum SwitchType
    {
        [EnumDescription("打开")]
        ON = 0,  
        [EnumDescription("关闭")]
        OFF = 1,
        [EnumDescription("关闭一段时间")]
        OFF_TIME = 2, 

    }

    //摄像机视角类型
    public enum CameraMode
    {
        [EnumDescription("常规")]
        NORMAL = 0,
        [EnumDescription("侧面")]
        SIDE = 1,
        [EnumDescription("顶视")]
        TOP = 2,

    }

    //移动方向
    public enum Dir
    {
        [EnumDescription("向前")]
        FRONT = 0,//向前
        [EnumDescription("向后")]
        BACK = 1,//向后
        [EnumDescription("向左")]
        LEFT = 2,//向左
        [EnumDescription("向右")]
        RIGHT = 3,//向右
    }
    //阵营
    public enum Camp 
    {
        [EnumDescription("友方")]
        FRIEND  = 0,//友方
        [EnumDescription("敌方")]
        ENEMY  = 1,//敌方
        [EnumDescription("中立")]
        NEUTRAL  = 2,//中立
        [EnumDescription("所有")]
        ALL = 3,//所有

    }
    //目标状态
    public enum TargetState
    {
        [EnumDescription("血量最低")]
        HP_MIN = 0,
        [EnumDescription("血量最高")]
        HP_MAX = 1,
        [EnumDescription("距离最近")]
        NEAREST = 2,
        [EnumDescription("距离最远")]
        FURTHEST  = 3,
        [EnumDescription("非战斗状态")]
        NOT_FIGHT = 4,

    }

    //移动类型
    public enum MoveType
    {
        [EnumDescription("走")]
        WALK = 0,
        [EnumDescription("跑")]
        RUN = 1,

    }

    public enum RoleFightState
    {
        [EnumDescription("战斗状态")]
        FIGHT = 0,
        [EnumDescription("非战斗")]
        NOT_FIGHT = 1,
        [EnumDescription("所有")]
        ALL = 2,
  

    }


    //任务状态
    public enum TaskStatus
    {
        [EnumDescription("未开始(没有接取)")]
        None = 0,
        [EnumDescription("进行中(已接取)")]
        Accepted = 1,
        [EnumDescription("完成(已提交任务)")]
        Done = 2,
    }

//Shader类型
    public enum ShaderType
    {
        [EnumDescription("Unkonw")] 
        Unkonw = 0,
        [EnumDescription("WallFlow")]
        WallFlow = 1,
        [EnumDescription("Door")]
        Door = 2,
    }
    public enum UVAnimaitonState
    {
        [EnumDescription("SlowStart")]
        SlowStart = 0,
        [EnumDescription("SlowStop")]
        SlowStop  = 1,
        [EnumDescription("Stop")]
        Stop      = 2,
        [EnumDescription("Start")]
        Start     = 3,
    }

    public enum AudioType
    {
        [EnumDescription("背景音乐")]
        BackgroundMusic = 0,  
        [EnumDescription("音效")]
        Sound = 1,
        [EnumDescription("语言")]
        Voice = 2, 
    }

    public enum VariableChangeType
    {
        [EnumDescription("无")]
        None = 0,
        [EnumDescription("自增")]
        Auto = 1,
    }


    //打断类型
    public enum AbortType
    {
        [EnumDescription("无")]
        None = 0, 
        [EnumDescription("自己")]//打断自己的直接子节点
        Self = 1, 
        [EnumDescription("低优先级")]
        LowerPriority = 2, 
        [EnumDescription("全部")]
        Both = 3, 
    }

    //关卡平台删除类型
    public enum PlatformDeleteType
    {
        [EnumDescription("不删除")]
        None = 0,
        [EnumDescription("自动删除")]
        Auto = 1,
        [EnumDescription("玩家接触删除")]
        Touch = 2,

    }

    //关卡平台移动类型
    public enum PlatformMoveType
    {
        [EnumDescription("固定")]
        Fixed = 0,
        [EnumDescription("循环")]
        Loop = 1,

    }
}

