using UnityEngine;
using Battle;

public static class GameTool
{
    public static MoveCurve ConvertObjectParameterToMoveCurve(AnimationEvent e)
    {
        return e.objectReferenceParameter as MoveCurve;
    }

    public static AttackFrame ConvertObjectParameterToAttackFrame(AnimationEvent e)
    {
        return e.objectReferenceParameter as AttackFrame;
    }
}