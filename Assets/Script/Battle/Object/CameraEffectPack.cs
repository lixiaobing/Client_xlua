using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "CameraEffectPack", menuName = "X-Create CameraEffectPack")]
[System.Serializable]
public class CameraEffectPack : ScriptableObject
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