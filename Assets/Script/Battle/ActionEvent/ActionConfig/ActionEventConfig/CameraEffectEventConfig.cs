using UnityEngine;

namespace Battle
{
    public partial class CameraEffectEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.CameraEffect;
        public int cameraEffectId;
    }
}
