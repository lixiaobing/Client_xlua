﻿/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 16:30:33
* description : 
*******************************************
** ************************************* */


using UnityEngine.UIElements;

namespace GameEditor
{
	public class ComponentViewBase
	{
		public VisualElement Node { get; protected set; }

		public void SetActive(bool isActive)
		{
			UIEditor.SetActive(Node, isActive);
		}
	}
}