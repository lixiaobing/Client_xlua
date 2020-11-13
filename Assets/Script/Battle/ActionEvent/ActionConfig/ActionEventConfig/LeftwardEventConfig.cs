using UnityEngine;

namespace Battle
{
    public partial class LeftwardEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Leftward;
        public string filePath;
    }
}
