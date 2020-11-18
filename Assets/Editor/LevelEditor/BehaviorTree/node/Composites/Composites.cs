using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;
using System.Text;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("复合节点")]
    [Serializable]
    public class Composites : Node
    {


        // 打断类型
        public AbortType abortType = AbortType.None;

        public override LinkType LinkOutType()
        {
            return LinkType.MULTIPLE;
        }

        public override LinkType LinkInType()
        {
            return LinkType.SINGLE;

        }
/*        public override GUIStyle GetStyle()
        {
            if (this.Focused())
            {
                return LGUISkin.Skin.GetStyle("FocusedNode");
            }
            else
            {
                return LGUISkin.Skin.GetStyle("CompositeNode");
            }

        }*/


    }
}