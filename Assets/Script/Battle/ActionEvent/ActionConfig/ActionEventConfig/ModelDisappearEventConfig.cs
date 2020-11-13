using UnityEngine;

namespace Battle
{
    public partial class ModelDisappearEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.ModelDisappear;
        public bool toggle;
    }
}
