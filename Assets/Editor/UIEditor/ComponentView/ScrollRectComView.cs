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
	public class ScrollRectComView : ComponentViewBase
	{
		public override UIEditor.ComponentAsset ComponentType => UIEditor.ComponentAsset.ScrollRect;

		public ScrollRectComView(VisualElement node) : base(node)
		{
		}
	}
}