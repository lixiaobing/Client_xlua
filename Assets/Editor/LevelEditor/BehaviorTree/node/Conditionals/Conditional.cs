using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("条件节点")]
    [Serializable]
    public class Conditional : Node
    {
        //是否监听
        public bool breakListen  = false;
        //打断优先级
        public int breakPriority = 1;
        //打断次数
        public int breakTimes    =  -1;
        //打断保护时间
        public float breakProtectTime = 0;
        //打断冷却时间
        public float breakCountDonwTime = 1000;

        //能否被别人打断
        public bool canBreakOther = false;
        //能否被自己打断
        public bool canBreakSelf = false;

        public override void OnInspector() {


            breakListen = Utils.Toggle("打断监听",breakListen);
         

            if (breakListen) {
                EditorGUILayout.BeginVertical(GUI.skin.box);
                breakTimes = Utils.IntField("打断次数",breakTimes);
                breakPriority = Utils.IntField("打断优先级", breakPriority);
                breakProtectTime = Utils.FloatField("打断保护时间",breakProtectTime);
                breakCountDonwTime = Utils.FloatField("打断冷却时间", breakCountDonwTime);
                canBreakOther = Utils.Toggle("能否被其他打断", canBreakOther);
                canBreakSelf = Utils.Toggle("能否被自己打断", canBreakSelf);
                EditorGUILayout.EndVertical();
            }
        }

        public override LinkType LinkOutType()
        {
            return LinkType.SINGLE;
        }

        public override LinkType LinkInType()
        {
            return LinkType.SINGLE;

        }

        public override Texture2D GetTexture2D()
        {
            return LGUISkin.Textures.textureCondition;
        }
    }
}