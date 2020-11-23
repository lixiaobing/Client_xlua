/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-13 15:26:49
* description : 
*******************************************
** ************************************* */


using System.Collections.Generic;
using Dal;
using UnityEngine;


public class GameObjectFactory : IDispose
{
    private readonly Dictionary<string, GameObjectPool> _pools = new Dictionary<string, GameObjectPool>();

    public void AddPool(string key, GameObject prefab, Transform activeParent = null, Transform inactiveParent = null)
    {
        if (_pools.ContainsKey(key))
        {
            Debug.LogError($"已存在的key:{key}");
            return;
        }
        _pools.Add(key, new GameObjectPool(prefab, activeParent, inactiveParent));
    }

    public void RemovePool(string key)
    {
        if (_pools.TryGetValue(key, out var pool))
        {
            pool.Dispose();
            _pools.Remove(key);
        }
        else
        {
            Debug.LogError($"不存在的key:{key}");
        }
    }

    public GameObject New(string key)
    {
        if (_pools.TryGetValue(key, out var pool))
        {
            return pool.New();
        }

        Debug.LogError($"不存在的池子:{key}");
        return new GameObject();
    }

    public void Delete(string key, GameObject obj)
    {
        if (_pools.TryGetValue(key, out var pool))
        {
            pool.Delete(obj);
        }
        else
        {
            Debug.LogError($"不存在的池子:{key}");
        }
    }

    public void Dispose()
    {
        foreach (var pool in _pools)
        {
            pool.Value.Dispose();
        }
        _pools.Clear();
    }
}
