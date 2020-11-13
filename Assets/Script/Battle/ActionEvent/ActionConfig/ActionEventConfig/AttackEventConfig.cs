using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttackEventConfig : ActionEventConfig
{
    public override ActionEventKind kind => ActionEventKind.Attack;
    public string filePath;
    public string attackGroupTag;
}
