using UnityEngine;

namespace Battle
{
    public partial class SpeedbreakerEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Speedbreaker;
        public bool toggle;
    }
}
