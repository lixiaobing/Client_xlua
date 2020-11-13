using UnityEngine;

namespace Battle
{
    public partial class BulletScreenEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.BulletScreen;
        public int bulletScreenId;
        public Vector3 bulletScreenPosition;
    }
}
