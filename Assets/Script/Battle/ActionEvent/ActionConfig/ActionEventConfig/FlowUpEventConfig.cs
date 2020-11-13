using UnityEngine;

namespace Battle
{
    public partial class FlowUpEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.FlowUp;
        public bool toggle;
        public float flowUpPower;
    }
}
