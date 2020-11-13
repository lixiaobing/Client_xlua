using UnityEngine;

namespace Battle
{
    public partial class IgnoreCollisionEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.IgnoreCollision;
        public bool toggle;
    }
}
