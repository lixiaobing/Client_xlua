using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("进入攻击")]
    [Serializable]
    public class StartAttack : Decorator
    {
        public override void OnInspector()
        {
            
        }
    }
}