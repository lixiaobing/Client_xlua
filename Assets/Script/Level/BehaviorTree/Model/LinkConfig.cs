using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class LinkConfig : ScriptableObject
    {
        public string child;
        //权重
        public int weight = 10;
    }
}
