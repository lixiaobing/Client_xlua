/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-13 15:10:17
* description : 
*******************************************
** ************************************* */


using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
	public class GameObjectPool
	{
		private readonly Dictionary<GameObject, bool> _using = new Dictionary<GameObject, bool>();
		private readonly List<GameObject> _free = new List<GameObject>();
		private GameObject _prefab;
		private Transform _activeParent;
		private Transform _inactiveParent;
		
		private GameObjectPool()
		{
		}

		public GameObjectPool(GameObject prefab, Transform activeParent, Transform inactiveParent)
		{
			_prefab = prefab;
			_activeParent = activeParent;
			_inactiveParent = inactiveParent;
		}

		public GameObject New()
		{
			GameObject obj;
			if (_free.Count > 0)
			{
				var last = _free.Count - 1;
				obj = _free[last];
				_free.RemoveAt(last);
			}
			else
			{
				obj = Object.Instantiate(_prefab);
			}

			if (_activeParent != null)
			{
				obj.transform.SetParent(_activeParent, true);
			}
			obj.SetActive(true);
			_using.Add(obj, true);
			return obj;
		}

		public void Delete(GameObject obj)
		{
			if (_using.ContainsKey(obj))
			{
				obj.SetActive(false);
				if (_inactiveParent != null)
				{
					obj.transform.SetParent(_inactiveParent, true);
				}
				_using.Remove(obj);
				_free.Add(obj);
			}
			else
			{
				Debug.LogErrorFormat($"不是从GameObjectPool中获取的对象:{obj.name}");
			}
		}

		public void Dispose()
		{
			_prefab = null;
			_activeParent = null;
			_inactiveParent = null;
			_using.Clear();
			_free.Clear();
		}
	}
}