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

namespace MaybeInside
{
	public class DefineSymbols : ScriptableObject
	{
		[Flags]
		public enum Platform
		{
			Pc,
			Ios,
			Android,
		}

		[Serializable]
		public struct SymbolItem
		{
			public string SymbolContent;
			public bool IsEnable;
		}

		[Serializable]
		public struct PlatformSymbols
		{
			public SymbolItem[] Symbols;
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

		public PlatformSymbols[] PlatformSymbolContainer;
		public SymbolItem[] GeneralSymbols;

		private static readonly DefineSymbols _instance;
		
		static DefineSymbols()
		{
			// const string path = "";
			// _instance = AssetDatabase.LoadAssetAtPath<DefineSymbols>(path);
			Debug.LogError("load");
		}
	}
}