/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 10:47:22
* description : 
*******************************************
** ************************************* */


using System;
using UnityEditor;
using UnityEditor.Experimental.SceneManagement;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace GameEditor
{
	public class EditorPanelView
	{
		public VisualElement Node { get; }
		private readonly Button _addButton;
		private readonly ScrollView _scrollView;
		private static readonly char[] SearchSplit = {' '};
		private UIEditor _owner;
		private readonly ComponentViewBase[] _components = new ComponentViewBase[(int)UIEditor.ComponentAsset.ComponentCount];

		public EditorPanelView( UIEditor owner, VisualElement panel)
		{
			_owner = owner;
			Node = panel;
			_addButton = panel.Q<Button>("AddUIPrefab");
			_addButton.clicked += () =>
			{
				var stage = PrefabStageUtility.GetCurrentPrefabStage();
				if (stage == null)
				{
					return;
				}

				var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(stage.prefabAssetPath);
				var item = UIContainer.AddItem(prefab);
				AddUiItem(item);
			};

			var componentsRoot = panel.Q<VisualElement>("Components");
			for (int i = 0; i < (int)UIEditor.ComponentAsset.ComponentCount; i++)
			{
				var com = _owner.NewComponentView((UIEditor.ComponentAsset)i);
				com.SetActive(false);
				_components[i] = com;
				componentsRoot.Add(com.Node);
			}

			var toolbarSearchField = panel.Q<ToolbarSearchField>("ToolbarSearchField");
			toolbarSearchField.RegisterValueChangedCallback(evt =>
			{
				toolbarSearchField.value = evt.newValue;
				OnSearchTextChanged(evt.newValue.ToLower());
			});

			_scrollView = panel.Q<ScrollView>("DataContainer");
			foreach (var item in UIContainer.UIItems)
			{
				AddUiItem(item);
			}
		}

		public void Dispose()
		{
			_owner = null;
		}

		private void AddUiItem(UIItem itemData)
		{
			var item = _owner.GetViewAsset(UIEditor.ViewAsset.UiItem).CloneTree();
			item.userData = itemData;
			var prefab = item.Q<ObjectField>("Prefab");
			prefab.objectType = typeof(GameObject);
			prefab.value = itemData.Prefab;
			prefab.RegisterValueChangedCallback(evt => { prefab.SetValueWithoutNotify(evt.previousValue); });

			var data = item.Q<ObjectField>("Data");
			data.objectType = typeof(UIItem);
			data.value = itemData;
			data.RegisterValueChangedCallback(evt => { data.SetValueWithoutNotify(evt.previousValue); });

			var removeBtn = item.Q<Button>("Remove");
			removeBtn.clicked += () =>
			{
				UIContainer.RemoveItem(itemData);
				item.AddToClassList("hidden");
			};
			var openBtn = item.Q<Button>("Open");
			openBtn.clicked += () => { AssetDatabase.OpenAsset(itemData.Prefab); };

			_scrollView.Add(item);
		}

		private void OnSearchTextChanged(string searchInfo)
		{
			if (string.IsNullOrEmpty(searchInfo))
			{
				foreach (var child in _scrollView.Children())
				{
					child.RemoveFromClassList("hidden");
				}

				return;
			}

			var infos = searchInfo.Split(SearchSplit, StringSplitOptions.RemoveEmptyEntries);

			foreach (var child in _scrollView.Children())
			{
				var isContains = true;
				foreach (var info in infos)
				{
					if (!((UIItem) child.userData).NameLower.Contains(info))
					{
						isContains = false;
						break;
					}
				}

				if (isContains)
				{
					child.RemoveFromClassList("hidden");
				}
				else
				{
					child.AddToClassList("hidden");
				}
			}
		}

		public void Update()
		{
			var stage = PrefabStageUtility.GetCurrentPrefabStage();
			if (stage == null)
			{
				_addButton.AddToClassList("hidden");
				return;
			}

			var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(stage.prefabAssetPath);
			var isIn = UIContainer.IsAlreadyIn(prefab);
			if (isIn)
			{
				_addButton.AddToClassList("hidden");
				if (Selection.activeGameObject == null)
				{
					return;
				}

				// if ((UIItem)_uiItems.selectedItem != null)
				// {
				// 	var components = UIContainer.GetComponents((UIItem)_uiItems.selectedItem, Selection.activeGameObject);
				// }
				// _label.text = Selection.activeGameObject.name;
			}
			else
			{
				_addButton.RemoveFromClassList("hidden");
			}
		}
	}
}