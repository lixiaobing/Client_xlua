using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{


    ////////////////////////////////////////////////
    ///执行节点
    public class AIAction : AINode
    {


    }
    //返回根节点
    public class AIBackRoot : AIAction
    {


    }
    //改变属性百分比
    public class AIChangeAttr : AIAction
    {


    }
    //改变buff
    public class AIChangeBuff : AIAction
    {


    }
    //定义或赋值变量
    public class AIChangeVariable : AIAction
    {


    }
    //喊话
    public class AIChat : AIAction
    {


    }
    //控制触发器
    public class AIControlTrigger : AIAction
    {


    }
    //逃跑
    public class AIEscape : AIAction
    {


    }
    //跟随队长
    public class AIFallow : AIAction
    {


    }
    //待机
    public class AIIdle : AIAction
    {


    }
    //向目标位置移动
    public class AIMove : AIAction
    {


    }



    //指定朝向移动
    public class AIMoveDir : AIAction
    {


    }




    //移动到指定位置
    public class AIMoveTo : AIAction
    {


    }

    //巡逻
    public class AIPatrol : AIAction
    {


    }

    //设置一定范围内的目标的战斗状态
    public class AISetAreaFight : AIAction
    {


    }


    //设置属性(百分比)
    public class AISetAttr : AIAction
    {


    }


    //设置战斗状态
    public class AISetFight : AIAction
    {


    }
    //TimeScale
    public class AITimeScale : AIAction
    {


    }

    //触发BUFF
    public class AITriggerBuff : AIAction
    {


    }
    //释放技能
    public class UseSkill : AIAction
    {


    }


}