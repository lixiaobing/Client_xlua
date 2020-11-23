/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-20 18:55:44
* description : 
*******************************************
** ************************************* */


using System;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;

namespace GameEditor
{
	public static class UIBindingSystem
	{
		public class BindingParameter
		{
			public string Platform = "Lua";
			public string NodeName;
			public string NewLinePrefix = "\t";
			public bool IsMulti;
			public UIItem.NodeItem NodeData;
			public UIItem.ComponentItem ComData;
		}
		
		private const string WindowNodeName = "wndNode";

		private const string BindingHeaderTemplateFormat =
@"---@class {0}
local {0} = DClass('{0}', BaseWindow)
_G.{0} = {0}

";
		
		
		private const string BindingComponentMethodName = "BindingComponent";
		private const string BindingElementTemplateFormat =
@"---__BINDING_ELEMENTS_BEGIN__
---@自动生成代码不要修改否则覆盖!!!!!!
---@自动生成代码不要修改否则覆盖!!!!!!
---@自动生成代码不要修改否则覆盖!!!!!!
---@param {0} UnityEngine.Transform
function {1}:BindingElements({0})
{2}
end
---__BINDING_ELEMENTS_END____";
		private const string BindingElementPattern = 
@"---__BINDING_ELEMENTS_BEGIN__(.*)---__BINDING_ELEMENTS_END____";
		private static readonly MethodInfo[] ComponentBindingMethod = 
			new MethodInfo[(int)UIEditor.ComponentAsset.ComponentCount];
		
		private static readonly BindingParameter BindingParameters = new BindingParameter();
		private static readonly object[] ComponentBindingParameters = {BindingParameters};
		

		[UnityEditor.Callbacks.DidReloadScripts(1)]
		private static void Loader()
		{
			for (int i = 0; i < (int)UIEditor.ComponentAsset.ComponentCount; i++)
			{
				var comViewName = $"GameEditor.{(UIEditor.ComponentAsset)i}ComView";
				var t = Type.GetType(comViewName);
				if (t == null)
				{
					throw new Exception($"没有找到类:{comViewName}");
				}

				var method = GameEditorUtils.ReflectMethod(t, BindingComponentMethodName);
				if (method == null)
				{
					throw new Exception($"类:{t.FullName}没有找到方法:{BindingComponentMethodName}");
				}

				ComponentBindingMethod[i] = method;
			}
		}

		public static void BindingStart(UIItem itemData)
		{
			var bindingElementContent = GenerateBindingContent(itemData);
			var windowName = itemData.Prefab.name.FirstUpperEx();
			var bindingContent = string.Format(BindingElementTemplateFormat,
				WindowNodeName,
				windowName,
				bindingElementContent);
			if (GameEditorUtils.ReadText(itemData.ScriptPath, out var oldContent))
			{
				var newContent = Regex.Replace(oldContent,
					BindingElementPattern,
					bindingContent,
					RegexOptions.Singleline);
				GameEditorUtils.Write(itemData.ScriptPath, newContent, Encoding.UTF8);
			}
			else
			{
				var header = string.Format(BindingHeaderTemplateFormat, windowName);
				GameEditorUtils.Write(itemData.ScriptPath, header + bindingContent, Encoding.UTF8);
			}
		}

		private static string GenerateBindingContent(UIItem itemData)
		{
			var content = string.Empty;
			foreach (var node in itemData.Nodes)
			{
				var bindingCount = node.BindingCount;
				if (bindingCount <= 0)
				{
					continue;
				}

				BindingParameters.NodeData = node;
				if (bindingCount == 1)
				{
					BindingParameters.NodeName = WindowNodeName;
					BindingParameters.IsMulti = false;
				}
				else
				{
					var nodeName = $"temp{node.LocalId}";
					content = $"{content}\t---@type UnityEngine.Transform{GameEditorUtils.NewLine}" +
					          $"\tlocal {nodeName} = {WindowNodeName}:Find('{node.OwnerPath}'){GameEditorUtils.NewLine}";
					BindingParameters.NodeName = nodeName;
					BindingParameters.IsMulti = true;
				}
				foreach (var com in node.Components)
				{
					if (!com.IsBinding)
					{
						continue;
					}

					var method = ComponentBindingMethod[(int) com.ComponentType];
					if (method == null)
					{
						throw new Exception($"没有找到{com.ComponentType}绑定方法");
					}

					BindingParameters.ComData = com;
					var c = method.Invoke(null, ComponentBindingParameters) as string;
					content = $"{content}{c}{GameEditorUtils.NewLine}";
				}
			}
			return content.TrimEnd();
		}
	}
}