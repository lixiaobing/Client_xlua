using UnityEngine;

namespace Battle
{
    public partial class ForwardEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Forward;
        public string filePath;
    }
}
