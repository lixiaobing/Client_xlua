using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{
    /// <summary>
    /// //////////////////////////////////////条件节点//////////////////////////////////////////////////////
    /// </summary>

    public class AIConditional : AINode
    {


    }
    //角度判定
    public class AICheckAngle : AIConditional { 
    
    
    
    }

    //攻击人数判定
    public class AICheckAttactSize : AIConditional
    {



    }
    //属性判定
    public class AICheckCheckAttr : AIConditional
    {



    }


    //属性判定(百分比)
    public class AICheckAttrPercent : AIConditional
    {



    }
    //判断自身受击
    public class AICheckBeHit : AIConditional
    {



    }

    //是否可以移动
    public class AICheckCanMove : AIConditional
    {



    }
  
    //距离判定
    public class AICheckDistance : AIConditional
    {



    }
    //战斗判定
    public class AICheckFight : AIConditional
    {



    }
    //检查角色数量
    public class AICheckRoleNum : AIConditional
    {



    }
    //技能CD判定(是否可用)
    public class AICheckSkillCountDown : AIConditional
    {



    }
    //状态判定
    public class AICheckState : AIConditional
    {


    }
    //战斗时间判定
    public class AICheckBattleTime : AIConditional
    {



    }
    //检查变量值
    public class AICheckVariable : AIConditional
    {



    }

    //行为树运行时间判定
    public class AICheckRunTime : AIConditional
    {



    }


}