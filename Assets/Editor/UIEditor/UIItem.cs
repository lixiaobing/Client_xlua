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
		public struct ComponentItem
		{
			public static readonly ComponentItem Default = new ComponentItem(); 
			
			public UIEditor.ComponentAsset ComponentType;
			public Object Component;
		}

		[System.Serializable]
		public class NodeItem
		{
			public GameObject Owner;
			public long LocalId;
			public string OwnerPath;
			public List<ComponentItem> Components = new List<ComponentItem>();
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
			var go = node.gameObject;
			var item = new NodeItem()
			{
				Owner = go,
			};
			AssetDatabase.TryGetGUIDAndLocalFileIdentifier(go, out var _, out item.LocalId);
			Nodes.Add(item);
			item.Components.Add(new ComponentItem
			{
				ComponentType = UIEditor.ComponentAsset.GameObject,
				Component = go,
			});
			var components = node.GetComponents<Component>();
			foreach (var com in components)
			{
				item.Components.Add(new ComponentItem
				{
					ComponentType = UIEditor.GetComponentType(com),
					Component = com,
				});
			}

			for (int i = 0; i < node.childCount; i++)
			{
				var child = node.GetChild(i);
				ParseComponent(child);
			}
		}
	}
}