using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
namespace hjcd.level.BehaviorTree
{
    [EnumDescription("根节点")]
    [Serializable]
    public class Root : Node
    {
        public override LinkType LinkOutType()
        {
            
            return LinkType.SINGLE;
        }

        public override LinkType LinkInType()
        {
            return LinkType.NONE;
        }


        public override bool CanFocus()
        {
            return false;
        }
        public override Texture2D GetTexture2D()
        {
            return Utils.Textures.textureRoot;
        }
    }
}