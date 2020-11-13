using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
    [CreateAssetMenu(fileName = "ActionEventPack", menuName = "X-Create ActionEvent/ActionEventPack")]
    public class ActionEventPackConfig : ScriptableObject
    {
        [System.Serializable]
        public class StatePack
        {
            public string stateName;

            public AnimationClip clip;

            public int frameLength;

            public ActionEventConfig[] events;
        }

        public StatePack[] statePacks;
    }
}