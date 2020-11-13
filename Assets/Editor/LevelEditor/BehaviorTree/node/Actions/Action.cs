using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
namespace hjcd.level.BehaviorTree
{
    [EnumDescription("执行节点")]
    [Serializable]
    public class Action : Node
    {
        public override LinkType LinkOutType()
        {
            return LinkType.NONE;
        }

        public override LinkType LinkInType()
        {
            return LinkType.SINGLE;

        }
        public override Texture2D GetTexture2D()
        {
            return LGUISkin.Textures.textureAction;
        }

        /*        public override GUIStyle GetStyle()
                {
                    if (this.Focused())
                    {
                        return LGUISkin.Skin.GetStyle("FocusedNode");
                    }
                    else
                    {
                        return LGUISkin.Skin.GetStyle("ActionNode");
                    }

                }*/

    }
}