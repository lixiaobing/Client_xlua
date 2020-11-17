/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-16 19:54:18
* description : 
*******************************************
** ************************************* */

using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace GameEditor
{
	public class UIContainer : ScriptableObject
	{
		public static UIContainer Instance => _instance;
		private static UIContainer _instance;
		public string Directory;
		public List<UIItem> Items;
		private string _rootDirectory;
		
		[UnityEditor.Callbacks.DidReloadScripts(1)]
		private static void Loader()
		{
			const string p = "Assets/Editor/UIEditor/UIContainer.asset";
			_instance = AssetDatabase.LoadAssetAtPath<UIContainer>(p);
			Debug.Assert(_instance != null, $"加载({p})失败");
			var hashset = new HashSet<GameObject>();
			foreach (var item in _instance.Items)
			{
				if (hashset.Contains(item.Prefab))
				{
					Debug.Assert(_instance != null, $"重复的ui:{AssetDatabase.GetAssetPath(item.Prefab)}");
				}
				hashset.Add(item.Prefab);
			}

			_instance._rootDirectory = GameEditorUtils.GetScriptDirectory(_instance);
		}

		private static string GenItemPath(string path)
		{
			var file = Path.GetFileNameWithoutExtension(path);
			return $"{_instance._rootDirectory}/{_instance.Directory}/{file}.asset";
		}
		
		private static bool IsAlreadyExist(GameObject go)
		{
			foreach (var item in _instance.Items)
			{
				if (item.Prefab == go)
				{
					return true;
				}
			}

			return false;
		}

		public static void AddItem(GameObject prefab)
		{
			if (IsAlreadyExist(prefab))
			{
				EditorUtility.DisplayDialog("duplicate", "duplicate ui game object", "ok");
				return;
			}
			var item = CreateInstance<UIItem>();
			item.Init(prefab);
			var p = GenItemPath(item.Path);
			AssetDatabase.CreateAsset(item, p);
			_instance.Items.Add(item);
			EditorUtility.SetDirty(_instance);
		}
	}
}