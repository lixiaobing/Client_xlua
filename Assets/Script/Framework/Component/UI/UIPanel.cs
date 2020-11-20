using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Framework
{

    public class UIPanel : MonoBehaviour
    {
        public List<UINodeInfo> nodes = new List<UINodeInfo>();

        public UINodeInfo[] getNodes()
        {
            return nodes.ToArray();
        }
    }

    [System.Serializable]
    public class UINodeInfo
    {
        public Transform transform;
        public string tag = "Node Name";
        public string type = string.Empty;
    }
}