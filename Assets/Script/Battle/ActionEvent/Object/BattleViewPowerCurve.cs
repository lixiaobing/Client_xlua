
using UnityEngine;

namespace Battle
{
    [CreateAssetMenu(fileName = "BattleViewPowerCurve", menuName = "X-Create BattleViewPowerCurve")]
    [System.Serializable]
    public class BattleViewPowerCurve : ScriptableObject
    {
        public AnimationCurve curve;
    }
}

