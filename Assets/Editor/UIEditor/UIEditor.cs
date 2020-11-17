/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-16 19:53:56
* description : 
*******************************************
** ************************************* */


using System;
using UnityEditor;
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
				_panels[i].style.display = i == (int) Panel.UiEditor ? DisplayStyle.Flex : DisplayStyle.None;
			}

			var uiPrefab = uiEditorPanel.Q<ObjectField>("UIPrefab");
			uiPrefab.objectType = typeof(GameObject);
			uiPrefab.RegisterValueChangedCallback(evt => { uiPrefab.value = evt.newValue; });

			var addBtn = uiEditorPanel.Q<Button>("AddUIPrefab");
			addBtn.clicked += () =>
			{
				if (uiPrefab.value == null)
				{
					return;
				}

				UIContainer.AddItem((GameObject) uiPrefab.value);
			};

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
	}
}