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
	public class ButtonComView : ComponentViewBase
	{
		public override UIEditor.ComponentAsset ComponentType => UIEditor.ComponentAsset.Button;
		private readonly TextField _eventName;

		public ButtonComView(VisualElement node) : base(node)
		{
			_eventName = node.Q<TextField>("ClickFunctionName");
			_eventName.RegisterValueChangedCallback(evt => { ComData.EventName = evt.newValue; });
		}

		protected override void SetComView()
		{
			_eventName.SetValueWithoutNotify(ComData.EventName);
		}

		private static string BindingComponent(UIBindingSystem.BindingParameter bindingParameters)
		{
			if (bindingParameters.IsMulti)
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.UI.Button{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:GetComponent(typeof(Button))";
			}
			else
			{
				return $"{bindingParameters.NewLinePrefix}---@type UnityEngine.UI.Button{GameEditorUtils.NewLine}" +
				       $"{bindingParameters.NewLinePrefix}self.{bindingParameters.ComData.AliasName} = {bindingParameters.NodeName}:Find('{bindingParameters.NodeData.OwnerPath}'):GetComponent(typeof(Button))";
			}
		}
	}
}