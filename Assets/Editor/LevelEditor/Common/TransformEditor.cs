using UnityEngine;
using UnityEditor;
using System;

[CustomEditor(typeof(Transform)), CanEditMultipleObjects]
public class TransformEditor : DecoratorEditor
{
    public TransformEditor() : base("TransformInspector") {}

    [NonSerialized]
    private Transform transform;
    [NonSerialized]
    private Vector3 startPostion = Vector3.zero;
    [NonSerialized]
    private Vector3 startRotation = Vector3.zero;
    [NonSerialized]
    private Vector3 startScale = Vector3.zero;

    void OnEnable()
    {
        transform = target as Transform;
        startPostion = transform.localPosition;
        startRotation = transform.localRotation.eulerAngles;
        startScale = transform.localScale;
    }
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
        if (Application.isEditor)
        {
            if (startPostion != transform.localPosition || startRotation != transform.localRotation.eulerAngles || startScale != transform.localScale)
            {
                if (TransformChange.onChange != null)
                {
                    TransformChange.onChange.Invoke(this.transform);
                }
                startPostion = transform.localPosition;
                startRotation = transform.localRotation.eulerAngles;
                startScale = transform.localScale;
            }
        }
    }
}