using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "AnimationNamePack", menuName = "X-Create AnimationNamePack")]
[System.Serializable]
public class AnimationNamePack : ScriptableObject
{
    public List<string> names = new List<string>();
}
