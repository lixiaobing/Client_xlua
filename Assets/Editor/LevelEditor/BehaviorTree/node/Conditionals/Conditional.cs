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

        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(breakListen), breakListen, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(breakPriority), breakPriority, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(breakTimes), breakTimes, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(breakProtectTime), breakProtectTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(breakCountDonwTime), breakCountDonwTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(canBreakOther), canBreakOther, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(canBreakSelf), canBreakSelf, indent, newLine));
            return sb.ToString();
        }


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

        /*        public override GUIStyle GetStyle()
                {
                    if (this.Focused())
                    {
                        return Utils.Skin.GetStyle("FocusedNode");
                    }
                    else
                    {
                        return Utils.Skin.GetStyle("ConditionalNode");
                    }

                }*/
        public override Texture2D GetTexture2D()
        {
            return Utils.Textures.textureCondition;
        }
    }
}