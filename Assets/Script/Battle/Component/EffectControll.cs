using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class EffectControll:MonoBehaviour
{
    public EffectPlayType playType = EffectPlayType.Once;

    public float delayTime = 0;
    public float runDelayTime = 0;

    public float lifeTime = 1f;
    public float runLifeTime = 0;

    [HideInInspector]
    public string path;

    [HideInInspector]
    public bool controllSpeed = true;

    ParticleSystem[] particles;
    Animation[] animations;
    Animator[] animators;
    TrailRenderer[] renders;
    Animation mainAnimation;

    [HideInInspector]
    public UnityEvent onFinished = new UnityEvent();

    private float playSpeed = 1f;
    private float customSpeed = 1f;

    private bool isPlaying = false;

    private bool lockRotation = false;
    private Quaternion lockRotationValue;
    //private AkAmbient m_btnAkEvent;

    private void Awake()
    {
        particles = gameObject.GetComponentsInChildren<ParticleSystem>();
        animations = gameObject.GetComponentsInChildren<Animation>();
        animators = gameObject.GetComponentsInChildren<Animator>();
        renders = gameObject.GetComponentsInChildren<TrailRenderer>();
        mainAnimation = gameObject.GetComponent<Animation>();
        //m_btnAkEvent = gameObject.GetComponent<AkAmbient>();
    }

    private void Start()
    {
        if (delayTime > 0)
        {
            Pause();
        }

        runDelayTime = 0;
        runLifeTime = 0;
    }

    private void LateUpdate()
    {
        if (lockRotation)
        {
            this.transform.rotation = lockRotationValue;
        }
        
        if (playType == EffectPlayType.Once)
        {
            if (runDelayTime < delayTime)
            {
                runDelayTime += Time.deltaTime * playSpeed * customSpeed;
                if (runDelayTime >= delayTime)
                {
                    Play();
                }
            }

            if (isPlaying)
            {
                runLifeTime += Time.deltaTime * playSpeed * customSpeed;
                if (runLifeTime >= lifeTime)
                {
                    onFinished.Invoke();
                }
            }
        }
    }

    public void Play()
    {
        isPlaying = true;

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
                if (anim!=null && anim.clip!=null)
                {
                    anim.Play();
                    string name = anim.clip.name;
                    anim[name].speed = 1;
                }
            }
        }

        if (animators != null)
        {
            for (int i = 0; i < animators.Length; i++)
            {
                Animator anim = animators[i];
                if (anim != null)
                {
                    anim.speed = 1;
                }
            }
        }

        if (renders != null)
        {
            for (int i = 0; i < renders.Length; i++)
            {
                TrailRenderer render = renders[i];
                render.Clear();
            }
        }

        //sound
        //if (m_btnAkEvent != null)
        //{
        //    m_btnAkEvent.HandleEvent(gameObject);
        //}
    }

    public void PlayAnimation(string clipName)
    {
        if (mainAnimation)
        {
            mainAnimation.Play(clipName);
        }
    }

    public void Pause()
    {
        isPlaying = false;

        if (particles != null)
        {
            for (int i = 0; i < particles.Length; i++)
            {
                ParticleSystem ps = particles[i];
                if (ps != null)
                {
                    ps.Pause();
                }
            }
        }

        if (animations != null)
        {
            for (int i = 0; i < animations.Length; i++)
            {
                Animation anim = animations[i];
                string name = anim.clip.name;
                anim[name].speed = 0;
            }
        }

        if (animators != null)
        {
            for (int i = 0; i < animators.Length; i++)
            {
                Animator anim = animators[i];
                if (anim != null)
                {
                    anim.speed = 0;
                }
            }
        }

        if (renders != null)
        {
            for (int i = 0; i < renders.Length; i++)
            {
                TrailRenderer render = renders[i];
                render.Clear();
            }
        }
    }

    public void Stop()
    {
        isPlaying = false;

        if (particles != null)
        {
            for (int i = 0; i < particles.Length; i++)
            {
                ParticleSystem ps = particles[i];
                if (ps != null)
                {
                    ps.Stop();
                }
            }
        }

        if (animations != null)
        {
            for (int i = 0; i < animations.Length; i++)
            {
                Animation anim = animations[i];
                anim.Stop();
                string name = anim.clip.name;
                anim[name].speed = 0;
            }
        }

        if (animators != null)
        {
            for (int i = 0; i < animators.Length; i++)
            {
                Animator anim = animators[i];
                if (anim != null)
                {
                    anim.speed = 0;
                }
            }
        }

        if (renders != null)
        {
            for (int i = 0; i < renders.Length; i++)
            {
                TrailRenderer render = renders[i];
                render.Clear();
            }
        }

        runDelayTime = 0;
        runLifeTime = 0;
    }

    private void ResetSpeed()
    {
        if (particles != null)
        {
            for (int i = 0; i < particles.Length; i++)
            {
                ParticleSystem ps = particles[i];
                var main = ps.main;
                main.simulationSpeed = playSpeed * customSpeed;
            }
        }

        if (animations != null)
        {
            for (int i = 0; i < animations.Length; i++)
            {
                Animation anim = animations[i];
                foreach (AnimationState state in anim)
                {
                    state.speed = playSpeed * customSpeed;
                }
            }
        }

        if (animators != null)
        {
            for (int i = 0; i < animators.Length; i++)
            {
                Animator anim = animators[i];
                anim.speed = playSpeed * customSpeed;
            }
        }
    }


    public void SetLockRotation(bool isLock)
    {
        lockRotation = isLock;
        lockRotationValue = this.transform.rotation;
    }

    public void ResetDefaultSpeed()
    {
        playSpeed = 1;
        customSpeed = 1;
        ResetSpeed();
    }

    public void SetSpeed(float ps, float cs=1)
    {
        if (controllSpeed)
        {
            playSpeed = ps;
            customSpeed = cs;
            ResetSpeed();
        }
    }

    public void SetPlaySpeed(float speed)
    {
        if (controllSpeed)
        {
            playSpeed = speed;
            ResetSpeed();
        }
    }

    public void SetCustomSpeed(float speed)
    {
        if (controllSpeed)
        {
            customSpeed = speed;
            ResetSpeed();
        }
    }
}

public enum EffectPlayType
{
    Once,
    Loop
}