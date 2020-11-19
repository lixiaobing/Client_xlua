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
	public class ComponentViewBase
	{
		public VisualElement Node { get; }
		private readonly ObjectField _comField;
		private readonly Toggle _isBinding;
		private UIItem _itemData;
		private UIItem.ComponentItem _comData;

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
		}

		public void SetActive(bool isActive)
		{
			UIEditor.SetActive(Node, isActive);
		}

		public void SetComView(UIItem itemData, UIItem.ComponentItem comData)
		{
			_itemData = itemData;
			_comData = comData;
			_comField.SetValueWithoutNotify(comData.Component);
			_isBinding.SetValueWithoutNotify(comData.IsBinding);
			
			SetComView();
		}

		protected virtual void SetComView()
		{
		}
	}
}