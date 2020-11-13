using UnityEngine;

namespace Battle
{
    public partial class BulletEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Bullet;
        public Vector3 bulletShootPosition;
        public Vector3 bulletShootDirection;
        public int bulletId;
        public int bulletCount;
        public int bulletInterval;
    }
}
