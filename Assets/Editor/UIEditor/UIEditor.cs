/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-16 19:53:56
* description : 
*******************************************
** ************************************* */


using UnityEditor;
using UnityEditor.Experimental.SceneManagement;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace GameEditor
{
	public class UIEditor : EditorWindow
	{
		private enum Panel
		{
			UiContainer = 0,
			UiEditor,

			PanelCount,
		}

		private VisualElement _root;
		private VisualElement[] _panels = new VisualElement[(int) Panel.PanelCount];
		private VisualElement _curPanel;
		private bool _popupSearchFieldOn;
		private Button _addBtn;
		private ListView _uiItems;

		[MenuItem("Tools/UIEditor #O")]
		private static void ShowWindow()
		{
			GetWindow<UIEditor>("UIEditor Window");
		}

		private void OnEnable()
		{
			_root = rootVisualElement;
			_root.Clear();

			var directory = GameEditorUtils.GetScriptDirectory(this);
			var style = AssetDatabase.LoadAssetAtPath<StyleSheet>($"{directory}/UIEditorWindow.uss");
			_root.styleSheets.Add(style);
			var mainEditor = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>($"{directory}/UIEditorWindow.uxml");
			_root.Add(mainEditor.CloneTree());

			var containerPanel = _root.Q<VisualElement>("UIContainerPanel");
			_panels[(int) Panel.UiContainer] = containerPanel;
			GameEditorUtils.DefaultGui(containerPanel, new SerializedObject(UIContainer.Instance), true);

			var uiEditorPanel = _root.Q<VisualElement>("UIEditorPanel");
			_panels[(int) Panel.UiEditor] = uiEditorPanel;
			_curPanel = uiEditorPanel;
			for (int i = 0; i < _panels.Length; i++)
			{
				var panel = _panels[i];
				panel.style.display = panel == _curPanel ? DisplayStyle.Flex : DisplayStyle.None;
			}

			var addBtn = uiEditorPanel.Q<Button>("AddUIPrefab");
			_addBtn = addBtn;
			addBtn.clicked += () =>
			{
				var stage = PrefabStageUtility.GetCurrentPrefabStage();
				if (stage == null)
				{
					return;
				}

				var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(stage.prefabAssetPath);
				UIContainer.AddItem(prefab);
				_uiItems.Refresh();
			};

			var uiItemXml = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>($"{directory}/UIItem.uxml");
			_uiItems = uiEditorPanel.Q<ListView>("ListView");
			_uiItems.makeItem = () => uiItemXml.CloneTree();
			_uiItems.bindItem = (element, i) =>
			{
				var of = element.Q<ObjectField>();
				of.objectType = typeof(GameObject);
				of.value = UIContainer.Instance.Items[i].Prefab;
				of.RegisterValueChangedCallback(evt => { of.SetValueWithoutNotify(evt.previousValue); });
				// of.SetEnabled(false);
				var removeBtn = element.Q<Button>("Remove");
				removeBtn.clicked += () =>
				{
					UIContainer.RemoveItem(UIContainer.Instance.Items[i]);
					_uiItems.Refresh();
				};
				var openBtn = element.Q<Button>("Open");
				openBtn.clicked += () => { AssetDatabase.OpenAsset(UIContainer.Instance.Items[i].Prefab); };
			};
			_uiItems.itemsSource = UIContainer.Instance.Items;
			_uiItems.selectionType = SelectionType.Single;

			var toolbarSearchField = uiEditorPanel.Q<ToolbarSearchField>("ToolbarSearchField");
			toolbarSearchField.RegisterValueChangedCallback(evt =>
			{
				toolbarSearchField.value = evt.newValue;
				// OnSearchTextChanged(evt, uiPrefabContainer);
			});

			var containerBtn = _root.Q<ToolbarButton>("UIContainer");
			containerBtn.clicked += () =>
			{
				if (_curPanel == containerBtn)
				{
					return;
				}

				_curPanel.style.display = DisplayStyle.None;
				containerPanel.style.display = DisplayStyle.Flex;
				_curPanel = containerPanel;
			};

			var uiEditorBtn = _root.Q<ToolbarButton>("UIEditor");
			uiEditorBtn.clicked += () =>
			{
				if (_curPanel == uiEditorBtn)
				{
					return;
				}

				_curPanel.style.display = DisplayStyle.None;
				uiEditorPanel.style.display = DisplayStyle.Flex;
				_curPanel = uiEditorPanel;
			};
		}

		private void OnDisable()
		{
			_panels = null;
			_root = null;
		}

		private void OnGUI()
		{
			var stage = PrefabStageUtility.GetCurrentPrefabStage();
			if (stage == null)
			{
				_addBtn.style.display = DisplayStyle.None;
			}
			else
			{
				var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(stage.prefabAssetPath);
				_addBtn.style.display = UIContainer.IsAlreadyExist(prefab) ? DisplayStyle.None : DisplayStyle.Flex;
			}
		}
	}
}