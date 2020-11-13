using UnityEngine;

namespace Battle
{
    public partial class ArmorEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Armor;
        public bool toggle;
    }
}
