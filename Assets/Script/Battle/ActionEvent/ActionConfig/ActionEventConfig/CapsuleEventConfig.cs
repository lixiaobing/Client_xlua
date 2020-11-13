using UnityEngine;

namespace Battle
{
    public partial class CapsuleEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Capsule;
        public bool toggle;
        public Vector3 capsuleCenter;
        public float capsuleRadius;
        public float capsuleHeight;
    }
}
