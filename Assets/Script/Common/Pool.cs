/* ****************************************
*******************************************
* author : kaka
* create time : 2020-09-15 10:16:11
* description : 
*******************************************
** ************************************* */


using System;
using System.Collections.Generic;


public class Pool<T> : IDispose
{
    private Func<T> _new;
    private Action<T> _delete;
    private readonly Dictionary<T, bool> _using = new Dictionary<T, bool>();
    private readonly List<T> _free = new List<T>();

    private Pool()
    {
    }

    public Pool(Func<T> newFunc, Action<T> deleteFunc)
    {
        _new = newFunc;
        _delete = deleteFunc;
    }

    public T New()
    {
        T obj;
        if (_free.Count > 0)
        {
            int last = _free.Count - 1;
            obj = _free[last];
            _free.RemoveAt(last);
        }
        else
        {
            obj = _new();
        }

        _using.Add(obj, true);
        return obj;
    }

    public void Delete(T obj)
    {
        if (_using.ContainsKey(obj))
        {
            _delete(obj);
            _using.Remove(obj);
            _free.Add(obj);
        }
        else
        {
            UnityEngine.Debug.LogErrorFormat($"didn't get from pool or released -> type:{typeof(T)}");
        }
    }

    public void Dispose()
    {
        foreach (var pair in _using)
        {
            _delete(pair.Key);
        }

        _using.Clear();

        foreach (var obj in _free)
        {
            _delete(obj);
        }

        _free.Clear();
    }

    public void Destroy()
    {
        _using.Clear();
        _free.Clear();
        _new = null;
        _delete = null;
    }
}

public class PoolProvideCreator<T> : IDispose
{
    private Func<T> _new;
    private readonly Dictionary<T, bool> _using = new Dictionary<T, bool>();
    private readonly List<T> _free = new List<T>();

    private PoolProvideCreator()
    {
    }

    public PoolProvideCreator(Func<T> newFunc)
    {
        _new = newFunc;
    }

    public T New()
    {
        T obj;
        if (_free.Count > 0)
        {
            int last = _free.Count - 1;
            obj = _free[last];
            _free.RemoveAt(last);
        }
        else
        {
            obj = _new();
        }

        _using.Add(obj, true);
        return obj;
    }

    public void Delete(T obj)
    {
        if (_using.ContainsKey(obj))
        {
            _using.Remove(obj);
            _free.Add(obj);
        }
        else
        {
            UnityEngine.Debug.LogErrorFormat($"didn't get from pool or released -> type:{typeof(T)}");
        }
    }

    public void Dispose()
    {
        _using.Clear();
        _free.Clear();
    }

    public void Destroy()
    {
        _using.Clear();
        _free.Clear();
        _new = null;
    }
}

public interface IProvider<T>
{
    T New();
    void Delete(T obj);
}

public class PoolWithProvider<T> : IDispose
{
    private readonly Dictionary<T, bool> _using = new Dictionary<T, bool>();
    private readonly List<T> _free = new List<T>();
    private IProvider<T> _provider;

    private PoolWithProvider()
    {
    }

    public PoolWithProvider(IProvider<T> provider)
    {
        _provider = provider;
    }

    public void SetProvider(IProvider<T> provider)
    {
        if (_provider == null)
        {
            _provider = provider;
            return;
        }

        Dispose();
        _provider = provider;
    }

    public T New()
    {
        T obj;
        if (_free.Count > 0)
        {
            int last = _free.Count - 1;
            obj = _free[last];
            _free.RemoveAt(last);
        }
        else
        {
            obj = _provider.New();
        }

        _using.Add(obj, true);
        return obj;
    }

    public void Delete(T obj)
    {
        if (_using.ContainsKey(obj))
        {
            _provider.Delete(obj);
            _using.Remove(obj);
            _free.Add(obj);
        }
        else
        {
            UnityEngine.Debug.LogErrorFormat($"didn't get from pool or released -> type:{typeof(T)}");
        }
    }

    public void Dispose()
    {
        foreach (var pair in _using)
        {
            _provider.Delete(pair.Key);
        }

        _using.Clear();

        foreach (var obj in _free)
        {
            _provider.Delete(obj);
        }

        _free.Clear();
        _provider = null;
    }
}
