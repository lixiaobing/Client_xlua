using UnityEngine;

namespace Battle
{
    public partial class PlayActionEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.PlayAction;
        public string actionName;
    }
}
