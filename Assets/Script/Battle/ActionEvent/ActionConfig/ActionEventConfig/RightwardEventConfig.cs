using UnityEngine;

namespace Battle
{
    public partial class RightwardEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Rightward;
        public string filePath;
    }
}
