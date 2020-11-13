using UnityEngine;

namespace Battle
{
    public partial class SuperEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Super;
        public bool toggle;
    }
}
