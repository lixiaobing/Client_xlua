using UnityEngine;

namespace Battle
{
    public partial class LookTargetEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.LookTarget;
        public float lookTargetSpeed;
        public float lookTargetTime;
        public float lookTargetRealTime;
    }
}
