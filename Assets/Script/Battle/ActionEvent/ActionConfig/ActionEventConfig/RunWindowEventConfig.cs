using UnityEngine;

namespace Battle
{
    public partial class RunWindowEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.RunWindow;
        public bool toggle;
    }
}
