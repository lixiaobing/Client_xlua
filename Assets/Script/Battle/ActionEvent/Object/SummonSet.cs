using UnityEngine;
namespace Battle
{
    [CreateAssetMenu(fileName = "SummonSet Name", menuName = "X-Create SummonSet")]
    [System.Serializable]
    public class SummonSet : ScriptableObject
    {
        public GameObject prefab;

        public string path;

        public string luaPath;

        public string controller;

        public string action;

        public int skillId;

        public float lifeTime;

        public bool targetFirst;

        public SummonBornConfig bornTarget;

        public SummonBornConfig bornOwner;
    }

    [System.Serializable]
    public class SummonBornConfig
    {
        public Vector3 position;

        public float angle;

        public float checkRadius;
    }
}
