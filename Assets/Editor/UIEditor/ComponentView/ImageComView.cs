﻿/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-19 16:29:52
* description : 
*******************************************
** ************************************* */


using System;
using UnityEngine.UIElements;

namespace GameEditor
{
	public class ImageComView : ComponentViewBase
	{
		public override UIEditor.ComponentAsset ComponentType => UIEditor.ComponentAsset.Image;

		public ImageComView(VisualElement node) : base(node)
		{
		}
		
		private static string BindingComponent(UIBindingSystem.BindingParameter bindingParameters)
		{
			if (bindingParameters.IsMulti)
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.UI.Image{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:GetComponent(typeof(Image))";
			}
			else
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.UI.Image{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:Find('{bindingParameters.NodeData.OwnerPath}'):GetComponent(typeof(Image))";
			}
		}
	}
}