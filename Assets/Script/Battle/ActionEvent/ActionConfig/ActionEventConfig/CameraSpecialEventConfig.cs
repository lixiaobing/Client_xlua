using UnityEngine;

namespace Battle
{
    public partial class CameraSpecialEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.CameraSpecial;
        public bool toggle;
    }
}
