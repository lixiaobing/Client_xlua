﻿/* ****************************************
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
		private VisualElement _bindingComponentsRoot;

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

			_bindingComponentsRoot = panel.Q<VisualElement>("BindingComponents");

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
				var isContains = false;
				foreach (var info in infos)
				{
					if (((UIItem) child.userData).NameLower.Contains(info))
					{
						isContains = true;
						break;
					}
				}
				
				UIEditor.SetActive(child, isContains);
			}
		}

		private void UpdateComponentsView(UIItem itemData, UIItem.NodeItem nodeItem)
		{
			if (nodeItem == null)
			{
				return;
			}

			for (int i = 0; i < _components.Length; i++)
			{
				var isIn = false;
				UIItem.ComponentItem comItem = null;
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
					_components[i].SetComView(itemData, comItem);
				}

				_components[i].SetActive(isIn);
			}
		}

		private void UpdateBindingComponentsView(UIItem itemData)
		{
			var components = _bindingComponentsRoot.Children();
			if (itemData == null)
			{
				foreach (var com in components)
				{
					((ComponentViewBase)com.userData).SetActive(false);
				}
				return;
			}

			foreach (var node in itemData.Nodes)
			{
				foreach (var comData in node.Components)
				{
					if (!comData.IsBinding)
					{
						foreach (var cv in components)
						{
							if (((ComponentViewBase) cv.userData).ComData != comData)
							{
								continue;
							}
							((ComponentViewBase)cv.userData).SetActive(false);
							break;
						}
						continue;
					}
					VisualElement comView = null;
					foreach (var cv in components)
					{
						if (((ComponentViewBase) cv.userData).ComData != comData)
						{
							continue;
						}
						comView = cv;
						break;
					}

					if (comView == null)
					{
						foreach (var cv in components)
						{
							if (UIEditor.IsActive(cv))
							{
								continue;
							}
							comView = cv;
							break;
						}
					}

					if (comView == null)
					{
						var com = _owner.NewComponentView(comData.ComponentType);
						com.Node.userData = com;
						_bindingComponentsRoot.Add(com.Node);
						com.SetComView(itemData, comData);
					}
					else
					{
						var com = (ComponentViewBase)comView.userData;
						com.SetComView(itemData, comData);
						UIEditor.SetActive(comView, true);
					}
				}
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
			
			UpdateBindingComponentsView(itemData);
			
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
			UpdateComponentsView(itemData, components);
		}
	}
}