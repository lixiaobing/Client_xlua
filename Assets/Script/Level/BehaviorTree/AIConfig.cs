#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using hjcd.level;
using System;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    public class AIConfig : ScriptableObject 
    {
        //行为树编号
        public int id = 0;
        //行为树编号
        public string name = "";
        //日志输出
        public bool debug = false;
        //变量列表
        public List<Variable> variables = new List<Variable>();
        //节点列表
        public List<ScriptableObject> nodes = new List<ScriptableObject>();

    }
}
#endif