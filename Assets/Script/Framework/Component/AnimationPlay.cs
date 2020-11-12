using UnityEditor;
using UnityEngine;
using UnityEngine.Events;

public class AnimationPlay : MonoBehaviour
{
    ParticleSystem[] particles;
    Animation[] animations;
    Animator animator;
    bool bSimulate = false;
    bool bInit = false;

    float maxDuration = 1;
    private void Awake()
    {
        this.Initlize();
    }

    private void Initlize() {
        if (!bInit) {
            bInit = true;
            particles  = gameObject.GetComponentsInChildren<ParticleSystem>();
            animations = gameObject.GetComponentsInChildren<Animation>();
            animator  = gameObject.GetComponent<Animator>();
            this.CalculationDuration();
        }
    }


    public void CalculationDuration()
    {

        maxDuration = 1;
        foreach (ParticleSystem ps in particles)
        {
                float dunration = 0f;
                if (ps.emissionRate <= 0)
                {
                      dunration = ps.startDelay + ps.startLifetime;
                }
                else
                {
                    dunration = ps.startDelay + Mathf.Max(ps.duration, ps.startLifetime);
                }
                if (dunration > maxDuration)
                {
                    maxDuration = dunration;
                }
        }
        //Debug.Log("maxDuration:" + maxDuration);
  
    }


    public void Simulate()
    {
        this.Initlize();
        if (particles != null)
        {
            if (!bSimulate) {
                for (int i = 0; i < particles.Length; i++)
                {
                    ParticleSystem ps = particles[i];
                    ps.Simulate((float)maxDuration / 2);
                }
                bSimulate = true; //只执行一次忒 尼玛卡了
            }
        }
        if (animator != null) {

            animator.Update(Time.deltaTime);
        }

      
        /*        if (animations != null)
                {
                    for (int i = 0; i < animations.Length; i++)
                    {
                        Animation anim = animations[i];
                        anim.Sample();

                    }
                }*/

    }


    public void Play()
    {
        if (particles != null)
        {
            for (int i = 0; i < particles.Length; i++)
            {
                ParticleSystem ps = particles[i];
                if (ps != null)
                {
                    ps.Play();
                }
            }
        }
        if (animations != null)
        {
            for (int i = 0; i < animations.Length; i++)
            {
                Animation anim = animations[i];
                if (anim != null)
                {
                    anim.Play();
                    string name = anim.clip.name;
                    anim[name].speed = 1;
                }
            }
        }

    }

}

