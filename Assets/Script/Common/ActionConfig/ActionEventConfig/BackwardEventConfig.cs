using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Backward", menuName = "X-Create ActionEvent/Event/BackwardEventConfig")]
public class BackwardEventConfig : MoveCurve
{
    public override ActionEventKind kind => ActionEventKind.Backward;

    public string backEventTest = "hello";
}
