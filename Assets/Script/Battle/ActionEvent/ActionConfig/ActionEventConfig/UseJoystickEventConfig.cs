using UnityEngine;

namespace Battle
{
    public partial class UseJoystickEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.UseJoystick;
        public bool toggle;
        public float moveSpeed;
    }
}
