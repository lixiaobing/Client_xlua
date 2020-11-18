using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("喊话")]
    [Serializable]
    public class Chat : Action
    {
        //chatId ?
        public int chatId;
        //喊话内容
        public string content;

        public override void OnInspector()
        {

            chatId = Utils.IntField("ChatId",chatId);
            content = Utils.TextField("内容",content);

        }

    }
}