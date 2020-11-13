using UnityEngine;

namespace Battle
{
    public partial class AttackFlagEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.AttackFlag;
        public Vector3 flagPosition;
        public float flagDirection;
        public float flagTime;
        public float flagRealTime;
        public AttackFlagType flagRange;
        public float flagAngle;
        public float flagRadius;
        public Vector3 flagSize;
    }
}
