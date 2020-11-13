using UnityEngine;

namespace Battle
{
    public partial class AttackEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Attack;
        public string filePath;
        public string attackGroupTag;
    }
}
