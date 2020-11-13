using UnityEngine;

namespace Battle
{
    public partial class TrapEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Trap;
        public Vector3 trapPosition;
        public Vector3 trapDirection;
        public int trapId;
    }
}
