using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BattleBehaviorPack", menuName = "X-Create BattleBehaviorPack")]
[System.Serializable] 
public class BattleBehaviorPack : ScriptableObject
{
    public List<BattleBehaviorField> fields = new List<BattleBehaviorField>();

    public List<BattleBehaviorConfig> list = new List<BattleBehaviorConfig>();
}

[System.Serializable]
public class BattleBehaviorConfig
{
    public int id = 0;

    public string content;
}

[System.Serializable]
public class BattleBehaviorField
{
    public string name;
    public BattleBehaviorFieldType type;
}

public enum BattleBehaviorFieldType
{
    String = 0,
    Int = 1,
    Bool = 2,
}
