using UnityEngine;

namespace Battle
{
    public partial class BehaviorTagEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.BehaviorTag;
        public string content;
    }
}
