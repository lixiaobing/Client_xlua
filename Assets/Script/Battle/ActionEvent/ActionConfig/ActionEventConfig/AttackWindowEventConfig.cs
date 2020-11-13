using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "AttackWindow", menuName = "X-Create ActionEvent/Event/AttackWindow")]
public class AttackWindowEventConfig : ActionEventConfig
{
    public override ActionEventKind kind => ActionEventKind.AttackWindow;

    public bool isClear;
}