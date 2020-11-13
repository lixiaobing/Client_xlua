using UnityEngine;

namespace Battle
{
    public partial class RushWindowEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.RushWindow;
        public bool toggle;
    }
}
