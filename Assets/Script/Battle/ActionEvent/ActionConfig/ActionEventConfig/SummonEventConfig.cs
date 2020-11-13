using UnityEngine;

namespace Battle
{
    public partial class SummonEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Summon;
        public string filePath;
    }
}
