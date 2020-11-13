using UnityEngine;

namespace Battle
{
    public partial class TimeScaleEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.TimeScale;
        public float timeScale;
    }
}
