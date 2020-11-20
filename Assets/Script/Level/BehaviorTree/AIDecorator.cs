using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{


    /// ///////////////////////////////////////包装节点//////////////////////////////////////////////

    public class AIDecorator : AINode
    {


    }

    public class AIRepeat : AIDecorator
    {


    }

    public class AIReturnFalse : AIDecorator
    {


    }
    public class AIReturnTrue : AIDecorator
    {


    }
    //取反
    public class AIReturnInverse : AIDecorator
    {


    }
    //发动攻击
    public class AIStartAttack : AIDecorator
    {


    }
    //等待节点
    public class AIWait : AIDecorator
    {


    }

}