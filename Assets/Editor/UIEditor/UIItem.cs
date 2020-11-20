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
		private static UIItem _cache;

		[System.Serializable]
		public class ComponentItem
		{
			public UIEditor.ComponentAsset ComponentType;
			public Object Component;
			public long LocalId;
			public string AliasName;
			public bool IsBinding;
			public bool IsAsTransform;
			public string EventName;
		}

		[System.Serializable]
		public class NodeItem
		{
			public GameObject Owner;
			public long LocalId;
			public string OwnerPath;
			public List<ComponentItem> Components = new List<ComponentItem>();

			public bool IsBinding
			{
				get
				{
					foreach (var com in Components)
					{
						if (com.IsBinding)
						{
							return true;
						}
					}

					return false;
				}
			}
		}

		public string Md5;
		public string Path;
		public long LocalId;
		public string NameLower;
		public GameObject Prefab;
		public List<NodeItem> Nodes = new List<NodeItem>();
		private bool _isGenerateRuntimeData = true;

		private Dictionary<long, NodeItem> _nodesKeymap;
		private Dictionary<long, ComponentItem> _componentsKeymap;
		public bool IsRefreshData { get; private set; }

		private static void Parse(UIItem item, GameObject prefab, string md5)
		{
			item.Prefab = prefab;
			item.NameLower = prefab.name.ToLower();
			item.Path = AssetDatabase.GetAssetPath(prefab);
			item.Md5 = md5;
			item.LocalId = GameEditorUtils.GetLocalIdentity(prefab);
			item.ParseComponents();
		}
		
		private static void Parse(UIItem item, GameObject prefab)
		{
			item.Prefab = prefab;
			item.NameLower = prefab.name.ToLower();
			item.Path = AssetDatabase.GetAssetPath(prefab);
			item.Md5 = GameEditorUtils.Md5(item.Path);
			item.LocalId = GameEditorUtils.GetLocalIdentity(prefab);
			item.ParseComponents();
		}

		public void Init(GameObject prefab)
		{
			Parse(this, prefab);
		}

		private void GenerateRuntimeData()
		{
			if (_nodesKeymap == null)
			{
				_nodesKeymap = new Dictionary<long, NodeItem>();
			}
			else
			{
				_nodesKeymap.Clear();
			}

			if (_componentsKeymap == null)
			{
				_componentsKeymap = new Dictionary<long, ComponentItem>();
			}
			else
			{
				_componentsKeymap.Clear();
			}

			foreach (var node in Nodes)
			{
				_nodesKeymap.Add(node.LocalId, node);
				foreach (var com in node.Components)
				{
					_componentsKeymap.Add(com.LocalId, com);
				}
			}
		}

		public void Open()
		{
			if (!_isGenerateRuntimeData)
			{
				return;
			}

			_isGenerateRuntimeData = true;
			GenerateRuntimeData();
		}

		public void Update()
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

			if (_cache == null)
			{
				_cache = CreateInstance<UIItem>();
			}

			Parse(_cache, Prefab, newMd5);
			_cache.GenerateRuntimeData();
			SyncItemData(this, _cache);
			IsRefreshData = true;
		}

		public void ClearRefreshDataFlag()
		{
			IsRefreshData = false;
		}

		private void ParseComponents()
		{
			Nodes.Clear();
			ParseComponent(Prefab.transform);
		}

		private void ParseComponent(Transform node)
		{
			var go = node.gameObject;
			var item = new NodeItem
			{
				Owner = go,
				OwnerPath = GameEditorUtils.GetGameObjectPath(node, Prefab.transform),
				LocalId = GameEditorUtils.GetLocalIdentity(go),
			};
			Nodes.Add(item);
			item.Components.Add(new ComponentItem
			{
				ComponentType = UIEditor.ComponentAsset.GameObject,
				Component = go,
				LocalId = item.LocalId
			});
			var components = node.GetComponents<Component>();
			foreach (var com in components)
			{
				item.Components.Add(new ComponentItem
				{
					ComponentType = UIEditor.GetComponentType(com),
					Component = com,
					LocalId = GameEditorUtils.GetLocalIdentity(com),
				});
			}

			for (int i = 0; i < node.childCount; i++)
			{
				var child = node.GetChild(i);
				ParseComponent(child);
			}
		}

		private static void SyncItemData(UIItem oldData, UIItem newData)
		{
			oldData.Path = newData.Path;
			oldData.LocalId = newData.LocalId;
			oldData.NameLower = newData.NameLower;
			oldData.Prefab = newData.Prefab;

			foreach (var newNode in newData._nodesKeymap)
			{
				if (!oldData._nodesKeymap.TryGetValue(newNode.Key, out var oldNode)
				    || !oldNode.IsBinding)
				{
					continue;
				}

				oldNode.Owner = newNode.Value.Owner;
				oldNode.LocalId = newNode.Value.LocalId;
				oldNode.OwnerPath = newNode.Value.OwnerPath;
				foreach (var newCom in newNode.Value.Components)
				{
					if (!oldData._componentsKeymap.TryGetValue(newCom.LocalId, out var oldCom)
					    || !oldCom.IsBinding)
					{
						continue;
					}

					newCom.AliasName = oldCom.AliasName;
					newCom.IsBinding = oldCom.IsBinding;
					newCom.IsAsTransform = oldCom.IsAsTransform;
					newCom.EventName = oldCom.EventName;
				}
				oldNode.Components.Clear();
				foreach (var newCom in newNode.Value.Components)
				{
					oldNode.Components.Add(newCom);
				}
			}

			oldData.Nodes.Clear();
			foreach (var node in newData.Nodes)
			{
				oldData.Nodes.Add(node);
			}
			oldData.GenerateRuntimeData();
		}
	}
}