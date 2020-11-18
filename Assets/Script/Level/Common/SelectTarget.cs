using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level {



    [SerializeField]
    public class SelectTarget
    {
        public SelectTargetType selectTargetType = SelectTargetType.ANY_PLAYER;
        public int targetId;
    }
}