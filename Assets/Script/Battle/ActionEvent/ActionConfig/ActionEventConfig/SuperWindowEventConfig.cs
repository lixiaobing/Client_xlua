using UnityEngine;

namespace Battle
{
    public partial class SuperWindowEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.SuperWindow;
        public bool toggle;
    }
}
