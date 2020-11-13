using UnityEngine;

namespace Battle
{
    public partial class UserStateEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.UserState;
        public bool toggle;
        public string content;
        public bool isClear;
    }
}
