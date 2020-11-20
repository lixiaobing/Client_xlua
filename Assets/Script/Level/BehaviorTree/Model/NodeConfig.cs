using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{
    public class NodeConfig : ScriptableObject
    {
        public string uuid;
        //策划备注
        [SerializeField]
        public string mark = "";
        //连接线
        public List<LinkConfig> links = new List<LinkConfig>();


    }
}
