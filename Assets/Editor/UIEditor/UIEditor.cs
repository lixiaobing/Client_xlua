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
		private VisualElement _root;

		[MenuItem("Tools/UIEditor")]
		private static void ShowWindow()
		{
			GetWindow<UIEditor>("UIEditor Window");
		}

		private void OnEnable()
		{
			_root = rootVisualElement;
			var directory = GameEditorUtils.GetScriptDirectory(this);
			var style = AssetDatabase.LoadAssetAtPath<StyleSheet>($"{directory}/UIEditorWindow.uss");
			_root.styleSheets.Add(style);
			var mainEditor = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>($"{directory}/UIEditorWindow.uxml");
			_root.Add(mainEditor.CloneTree());

			var uiContainer = _root.Q<PropertyField>("UIContainer");
			// uiContainer.Bind(new SerializedObject(UIContainer.Instance));
			uiContainer.BindProperty(new SerializedObject(UIContainer.Instance).FindProperty("Items"));
			
			var uiPrefab = _root.Q<ObjectField>("UIPrefab");
			uiPrefab.objectType = typeof(GameObject);
			uiPrefab.RegisterValueChangedCallback(evt =>
			{
				uiPrefab.value = evt.newValue;
			});

			var addBtn = _root.Q<Button>("AddUIPrefab");
			addBtn.clicked += () =>
			{
				if (uiPrefab.value == null)
				{
					return;
				}
				UIContainer.AddItem((GameObject)uiPrefab.value);
			};
		}

		private void OnDisable()
		{
			_root = null;
		}
	}
}