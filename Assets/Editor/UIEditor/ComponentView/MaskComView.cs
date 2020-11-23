/* ****************************************
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
	public class MaskComView : ComponentViewBase
	{
		public override UIEditor.ComponentAsset ComponentType => UIEditor.ComponentAsset.Mask;

		public MaskComView(VisualElement node) : base(node)
		{
		}
		
		private static string BindingComponent(UIBindingSystem.BindingParameter bindingParameters)
		{
			if (bindingParameters.IsMulti)
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.UI.Mask{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:GetComponent(typeof(Mask))";
			}
			else
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.UI.Mask{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:Find('{bindingParameters.NodeData.OwnerPath}'):GetComponent(typeof(Mask))";
			}
		}
	}
}