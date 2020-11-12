using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[DisallowMultipleComponent]
public class Door : ShaderControll
{
    private Material mat;
    private const float maxClip = 1f;
    private const float minClip = 0f;
    [Range(0.5f, 1f)]
    public float changeValue = 0.5f;
    [Range(0, 1)]
    public float clip = 0.0f;

    private void Awake()
    {
        mat = GetComponent<MeshRenderer>().material;
    }

    private void Update()
    {
        switch (state)
        {
            case State.Start:
                {
                    clip = 0f;
                    break;
                }
            case State.Stop:
                {
                    clip = 1f;
                    break;
                }
            case State.SlowStart:
                {
                    if (clip > minClip) {
                        clip -= Time.deltaTime * changeValue;
                        clip = clip < minClip ? minClip : clip;
                    }
   
                    break;
                }
            case State.SlowStop:
                {
                    if (clip < maxClip) {
                        clip += Time.deltaTime * changeValue;
                        clip = clip > maxClip ? maxClip : clip;
                    }
                
                    break;
                }
        }
        if (state != State.Free) {
            mat.SetFloat("_Clip", clip);
        }
    }

    public override void SetActive(bool active)
    {
        state = active ? State.SlowStart : State.SlowStop;
    }
}
