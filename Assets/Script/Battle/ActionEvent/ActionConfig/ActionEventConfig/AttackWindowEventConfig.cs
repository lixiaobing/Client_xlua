using UnityEngine;

namespace Battle
{
    public partial class AttackWindowEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.AttackWindow;
        public bool toggle;
        public bool isClear;
    }
}
