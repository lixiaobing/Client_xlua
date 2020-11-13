using UnityEngine;

namespace Battle
{
    public partial class SceneDarkEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.SceneDark;
        public bool toggle;
    }
}
