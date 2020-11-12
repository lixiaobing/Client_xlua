using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[DisallowMultipleComponent]
public class WallFlow : ShaderControll
{
    [Range(0,0.01f)]
    public float speedChangeValue = 0.004f;
    [Range(0, 1)]
    public float speedPow = 0.3f;
    [Range(0, 1)]
    public float speedMinValue = 0.0f;
    [Range(1, 5)]
    public float speedMaxValue = 5.0f;
    public float speed = 0.0f;
    private Material mat;
    private Vector4 uv;
    public float OffsetAll = 0.0f;

    private void Awake()
    {
        mat = GetComponent<MeshRenderer>().material;
        uv = new Vector4(0,0,0,0);
    }
    private void Update()
    {
        switch (state)
        {
            case State.Stop:
                {
                    speed = 0.0f;
                    break;
                }
            case State.SlowStart:
                {
                    var s = speed  + speedChangeValue;
                    if (s < speedMaxValue)
                    {
                        speed = s;
                    }
                    OffsetAll += speed * Time.deltaTime * speedPow;
                    break;
                }
            case State.SlowStop:
                {
                    var s = speed - speedChangeValue;
                    if (s > speedMinValue)
                    {
                        speed = s;
                    }
                    OffsetAll += speed * Time.deltaTime * speedPow;
                    break;
                }
            case State.Start:
                {
                    speed = speedMinValue;
                    break;
                }
        }
        uv.y = OffsetAll;
        if (state != State.Free)
        {
            mat.SetVector("_SpeedUV", uv);
        }
    }

    public override void SetActive(bool active)
    {
        state = active ? State.SlowStart : State.SlowStop;
    }
}
