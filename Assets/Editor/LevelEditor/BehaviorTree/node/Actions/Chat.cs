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

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(chatId), chatId, indent,newLine));
            sb.Append(ExportUtils.KV(nameof(content), content, indent, newLine));
            return sb.ToString();
        }

        public override void OnInspector()
        {

            chatId = Utils.IntField("ChatId",chatId);
            content = Utils.TextField("内容",content);

        }

    }
}