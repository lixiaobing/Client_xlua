using UnityEngine;

namespace Battle
{
    public partial class JumpTwiceEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.JumpTwice;
        public bool toggle;
    }
}
