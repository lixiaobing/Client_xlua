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
			CanvasRenderer,
			Image,
			Text,
			Button,
			Toggle,
			Slider,
			Scrollbar,
			Dropdown,
			ScrollRect,
			Mask,
			InputField,

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
		private static readonly Type[] ComponentConstructorParameterTypes = {typeof(VisualElement)};
		private static readonly object[] ComponentConstructorParameters = new object[1];
		private readonly VisualTreeAsset[] _componentsView =
			new VisualTreeAsset[(int) ViewAsset.ViewAssetCount + (int) ComponentAsset.ComponentCount - 1];

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
			LoadComponentViewAssets(directory);

			var wnd = wndAsset.CloneTree();
			SetSizeFull(wnd);
			root.Add(wnd);

			var rootPanel = root.Q<VisualElement>("RootPanel");

			_editorPanel = new EditorPanelView(this, editorPanel.CloneTree());
			SetSizeFull(_editorPanel.Node);
			rootPanel.Add(_editorPanel.Node);

			_panels[(int) Panel.UiEditor] = _editorPanel.Node;
			_curPanel = _editorPanel.Node;
			for (int i = 0; i < _panels.Length; i++)
			{
				var panel = _panels[i];
				SetActive(panel, panel == _curPanel);
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
		
		private void LoadComponentViewAssets(string directory)
		{
			for (int i = 0; i < (int)ComponentAsset.ComponentCount; i++)
			{
				var t = (ComponentAsset) i;
				var p = $"{directory}/View/ComponentView/{t}ComView.uxml";
				AddViewAsset(t, p);
			}
		}

		private void AddViewAsset(ViewAsset t, string p)
		{
			_componentsView[(int) t] = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>(p);
		}

		private void AddViewAsset(ComponentAsset t, string p)
		{
			_componentsView[(int) t + (int) ViewAsset.ComponentAsset] =
				AssetDatabase.LoadAssetAtPath<VisualTreeAsset>(p);
		}

		public VisualTreeAsset GetViewAsset(ViewAsset t)
		{
			return _componentsView[(int) t];
		}

		public VisualTreeAsset GetViewAsset(ComponentAsset t)
		{
			return _componentsView[(int) t + (int) ViewAsset.ComponentAsset];
		}

		public ComponentViewBase NewComponentView(ComponentAsset assetType)
		{
			var comViewName = $"GameEditor.{assetType}ComView";
			var t = Type.GetType(comViewName);
			if (t == null)
			{
				throw new Exception($"没有找到类:{comViewName}");
			}

			var constructor = t.GetConstructor(ComponentConstructorParameterTypes);
			if (constructor == null)
			{
				throw new Exception($"没有合适的构造函数");
			}

			var asset = GetViewAsset(assetType);
			ComponentConstructorParameters[0] = asset.CloneTree();
			var com = constructor.Invoke(ComponentConstructorParameters);
			return (ComponentViewBase) com;
		}

		private void OnGUI()
		{
			_editorPanel.Update();

			Repaint();
		}

		public static ComponentAsset GetComponentType(Component com)
		{
			var t = com.GetType();
			var n = t.Name.Replace("UnityEngine.", string.Empty);
			if (Enum.TryParse(n, out ComponentAsset comType))
			{
				return comType;
			}

			throw new Exception($"没有处理的组件类型:{n}");
		}

		private static void SetSizeFull(VisualElement node)
		{
			node.AddToClassList("sizefull");
		}

		public static void SetActive(VisualElement node, bool isActive)
		{
			if (isActive)
			{
				node.RemoveFromClassList("hidden");
			}
			else
			{
				node.AddToClassList("hidden");
			}
		}

		public static bool IsActive(VisualElement node)
		{
			return !node.ClassListContains("hidden");
		}
	}
}