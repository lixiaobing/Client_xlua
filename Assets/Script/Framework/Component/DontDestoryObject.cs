using UnityEngine;

namespace Framework
{
    public class DontDestoryObject : MonoBehaviour
    {
        void Awake()
        {
            DontDestroyOnLoad(this);
        }
    }

}
