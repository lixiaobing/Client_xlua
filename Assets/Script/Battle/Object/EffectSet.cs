using UnityEngine;

namespace Battle
{
    [CreateAssetMenu(fileName = "EffectSet Name", menuName = "X-Create EffectSet")]
    [System.Serializable]
    public class EffectSet : ScriptableObject
    {
        public GameObject prefab = null;

        public string prefabPath = string.Empty;

        public float customLifeTime = 0;

        public float customSpeed = 1;

        public bool canChangeSpeed = true;

        public Vector3 angle = Vector3.zero;

        public Vector3 scale = Vector3.one;

        public BoneNogType boneNog = BoneNogType.None;

        public bool isGlobal = false;

        public bool isClear = false;

        public bool isLock = false;

        public bool isDebug = false;

        public GameObject debugObject = null;
    }
}
