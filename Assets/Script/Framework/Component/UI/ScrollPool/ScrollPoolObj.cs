using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScrollPoolObj : MonoBehaviour {

    private ScrollPool sp;
    private int index = -1;
    private Animator animator;

    private CanvasGroup csg;

    public CanvasGroup canvasGroup
    {
        get {
            if (csg==null)
            {
                csg = GetComponent<CanvasGroup>();
            }

            return csg;
        }
    }

    private void Awake()
    {
        animator = GetComponent<Animator>();
    }

    public void BindScrollPool(ScrollPool scrollPool)
    {
        sp = scrollPool;
    }

    public void ResetIdx(int idx)
    {
        index = idx;
    }

    void OnRectTransformDimensionsChange()
    {
        if (sp && index != -1)
        {
            sp.OnObjSizeChanged(index);
        }
    }

    public void SetAnimationProgress(string cellAnimTarget, float normalizedTime)
    {
        if (animator==null || animator.isActiveAndEnabled == false)
        {
            return;
        }
        
        animator.speed = 0;
        animator.Play(cellAnimTarget,-1, normalizedTime);
        animator.Update(Time.deltaTime);
    }

    public void ResetAnimtor(string cellAnimTarget)
    {
        if (animator==null || animator.enabled == false)
        {
            return;
        }

        animator.enabled = false;
        animator.enabled = true;
        animator.speed = 0;
        animator.Play(cellAnimTarget,-1, 0);
    }
}
