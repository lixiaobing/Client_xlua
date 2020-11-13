using UnityEngine;

namespace Battle
{
    public partial class SpaceCheckEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.SpaceCheck;
        public bool toggle;
        public float spaceTime;
        public float spaceRealTime;
    }
}
