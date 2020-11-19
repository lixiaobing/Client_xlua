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
			UiEditor = 0,

			PanelCount,
		}
		
		public enum ViewAsset
		{
			UiItem = 0,
			
			// Components
			Transform,
			
			ViewAssetCount,
		}

		private VisualElement[] _panels = new VisualElement[(int) Panel.PanelCount];

		private VisualElement _curPanel;

		// private Label _label;
		private GameObject _selected;
		private EditorPanelView _editorPanel;
		private VisualTreeAsset[] _componentsView = new VisualTreeAsset[(int)ViewAsset.ViewAssetCount];

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
			_panels = null;
		}

		private void AddViewAsset(ViewAsset t, string p)
		{
			_componentsView[(int) t] = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>(p);
		}

		public VisualTreeAsset GetViewAsset(ViewAsset t)
		{
			return _componentsView[(int)t];
		}

		private void OnGUI()
		{
			var stage = PrefabStageUtility.GetCurrentPrefabStage();
			if (stage == null)
			{
				_editorPanel.AddButton.AddToClassList("hidden");
				return;
			}

			var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(stage.prefabAssetPath);
			var isIn = UIContainer.IsAlreadyIn(prefab);
			if (isIn)
			{
				_editorPanel.AddButton.AddToClassList("hidden");
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
				_editorPanel.AddButton.RemoveFromClassList("hidden");
			}

			Repaint();
		}
	}
}