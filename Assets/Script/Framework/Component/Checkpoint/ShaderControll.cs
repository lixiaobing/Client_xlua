using UnityEditor;
using UnityEngine;
using UnityEngine.Events;
[DisallowMultipleComponent]
public class ShaderControll : MonoBehaviour
{
    public enum State
    {
        SlowStart = 0,
        SlowStop  = 1,
        Stop      = 2,
        Start     = 3,
        Free      = 4, //不受控制
    }
    public string uid;
    public State state = State.SlowStart;
    public virtual void SetActive(bool active) { 
       
    }
    public virtual void SetState(State state) {
        this.state = state;
    }
    public virtual void SetState(int state)
    {
        this.state = (State)state;
    }
}
