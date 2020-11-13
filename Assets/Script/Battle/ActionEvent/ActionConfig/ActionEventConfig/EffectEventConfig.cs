using UnityEngine;

namespace Battle
{
    public partial class EffectEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Effect;
        public string filePath;
    }
}
