using System.Collections.Generic;
using UnityEngine;

namespace Framework
{
    [CreateAssetMenu(fileName = "PackagerSet", menuName = "X-Create PackagerSet")]
    [System.Serializable]
    public class PackagerSet : ScriptableObject
    {
        public string version = "1.0";

        public List<ShaderVariantLink> setList = new List<ShaderVariantLink>();
    }

    [System.Serializable]
    public class ShaderVariantLink
    {
        public Shader shaderFile;
        public ShaderVariantCollection variantFile;
    }
}
