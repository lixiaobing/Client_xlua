/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 16:30:33
* description : 
*******************************************
** ************************************* */


using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine.UIElements;
using Object = UnityEngine.Object;

namespace GameEditor
{
	public abstract class ComponentViewBase
	{
		public abstract UIEditor.ComponentAsset ComponentType { get; }
		public VisualElement Node { get; }
		private UIItem _itemData;
		public UIItem.ComponentItem ComData => _comData;
		private UIItem.ComponentItem _comData;
		private readonly ObjectField _comField;
		private readonly Toggle _isBinding;
		private readonly TextField _aliasName;

		protected ComponentViewBase(VisualElement node)
		{
			Node = node;
			_comField = node.Q<ObjectField>();
			_comField.SetEnabled(false);
			_comField.objectType = typeof(Object);
			_isBinding = node.Q<Toggle>("IsBinding");
			_isBinding.RegisterValueChangedCallback(evt =>
			{
				_comData.IsBinding = evt.newValue;
				EditorUtility.SetDirty(_itemData);
			});
			_aliasName = node.Q<TextField>("AliasName");
			_aliasName.RegisterValueChangedCallback(evt =>
			{
				_comData.AliasName = evt.newValue;
				EditorUtility.SetDirty(_itemData);
			});
		}

		public void SetActive(bool isActive)
		{
			if (!isActive)
			{
				_comData = null;
				_itemData = null;
			}
			UIEditor.SetActive(Node, isActive);
		}
		
		public void SetComView(UIItem itemData, UIItem.ComponentItem comData)
		{
			_itemData = itemData;
			_comData = comData;
			_comField.SetValueWithoutNotify(comData.Component);
			_isBinding.SetValueWithoutNotify(comData.IsBinding);
			if (string.IsNullOrEmpty(comData.AliasName))
			{
				var n = comData.Component.name;
				_aliasName.value =  $"{n.FirstLowerEx()}{comData.ComponentType}";
			}
			else
			{
				_aliasName.SetValueWithoutNotify(comData.AliasName);
			}
			
			SetComView();
		}

		protected virtual void SetComView()
		{
		}
	}
}