
using UnityEngine;

namespace Battle
{
    [CreateAssetMenu(fileName = "BattlePowerCurveSet", menuName = "X-Create BattlePowerCurveSet")]
    [System.Serializable]
    public class BattlePowerCurveSet : ScriptableObject
    {
        public AnimationCurve curve;
    }

}

