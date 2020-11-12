/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-11 19:02:29
* description : 
*******************************************
** ************************************* */

using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace GameEditor
{
	public class DefineSymbols : ScriptableObject
	{
		[Flags]
		public enum Platform
		{
			Pc = 1 << 0,
			Ios = 1 << 1,
			Android = 1 << 2,
		}

		[Serializable]
		public class SymbolItem
		{
			public string SymbolContent;
			public Platform Platforms;
		}

		private static readonly Dictionary<Platform, BuildTargetGroup> Platform2BuildTarget =
			new Dictionary<Platform, BuildTargetGroup>()
			{
				{Platform.Pc, BuildTargetGroup.Standalone},
				{Platform.Ios, BuildTargetGroup.iOS},
				{Platform.Android, BuildTargetGroup.Android},
			};

		private static readonly Dictionary<BuildTargetGroup, Platform> BuildTarget2Platform =
			new Dictionary<BuildTargetGroup, Platform>()
			{
				{BuildTargetGroup.Standalone, Platform.Pc},
				{BuildTargetGroup.iOS, Platform.Ios},
				{BuildTargetGroup.Android, Platform.Android},
			};

		private static DefineSymbols _instance;

		public List<SymbolItem> Symbols;

		[UnityEditor.Callbacks.DidReloadScripts(1)]
		private static void DefineSymbolsLoader()
		{
			const string path = "Assets/Editor/DefineSymbols/DefineSymbols.asset";
			var instance = AssetDatabase.LoadAssetAtPath<DefineSymbols>(path);
			if (instance == null)
			{
				throw new Exception($"加载失败:{path}");
			}

			_instance = instance;
			foreach (var symbol in _instance.Symbols)
			{
				if (_instance.IsContainsDuplicate(symbol.SymbolContent))
				{
					throw new Exception("重复的宏定义");
				}
			}
		}

		private bool IsContainsDuplicate(string symbol)
		{
			foreach (var symbolItem in Symbols)
			{
				if (symbolItem.SymbolContent == symbol)
				{
					return true;
				}
			}

			return false;
		}
		
		private SymbolItem GetSymbolItem(string symbol)
		{
			foreach (var symbolItem in Symbols)
			{
				if (symbolItem.SymbolContent == symbol)
				{
					return symbolItem;
				}
			}

			return null;
		}

		public void Reset()
		{
			Symbols.Clear();
			foreach (var platform in BuildTarget2Platform)
			{
				var symbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(platform.Key);
				var defines = symbols.Split(new[] {';'}, StringSplitOptions.RemoveEmptyEntries);
				foreach (var def in defines)
				{
					var symbolItem = GetSymbolItem(def);
					if (symbolItem == null)
					{
						symbolItem = new SymbolItem
						{
							SymbolContent = def,
							Platforms = platform.Value
						};
						Symbols.Add(symbolItem);
					}
					else
					{
						symbolItem.Platforms |= platform.Value;
					}
				}
			}
		}

		public void Apply()
		{
			foreach (var platform in BuildTarget2Platform)
			{
				var defines = string.Empty;
				foreach (var symbol in Symbols)
				{
					if ((symbol.Platforms & platform.Value) == 0)
					{
						continue;
					}
					defines = $"{symbol.SymbolContent};{defines}";
				}
			
				PlayerSettings.SetScriptingDefineSymbolsForGroup(platform.Key, defines);
			}
		}
	}
}