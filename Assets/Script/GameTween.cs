using UnityEngine;
using DG.Tweening;
using UnityEngine.Audio;
using System;
using UnityEngine.UI;
using XLua;

/// <summary>
/// XTween生成工具(DOTween shortcuts)
/// </summary>
public static class GameTween
{
    //-------Creating a Sequence
    public static XSequence Sequence()
    {
        return new XSequence();
    }
    //-------STATIC
    public static int Kill(object targetOrId, bool complete = false)
    {
        return DOTween.Kill(targetOrId, complete);
    }
    public static int DOComplete(Component comp, bool withCallbacks = false)
    {
        return comp.DOComplete(withCallbacks);
    }
    public static XTween To(LuaFunction callback, float startValue, float endValue, float duration)
    {
        return new XTween(DOTween.To(
            (v) => { if (callback != null) callback.Call(v); },
            startValue, endValue, duration));
    }
    public static XTween Punch(LuaFunction getter, LuaFunction setter, Vector3 direction, float duration, int vibrato, float elasticity)
    {
        return new XTween(DOTween.Punch(
            () => { return getter.Cast<Vector3>(); },
            (v) => { setter.Call(v); },
            direction, duration, vibrato, elasticity));
    }
    public static XTween Shake(LuaFunction getter, LuaFunction setter, float duration, float strength, int vibrato, float randomness, bool ignoreZAxis)
    {
        return new XTween(DOTween.Shake(
            () => { return getter.Cast<Vector3>(); },
            (v) => { setter.Call(v); },
            duration, strength, vibrato, randomness, ignoreZAxis));
    }
    public static XTween ToAlpha(LuaFunction getter, LuaFunction setter, float to, float duration)
    {
        return new XTween(DOTween.ToAlpha(
            () => { return getter.Cast<Color>(); },
            (v) => { setter.Call(v); },
            to, duration));
    }
    public static XTween ToArray(LuaFunction getter, LuaFunction setter, Vector3[] to, float[] duration)
    {
        return new XTween(DOTween.ToArray(
        () => { return getter.Cast<Vector3>(); },
        (v) => { setter.Call(v); },
        to, duration));
    }
    //-------Move
    public static XTween DOMove(object obj, Vector3 to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOMove(to, duration, snapping));
        return null;
    }
    public static XTween DOMoveX(object obj, float to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOMoveX(to, duration, snapping));
        return null;
    }
    public static XTween DOMoveY(object obj, float to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOMoveY(to, duration, snapping));
        return null;
    }
    public static XTween DOMoveZ(object obj, float to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOMoveZ(to, duration, snapping));
        return null;
    }
    public static XTween DOLocalMove(object obj, Vector3 to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOLocalMove(to, duration, snapping));
        return null;
    }
    public static XTween DOLocalMoveX(object obj, float to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOLocalMoveX(to, duration, snapping));
        return null;
    }
    public static XTween DOLocalMoveY(object obj, float to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOLocalMoveY(to, duration, snapping));
        return null;
    }
    public static XTween DOLocalMoveZ(object obj, float to, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOLocalMoveZ(to, duration, snapping));
        return null;
    }
    public static XTween DOJump(object obj, Vector3 endValue, float jumpPower, int numJumps, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOJump(endValue, jumpPower, numJumps, duration, snapping));
        return null;
    }
    public static XTween DOLocalJump(object obj, Vector3 endValue, float jumpPower, int numJumps, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOLocalJump(endValue, jumpPower, numJumps, duration, snapping));
        return null;
    }
    public static XTween DOFieldOfView(object obj, float to, float duration)
    {
        if (obj is Camera) return new XTween((obj as Camera).DOFieldOfView(to, duration));
        return null;
    }
    //-------Rotate
    public static XTween DORotate(object obj, Vector3 to, float duration, int mode)
    {
        RotateMode md = (RotateMode)mode;
        if (obj is Transform) return new XTween((obj as Transform).DORotate(to, duration, md));
        return null;
    }
    public static XTween DOLocalRotate(object obj, Vector3 to, float duration, XRotateMode mode)
    {
        RotateMode md = (RotateMode)(int)mode;
        if (obj is Transform) return new XTween((obj as Transform).DOLocalRotate(to, duration, md));
        return null;
    }
    public static XTween DOLookAt(object obj, Vector3 towards, float duration, int axisConstraint, Vector3 up)
    {

        AxisConstraint md = (AxisConstraint)axisConstraint;
        if (obj is Transform) return new XTween((obj as Transform).DOLookAt(towards, duration, md, up));
        return null;
    }
    //-------Scale
    public static XTween DOScaleV(object obj, Vector3 to, float duration)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOScale(to, duration));
        return null;
    }
    public static XTween DOScale(object obj, float to, float duration)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOScale(to, duration));
        return null;
    }
    public static XTween DOScaleX(object obj, float to, float duration)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOScaleX(to, duration));
        return null;
    }
    public static XTween DOScaleY(object obj, float to, float duration)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOScaleY(to, duration));
        return null;
    }
    public static XTween DOScaleZ(object obj, float to, float duration)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOScaleZ(to, duration));
        return null;
    }
    public static XTween DOPath(object obj, Vector3[] waypoints, float duration, int pathType, int pathMode, int resolution, Color gizmoColor)
    {
        PathType pt = (PathType)pathType;
        PathMode pm = (PathMode)pathMode;
        if (obj is Transform) return new XTween((obj as Transform).DOPath(waypoints, duration, pt, pm, resolution, gizmoColor));
        return null;
    }
    public static XTween DOLocalPath(object obj, Vector3[] waypoints, float duration, int pathType, int pathMode, int resolution, Color gizmoColor)
    {
        PathType pt = (PathType)pathType;
        PathMode pm = (PathMode)pathMode;
        if (obj is Transform) return new XTween((obj as Transform).DOLocalPath(waypoints, duration, pt, pm, resolution, gizmoColor));
        return null;
    }
    //-------Punch – no FROM
    public static XTween DOPunchPosition(object obj, Vector3 punch, float duration, int vibrato, float elasticity, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOPunchPosition(punch, duration, vibrato, elasticity, snapping));
        return null;
    }
    public static XTween DOPunchRotation(object obj, Vector3 punch, float duration, int vibrato, float elasticity)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOPunchRotation(punch, duration, vibrato, elasticity));
        return null;
    }
    public static XTween DOPunchScale(object obj, Vector3 punch, float duration, int vibrato, float elasticity)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOPunchScale(punch, duration, vibrato, elasticity));
        return null;
    }
    //-------Shake – no FROM (晃动)
    public static XTween DOShakePosition(object obj, float duration, Vector3 strength, int vibrato, float randomness, bool fadeOut)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOShakePosition(duration, strength, vibrato, randomness, fadeOut));
        return null;
    }
    public static XTween DOShakeRotation(object obj, float duration, Vector3 strength, int vibrato, float randomness, bool fadeOut)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOShakeRotation(duration, strength, vibrato, randomness, fadeOut));
        return null;
    }
    public static XTween DOShakeRotation(object obj, float duration, float strength, int vibrato, float randomness)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOShakeRotation(duration, strength, vibrato, randomness));
        return null;
    }
    public static XTween DOShakeScale(object obj, float duration, Vector3 strength, int vibrato, float randomness)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOShakeScale(duration, strength, vibrato, randomness));
        return null;
    }
    public static XTween DOShakeScale(object obj, float duration, float strength, int vibrato, float randomness)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOShakeScale(duration, strength, vibrato, randomness));
        return null;
    }
    //-------Blendable tweens (可混合缓动)
    public static XTween DOBlendableMoveBy(object obj, Vector3 by, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOBlendableMoveBy(by, duration, snapping));
        return null;
    }
    public static XTween DOBlendableLocalMoveBy(object obj, Vector3 by, float duration, bool snapping)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOBlendableLocalMoveBy(by, duration, snapping));
        return null;
    }
    public static XTween DOBlendableRotateBy(object obj, Vector3 by, float duration, int mode)
    {
        RotateMode md = (RotateMode)mode;
        if (obj is Transform) return new XTween((obj as Transform).DOBlendableRotateBy(by, duration, md));
        return null;
    }
    public static XTween DOBlendableLocalRotateBy(object obj, Vector3 by, float duration, int mode)
    {
        RotateMode md = (RotateMode)mode;
        if (obj is Transform) return new XTween((obj as Transform).DOBlendableLocalRotateBy(by, duration, md));
        return null;
    }
    public static XTween DOBlendableScaleBy(object obj, Vector3 by, float duration)
    {
        if (obj is Transform) return new XTween((obj as Transform).DOBlendableScaleBy(by, duration));
        return null;
    }
    //-------Text
    public static XTween DOColor(object obj, Color to, float duration)
    {
        if (obj is Camera) return new XTween((obj as Camera).DOColor(to, duration));
        if (obj is Light) return new XTween((obj as Light).DOColor(to, duration));
        if (obj is Material) return new XTween((obj as Material).DOColor(to, duration));
        if (obj is SpriteRenderer) return new XTween((obj as SpriteRenderer).DOColor(to, duration));
        if (obj is Graphic) return new XTween((obj as Graphic).DOColor(to, duration));
        if (obj is Image) return new XTween((obj as Image).DOColor(to, duration));
        if (obj is Outline) return new XTween((obj as Outline).DOColor(to, duration));
        if (obj is Text) return new XTween((obj as Text).DOColor(to, duration));
        return null;
    }
    public static XTween DOFade(object obj, float to, float duration)
    {
        if (obj is AudioSource) return new XTween((obj as AudioSource).DOFade(to, duration));
        if (obj is Material) return new XTween((obj as Material).DOFade(to, duration));
        if (obj is SpriteRenderer) return new XTween((obj as SpriteRenderer).DOFade(to, duration));
        if (obj is CanvasGroup) return new XTween((obj as CanvasGroup).DOFade(to, duration));
        if (obj is Graphic) return new XTween((obj as Graphic).DOFade(to, duration));
        if (obj is Image) return new XTween((obj as Image).DOFade(to, duration));
        if (obj is Outline) return new XTween((obj as Outline).DOFade(to, duration));
        if (obj is Text) return new XTween((obj as Text).DOFade(to, duration));
        return null;
    }
    public static XTween DOText(object obj, string to, float duration, bool richTextEnabled, int scrambleMode, string scrambleChars)
    {
        ScrambleMode md = (ScrambleMode)scrambleMode;
        if (obj is Text) return new XTween((obj as Text).DOText(to, duration, richTextEnabled, md, scrambleChars));
        return null;
    }
    public static XTween DOBlendableColor(object obj, Color to, float duration)
    {
        if (obj is Text) return new XTween((obj as Text).DOBlendableColor(to, duration));
        return null;
    }
    //-------Image
    public static XTween DOFillAmount(object obj, float to, float duration)
    {
        if (obj is Image) return new XTween((obj as Image).DOFillAmount(to, duration));
        return null;
    }
    //-------RectTransform 
    public static XTween DOAnchorPos(object obj, Vector2 to, float duration, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOAnchorPos(to, duration, snapping));
        return null;
    }
    public static XTween DOAnchorPosX(object obj, float to, float duration, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOAnchorPosX(to, duration, snapping));
        return null;
    }
    public static XTween DOAnchorPosY(object obj, float to, float duration, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOAnchorPosY(to, duration, snapping));
        return null;
    }
    public static XTween DOAnchorPos3D(object obj, Vector3 to, float duration, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOAnchorPos3D(to, duration, snapping));
        return null;
    }
    public static XTween DOJumpAnchorPos(object obj, Vector2 endValue, float jumpPower, int numJumps, float duration, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOJumpAnchorPos(endValue, jumpPower, numJumps, duration, snapping));
        return null;
    }
    public static XTween DOPunchAnchorPos(object obj, Vector2 punch, float duration, int vibrato, float elasticity, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOPunchAnchorPos(punch, duration, vibrato, elasticity, snapping));
        return null;
    }
    public static XTween DOShakeAnchorPos(object obj, float duration, Vector3 strength, int vibrato, float randomness, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOShakeAnchorPos(duration, strength, vibrato, randomness, snapping));
        return null;
    }
    public static XTween DOShakeAnchorPos(object obj, float duration, float strength, int vibrato, float randomness, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOShakeAnchorPos(duration, strength, vibrato, randomness, snapping));
        return null;
    }
    public static XTween DOSizeDelta(object obj, Vector2 to, float duration, bool snapping)
    {
        if (obj is RectTransform) return new XTween((obj as RectTransform).DOSizeDelta(to, duration, snapping));
        return null;
    }
    //------Slider
    public static XTween DOValue(object obj, float endValue, float duration, bool snapping)
    {
        if (obj is Slider) return new XTween((obj as Slider).DOValue(endValue, duration, snapping));
        return null;
    }

}

/// <summary>
/// Sequence包装器
/// </summary>
public class XSequence : XTween
{
    public XSequence()
    {
        tween = DOTween.Sequence();
        tween.Play();
    }

    public XSequence Append(XTween t)
    {
        (tween as Sequence).Append(t.tween);
        return this;
    }
    public XSequence AppendCallback(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        (tween as Sequence).AppendCallback(callback);
        return this;
    }
    public XSequence AppendInterval(float interval)
    {
        (tween as Sequence).AppendInterval(interval);
        return this;
    }
    public XSequence Insert(float atPosition, XTween t)
    {
        (tween as Sequence).Insert(atPosition, t.tween);
        return this;
    }
    public XSequence InsertCallback(float atPosition, LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        (tween as Sequence).InsertCallback(atPosition, callback);
        return this;
    }
    public XSequence Join(XTween t)
    {
        (tween as Sequence).Join(t.tween);
        return this;
    }
    public XSequence Prepend(XTween t)
    {
        (tween as Sequence).Prepend(t.tween);
        return this;
    }
    public XSequence PrependCallback(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        (tween as Sequence).PrependCallback(callback);
        return this;
    }
    public XSequence PrependInterval(float interval)
    {
        (tween as Sequence).PrependInterval(interval);
        return this;
    }

}

/// <summary>
/// Tween包装器
/// </summary>
public class XTween
{
    public Tween tween;

    public XTween()
    {

    }

    public XTween(Tween _tween)
    {
        if (_tween != null)
        {
            tween = _tween;
        }
        else
        {
            throw new ArgumentNullException("Tween is null");
        }
    }

    //----------Chained settings
    public XTween SetAS(XTween _tween)
    {
        tween.SetAs(_tween.tween);
        return this;
    }
    public XTween SetAutoKill(bool autoKillOnCompletion)
    {
        tween.SetAutoKill(autoKillOnCompletion);
        return this;
    }
    public XTween SetEase(int easeType)
    {
        Ease ease = (Ease)easeType;
        tween.SetEase(ease);
        return this;
    }
    public XTween SetEase(XEase easeType)
    {
        Ease ease = (Ease)easeType;
        tween.SetEase(ease);
        return this;
    }
    public XTween SetId(object id)
    {
        tween.SetId(id);
        return this;
    }
    public XTween SetLoops(int loops, int loopType)
    {
        LoopType loop = (LoopType)loopType;
        tween.SetLoops(loops, loop);
        return this;
    }
    public XTween SetRecyclable(bool recyclable)
    {
        tween.SetRecyclable(recyclable);
        return this;
    }
    public XTween SetRelative(bool isRelative)
    {
        tween.SetRelative(isRelative);
        return this;
    }
    public XTween SetUpdate(int updateType, bool isIndependentUpdate)
    {
        UpdateType update = (UpdateType)updateType;
        tween.SetUpdate(update, isIndependentUpdate);
        return this;
    }
    public XTween SetDelay(float _delay)
    {
        tween.SetDelay(_delay);
        return this;
    }
    public XTween SetSpeedBased(bool isSpeedBased)
    {
        tween.SetSpeedBased(isSpeedBased);
        return this;
    }
    public XTween From(bool isRelative)
    {
        if (tween is Tweener) (tween as Tweener).From(isRelative);
        return this;
    }

    public XTween ChangeEndValue(float newEndValue, float newDuration, bool snapStartValue)
    {
        (tween as Tweener).ChangeEndValue(newEndValue, newDuration, snapStartValue);
        return this;
    }

    public XTween ChangeEndValue(Vector3 newEndValue, float newDuration, bool snapStartValue)
    {
        (tween as Tweener).ChangeEndValue(newEndValue, newDuration, snapStartValue);
        return this;
    }

    //----------Chained callbacks
    public XTween OnComplete(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnComplete(callback);
        return this;
    }
    public XTween OnKill(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnKill(callback);
        return this;
    }
    public XTween OnPlay(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnPlay(callback);
        return this;
    }
    public XTween OnPause(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnPause(callback);
        return this;
    }
    public XTween OnRewind(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnRewind(callback);
        return this;
    }
    public XTween OnStart(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnStart(callback);
        return this;
    }
    public XTween OnStepComplete(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnStepComplete(callback);
        return this;
    }
    public XTween OnUpdate(LuaFunction _callback)
    {
        TweenCallback callback = new TweenCallback(() =>
        {
            if (_callback != null) _callback.Call();
        });
        tween.OnUpdate(callback);
        return this;
    }
    public XTween OnWaypointChange(LuaFunction _callback)
    {
        TweenCallback<int> callback = new TweenCallback<int>((waypointIndex) =>
        {
            if (_callback != null) _callback.Call(waypointIndex);
        });
        tween.OnWaypointChange(callback);
        return this;
    }

    //----------Control methods
    public void Complete()
    {
        tween.Complete();
    }
    public void Flip()
    {
        tween.Flip();
    }
    public void Goto(float to, bool andPlay)
    {
        tween.Goto(to, andPlay);
    }
    public void Kill(bool complete = true)
    {
        tween.Kill(complete);
    }
    public void Pause()
    {
        tween.Pause();
    }
    public void Play()
    {
        tween.Play();
    }
    public void PlayBackwards()
    {
        tween.PlayBackwards();
    }
    public void PlayForward()
    {
        tween.PlayForward();
    }
    public void Restart(bool includeDelay)
    {
        tween.Restart(includeDelay);
    }
    public void Rewind(bool includeDelay)
    {
        tween.Rewind(includeDelay);
    }
    public void SmoothRewind()
    {
        tween.SmoothRewind();
    }
    public void TogglePause()
    {
        tween.TogglePause();
    }

    //----------Special control methods
    public void ForceInit()
    {
        tween.ForceInit();
    }
    public void GotoWaypoint(int waypointIndex, bool andPlay)
    {
        tween.GotoWaypoint(waypointIndex, andPlay);
    }

    //----------Getting data from tweens , Instance methods (Tween/Tweener/Sequence)
    public float fullPosition()
    {
        return tween.fullPosition;
    }
    public int CompletedLoops()
    {
        return tween.CompletedLoops();
    }
    public float Delay()
    {
        return tween.Delay();
    }
    public float Duration(bool includeLoops)
    {
        return tween.Duration(includeLoops);
    }
    public float Elapsed(bool includeLoops)
    {
        return tween.Elapsed(includeLoops);
    }
    public float ElapsedDirectionalPercentage()
    {
        return tween.ElapsedDirectionalPercentage();
    }
    public float ElapsedPercentage(bool includeLoops = true)
    {
        return tween.ElapsedPercentage(includeLoops);
    }
    public bool IsActive()
    {
        return tween.IsActive();
    }
    public bool IsBackwards()
    {
        return tween.IsBackwards();
    }
    public bool IsComplete()
    {
        return tween.IsComplete();
    }
    public bool IsInitialized()
    {
        return tween.IsInitialized();
    }
    public bool IsPlaying()
    {
        return tween.IsPlaying();
    }
    public int Loops()
    {
        return tween.Loops();
    }
}

/// <summary>
/// 缓动类型枚举
/// </summary>
public enum XEase
{
    Unset = 0,
    Linear = 1,
    InSine = 2,
    OutSine = 3,
    InOutSine = 4,
    InQuad = 5,
    OutQuad = 6,
    InOutQuad = 7,
    InCubic = 8,
    OutCubic = 9,
    InOutCubic = 10,
    InQuart = 11,
    OutQuart = 12,
    InOutQuart = 13,
    InQuint = 14,
    OutQuint = 15,
    InOutQuint = 16,
    InExpo = 17,
    OutExpo = 18,
    InOutExpo = 19,
    InCirc = 20,
    OutCirc = 21,
    InOutCirc = 22,
    InElastic = 23,
    OutElastic = 24,
    InOutElastic = 25,
    InBack = 26,
    OutBack = 27,
    InOutBack = 28,
    InBounce = 29,
    OutBounce = 30,
    InOutBounce = 31,
    INTERNAL_Zero = 32,
    INTERNAL_Custom = 33
}

/// <summary>
/// 循环类型枚举
/// </summary>
public enum XLoopType
{
    Restart = 0,
    Yoyo = 1,
    Incremental = 2
}

/// <summary>
/// 刷新类型枚举
/// </summary>
public enum XUpdateType
{
    Normal = 0,
    Late = 1,
    Fixed = 2
}

/// <summary>
/// 旋转模式枚举
/// </summary>
public enum XRotateMode
{
    Fast = 0,
    FastBeyond360 = 1,
    WorldAxisAdd = 2,
    LocalAxisAdd = 3
}

/// <summary>
/// 旋转模式枚举
/// </summary>
public enum XAxisConstraint
{
    None = 0,
    X = 2,
    Y = 4,
    Z = 8,
    W = 16
}

/// <summary>
/// 混杂模式枚举
/// </summary>
public enum XScrambleMode
{
    // 摘要:
    //     No scrambling of characters
    None = 0,
    //
    // 摘要:
    //     A-Z + a-z + 0-9 characters
    All = 1,
    //
    // 摘要:
    //     A-Z characters
    Uppercase = 2,
    //
    // 摘要:
    //     a-z characters
    Lowercase = 3,
    //
    // 摘要:
    //     0-9 characters
    Numerals = 4,
    //
    // 摘要:
    //     Custom characters
    Custom = 5,
}

/// <summary>
/// 路径类型枚举
/// </summary>
public enum XPathType
{
    // Summary:
    //     Linear, composed of straight segments between each waypoint
    Linear = 0,
    //
    // Summary:
    //     Curved path (which uses Catmull-Rom curves)
    CatmullRom = 1,
}

/// <summary>
/// 路径模式枚举
/// </summary>
public enum XPathMode
{
    // Summary:
    //     Ignores the path mode (and thus LookAt behaviour)
    Ignore = 0,
    //
    // Summary:
    //     Regular 3D path
    Full3D = 1,
    //
    // Summary:
    //     2D top-down path
    TopDown2D = 2,
    //
    // Summary:
    //     2D side-scroller path
    Sidescroller2D = 3,
}