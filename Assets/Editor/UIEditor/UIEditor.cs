/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-16 19:53:56
* description : 
*******************************************
** ************************************* */


using System;
using UnityEditor;
using UnityEditor.Experimental.SceneManagement;
using UnityEngine;
using UnityEngine.UIElements;

namespace GameEditor
{
	public class UIEditor : EditorWindow
	{
		private enum Panel
		{
			UiEditor = 0,

			PanelCount,
		}
		
		public enum ComponentAsset
		{
			GameObject = 0,
			Transform,
			RectTransform,

			ComponentCount,
		}
		
		public enum ViewAsset
		{
			UiItem = 0,
			
			ComponentAsset,

			ViewAssetCount,
		}

		private VisualElement[] _panels = new VisualElement[(int) Panel.PanelCount];

		private VisualElement _curPanel;

		// private Label _label;
		private GameObject _selected;
		private EditorPanelView _editorPanel;
		private VisualTreeAsset[] _componentsView = new VisualTreeAsset[(int)ViewAsset.ViewAssetCount + (int)ComponentAsset.ComponentCount - 1];

		[MenuItem("Tools/UIEditor #O")]
		private static void ShowWindow()
		{
			GetWindow<UIEditor>("UIEditor Window");
		}

		private void OnEnable()
		{
			var root = rootVisualElement;
			root.Clear();

			var directory = GameEditorUtils.GetScriptDirectory(this);
			var style = AssetDatabase.LoadAssetAtPath<StyleSheet>($"{directory}/UIEditorWindow.uss");
			root.styleSheets.Add(style);

			var wndAsset = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>($"{directory}/View/UIEditorWindow.uxml");
			var editorPanel = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>($"{directory}/View/EditorPanelView.uxml");
			AddViewAsset(ViewAsset.UiItem, $"{directory}/View/UIItemView.uxml");
			AddViewAsset(ComponentAsset.GameObject, $"{directory}/View/ComponentView/GameObjectComView.uxml");
			AddViewAsset(ComponentAsset.Transform, $"{directory}/View/ComponentView/TransformComView.uxml");
			AddViewAsset(ComponentAsset.RectTransform, $"{directory}/View/ComponentView/RectTransformComView.uxml");

			var wnd = wndAsset.CloneTree();
			wnd.AddToClassList("sizefull");
			root.Add(wnd);

			var rootPanel = root.Q<VisualElement>("RootPanel");

			_editorPanel = new EditorPanelView(this, editorPanel.CloneTree());
			_editorPanel.Node.AddToClassList("sizefull");
			rootPanel.Add(_editorPanel.Node);

			_panels[(int) Panel.UiEditor] = _editorPanel.Node;
			_curPanel = _editorPanel.Node;
			for (int i = 0; i < _panels.Length; i++)
			{
				var panel = _panels[i];
				if (panel == _curPanel)
				{
					panel.RemoveFromClassList("hidden");
				}
				else
				{
					panel.AddToClassList("hidden");
				}
			}

			PrefabStage.prefabSaved += UIContainer.UpdateItem;
		}

		private void OnDisable()
		{
			PrefabStage.prefabSaved -= UIContainer.UpdateItem;
			_editorPanel.Dispose();
			_editorPanel = null;
			_panels = null;
		}

		private void AddViewAsset(ViewAsset t, string p)
		{
			_componentsView[(int) t] = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>(p);
		}
		
		private void AddViewAsset(ComponentAsset t, string p)
		{
			_componentsView[(int)t + (int)ViewAsset.ComponentAsset] = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>(p);
		}

		public VisualTreeAsset GetViewAsset(ViewAsset t)
		{
			return _componentsView[(int)t];
		}

		public VisualTreeAsset GetViewAsset(ComponentAsset t)
		{
			return _componentsView[(int)t + (int)ViewAsset.ComponentAsset];
		}

		public ComponentViewBase NewComponentView(ComponentAsset t)
		{
			switch (t)
			{
				case ComponentAsset.GameObject:
				{
					var asset = GetViewAsset(t);
					return new GameObjectComView(asset.CloneTree());
				}
				case ComponentAsset.Transform:
				{
					var asset = GetViewAsset(t);
					return new TransformComView(asset.CloneTree());
				}
				case ComponentAsset.RectTransform:
				{
					var asset = GetViewAsset(t);
					return new RectTransformComView(asset.CloneTree());
				}
				case ComponentAsset.ComponentCount:
					throw new ArgumentOutOfRangeException(nameof(t), t, null);
				default:
					throw new ArgumentOutOfRangeException(nameof(t), t, null);
			}
		}

		private void OnGUI()
		{
			_editorPanel.Update();

			Repaint();
		}
	}
}