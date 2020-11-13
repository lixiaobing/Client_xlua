using UnityEngine;

namespace Battle
{
    public partial class CameraFixEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.CameraFix;
        public bool toggle;
        public Vector3 cameraPosition;
        public Vector3 cameraAngle;
        public float cameraSmooth;
    }
}
