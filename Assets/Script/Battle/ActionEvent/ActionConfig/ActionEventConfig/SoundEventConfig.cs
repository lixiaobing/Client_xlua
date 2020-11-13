using UnityEngine;

namespace Battle
{
    public partial class SoundEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Sound;
        public float volume;
        public bool mute;
        public string akEventName;
    }
}
