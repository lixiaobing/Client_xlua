using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{

    public class ChatConfig : ActionConfig
    {
        //chatId ?
        public int chatId;
        //喊话内容
        public string content;

    }
}