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
		private readonly VisualElement _bindingComponentsRoot;
		private bool _clearFlag;
		private UIItem _curUiItem;
		private GameObject _curGameObject;

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
				_curUiItem = item;
				AddUiItem(item);
			};
			UIEditor.SetActive(_addButton, false);

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

			var scriptPath = item.Q<TextField>("ScriptPath");
			scriptPath.SetValueWithoutNotify(itemData.ScriptPath);
			scriptPath.RegisterValueChangedCallback(evt =>
			{
				itemData.ScriptPath = evt.newValue;
			});
			
			var removeBtn = item.Q<Button>("Remove");
			removeBtn.clicked += () =>
			{
				UIContainer.RemoveItem(itemData);
				UIEditor.SetActive(item, false);
				if (itemData == _curUiItem)
				{
					_curUiItem = null;
					UpdateComponentsView(null, null);
				}
			};
			
			var openBtn = item.Q<Button>("Open");
			openBtn.clicked += () =>
			{
				_curUiItem = itemData;
				AssetDatabase.OpenAsset(itemData.Prefab);
			};
			
			var bindingBtn = item.Q<Button>("Binding");
			bindingBtn.clicked += () =>
			{
				UIBindingSystem.BindingStart(itemData);
				// EditorUtility.SetDirty(itemData);
				AssetDatabase.Refresh();
			};

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

		private void UpdateComponentsView(UIItem itemData, GameObject gameObject)
		{
			if (itemData == null)
			{
				for (int i = 0; i < _components.Length; i++)
				{
					_components[i].SetActive(false);
				}

				return;
			}

			var nodeItem = UIContainer.NodeItem(_curUiItem, gameObject);
			if (nodeItem == null)
			{
				for (int i = 0; i < _components.Length; i++)
				{
					_components[i].SetActive(false);
				}

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
					((ComponentViewBase) com.userData).SetActive(false);
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

							((ComponentViewBase) cv.userData).SetActive(false);
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
							if (UIEditor.IsActive(cv)
							    || ((ComponentViewBase) cv.userData).ComponentType != comData.ComponentType)
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
						var com = (ComponentViewBase) comView.userData;
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
				if (!_clearFlag)
				{
					return;
				}

				_clearFlag = false;
				UIEditor.SetActive(_addButton, false);
				UpdateBindingComponentsView(null);
				UpdateComponentsView(null, null);
				return;
			}

			_clearFlag = true;

			var prefabAssetPath = stage.prefabAssetPath;
			var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(prefabAssetPath);
			var curUiItem = UIContainer.GetUiItem(prefab);

			if (_curUiItem == null)
			{
				UpdateBindingComponentsView(_curUiItem);
			}
			else
			{
				if (_curUiItem.IsRefreshData)
				{
					UpdateBindingComponentsView(null);
					UpdateBindingComponentsView(_curUiItem);
				}
				else
				{
					UpdateBindingComponentsView(_curUiItem);
				}
			}
			
			UIEditor.SetActive(_addButton, curUiItem == null || _curUiItem != curUiItem);
			_curUiItem = curUiItem;
			if (_curUiItem != null)
			{
				_curUiItem.Open();
			}

			if (_curUiItem == null)
			{
				if (Selection.activeGameObject == _curGameObject)
				{
					return;
				}

				_curGameObject = Selection.activeGameObject;
				UpdateComponentsView(_curUiItem, _curGameObject);	
			}
			else
			{
				if (Selection.activeGameObject == _curGameObject && !_curUiItem.IsRefreshData)
				{
					return;
				}
				_curUiItem.ClearRefreshDataFlag();
				_curGameObject = Selection.activeGameObject;
				UpdateComponentsView(_curUiItem, _curGameObject);
			}
		}
	}
}