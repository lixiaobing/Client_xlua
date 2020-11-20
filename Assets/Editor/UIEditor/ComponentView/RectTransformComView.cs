/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 16:29:52
* description : 
*******************************************
** ************************************* */


using UnityEngine.UIElements;

namespace GameEditor
{
	public class RectTransformComView : ComponentViewBase
	{
		public override UIEditor.ComponentAsset ComponentType => UIEditor.ComponentAsset.RectTransform;
		private Toggle _isAsTransform;
		
		public RectTransformComView(VisualElement node) :base(node)
		{
			_isAsTransform = node.Q<Toggle>("IsAsTransform");
			_isAsTransform.RegisterValueChangedCallback(evt =>
			{
				ComData.IsAsTransform = evt.newValue;
			});
		}

		protected override void SetComView()
		{
			_isAsTransform.SetValueWithoutNotify(ComData.IsAsTransform);
		}
	}
}