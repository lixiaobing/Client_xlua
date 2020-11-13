using UnityEngine;

namespace Battle
{
    public partial class ChangeWindowEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.ChangeWindow;
        public bool toggle;
    }
}
