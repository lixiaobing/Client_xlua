/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-16 20:16:00
* description : 
*******************************************
** ************************************* */

using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace GameEditor
{
	public class UIItem : ScriptableObject
	{
		[System.Serializable]
		public class NodeItem
		{
			public GameObject Owner;
			public string OwnerPath;
			public List<Component> Components = new List<Component>();
		}
		
		public string Md5;
		public string Path;
		public string NameLower;
		public GameObject Prefab;
		public List<NodeItem> Nodes = new List<NodeItem>();

		public void Init(GameObject prefab)
		{
			Prefab = prefab;
			NameLower = prefab.name.ToLower();
			Path = AssetDatabase.GetAssetPath(prefab);
			Md5 = GameEditorUtils.Md5(Path);
			ParseComponents();
		}

		public void Open()
		{
			if (Prefab == null)
			{
				EditorUtility.DisplayDialog("error", $"prefab 不存在了:{name}", "ok");
				return;
			}

			var newMd5 = GameEditorUtils.Md5(AssetDatabase.GetAssetPath(Prefab));
			if (newMd5 == Md5)
			{
				return;
			}
			
			Init(Prefab);
		}

		private void ParseComponents()
		{
			Nodes.Clear();
			ParseComponent(Prefab.transform);
		}

		private void ParseComponent(Transform node)
		{
			var item = new NodeItem()
			{
				Owner = node.gameObject,
			};
			Nodes.Add(item);
			var components = node.GetComponents<Component>();
			foreach (var com in components)
			{
				item.Components.Add(com);
			}
			for (int i = 0; i < node.childCount; i++)
			{
				var child = node.GetChild(i);
				ParseComponent(child);
			}
		}
	}
}