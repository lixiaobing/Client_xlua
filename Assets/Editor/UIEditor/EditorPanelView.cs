/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 10:47:22
* description : 
*******************************************
** ************************************* */


using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEditor.Experimental.SceneManagement;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace GameEditor
{
	public class EditorPanelView
	{
		// private static Dictionary<> ComponentConverter

		public VisualElement Node { get; }
		private readonly Button _addButton;
		private readonly ScrollView _scrollView;
		private static readonly char[] SearchSplit = {' '};
		private UIEditor _owner;

		private readonly ComponentViewBase[] _components =
			new ComponentViewBase[(int) UIEditor.ComponentAsset.ComponentCount];

		public EditorPanelView(UIEditor owner, VisualElement panel)
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
			for (int i = 0; i < (int) UIEditor.ComponentAsset.ComponentCount; i++)
			{
				var com = _owner.NewComponentView((UIEditor.ComponentAsset) i);

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
				UIEditor.SetActive(item, false);
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
					UIEditor.SetActive(child, true);
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

				UIEditor.SetActive(child, isContains);
			}
		}

		private void UpdateComponentsView(UIItem.NodeItem nodeItem)
		{
			if (nodeItem == null)
			{
				return;
			}

			for (int i = 0; i < _components.Length; i++)
			{
				var isIn = false;
				var comItem = UIItem.ComponentItem.Default;
				foreach (var com in nodeItem.Components)
				{
					if ((int) com.ComponentType != i)
					{
						continue;
					}

					comItem = com;
					isIn = true;
					break;
				}

				if (isIn)
				{
					_components[i].SetComView(comItem);
				}

				_components[i].SetActive(isIn);
			}
		}

		public void Update()
		{
			var stage = PrefabStageUtility.GetCurrentPrefabStage();
			if (stage == null)
			{
				UIEditor.SetActive(_addButton, false);
				return;
			}

			var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(stage.prefabAssetPath);
			var itemData = UIContainer.GetUiItem(prefab);
			if (itemData == null)
			{
				UIEditor.SetActive(_addButton, true);
				return;
			}

			UIEditor.SetActive(_addButton, false);
			if (Selection.activeGameObject == null)
			{
				return;
			}

			var components = UIContainer.GetComponents(itemData, Selection.activeGameObject);
			UpdateComponentsView(components);
		}
	}
}