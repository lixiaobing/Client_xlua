using UnityEngine;

namespace Battle
{
    public partial class SkillWindowEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.SkillWindow;
        public bool toggle;
    }
}
