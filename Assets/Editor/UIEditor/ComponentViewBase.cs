/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 16:30:33
* description : 
*******************************************
** ************************************* */


using System;
using UnityEditor.UIElements;
using UnityEngine.UIElements;
using Object = UnityEngine.Object;

namespace GameEditor
{
	public class ComponentViewBase
	{
		public VisualElement Node { get; }
		private readonly ObjectField _comField;

		protected ComponentViewBase(VisualElement node)
		{
			Node = node;
			_comField = node.Q<ObjectField>();
			_comField.SetEnabled(false);
			_comField.objectType = typeof(Object);
		}

		public void SetActive(bool isActive)
		{
			UIEditor.SetActive(Node, isActive);
		}

		public void SetComView(in UIItem.ComponentItem comData)
		{
			_comField.SetValueWithoutNotify(comData.Component);
		}
	}
}