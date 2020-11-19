﻿/* ****************************************
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

		public RectTransformComView(VisualElement node) :base(node)
		{
		}
	}
}