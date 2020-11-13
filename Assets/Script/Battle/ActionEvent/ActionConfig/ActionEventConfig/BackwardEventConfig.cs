using UnityEngine;

namespace Battle
{
    public partial class BackwardEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Backward;
        public string filePath;
    }
}
