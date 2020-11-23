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
	public class TransformComView : ComponentViewBase
	{
		public override UIEditor.ComponentAsset ComponentType => UIEditor.ComponentAsset.Transform;

		public TransformComView(VisualElement node) : base(node)
		{
		}
		
		private static string BindingComponent(UIBindingSystem.BindingParameter bindingParameters)
		{
			if (bindingParameters.IsMulti)
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.Transform{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}";
			}
			else
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.Transform{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:Find('{bindingParameters.NodeData.OwnerPath}')";
			}
		}
	}
}