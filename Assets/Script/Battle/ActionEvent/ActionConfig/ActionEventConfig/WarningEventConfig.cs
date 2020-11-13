using UnityEngine;

namespace Battle
{
    public partial class WarningEventConfig : ActionEventConfig
    {
        public override ActionEventKind type => ActionEventKind.Warning;
        public float endTime;
        public float endRealTime;
        public string filePath;
    }
}
