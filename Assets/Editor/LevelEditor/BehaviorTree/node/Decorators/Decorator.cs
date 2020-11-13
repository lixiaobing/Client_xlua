using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("包装节点")]
    [Serializable]
    public class Decorator : Node
    {
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
                        return LGUISkin.Skin.GetStyle("FocusedNode");
                    }
                    else
                    {
                        return LGUISkin.Skin.GetStyle("DecoratorsNode");
                    }

                }*/
        public override Texture2D GetTexture2D()
        {
            return LGUISkin.Textures.textureDecorators;
        }
    }
}