using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
    [CreateAssetMenu(fileName = "CameraEffectSet", menuName = "X-Create CameraEffectSet")]
    [System.Serializable]
    public class CameraEffectSet : ScriptableObject
    {
        public List<CameraEffectTemplate> templates = new List<CameraEffectTemplate>();

        public CameraEffectTemplate GetTemplateById(int id)
        {
            foreach (var item in templates)
            {
                if (item.id == id)
                {
                    return item.Clone() as CameraEffectTemplate;
                }
            }
            return null;
        }

        public static string GetTemplateTypeName(CameraEffectType type)
        {
            return type.ToString();
        }
    }

    [System.Serializable]
    public class CameraEffectTemplate
    {
        public object Clone()
        {
            return this.MemberwiseClone();
        }

        public int id;

        public string name;

        public CameraEffectType type;

        public float time;

        public float range;

        public int count;

        public bool random;

        public float intensity;

        public float offset;

        public string mode;

        public float filter;
    }

    [System.Serializable]
    public enum CameraEffectType
    {
        None,
        Zoom,
        Horizontal,
        Vertical,
        AllRound,
        RadialBlur,
    }

}