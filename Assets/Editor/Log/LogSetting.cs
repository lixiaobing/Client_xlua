/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 11:27:51
* description : 
*******************************************
** ************************************* */

using System;
using Dal;
using UnityEditor;
using UnityEngine;
using LogOption = Dal.LogOption;

namespace GameEditor
{
	public class LogSetting : ScriptableObject
	{
		[Serializable]
		public class LogItem
		{
			public string LogName;
			public LogLevel LogLevel;
			public LogOption LogOption;
			public DefineSymbols.Platform Platforms;
		}

		private static LogSetting _instance;
		
		public LogItem[] LogItems;
		
		[UnityEditor.Callbacks.DidReloadScripts(2)]
		private static void LogSettingLoader()
		{
			const string path = "Assets/Editor/Log/LogSetting.asset";
			var instance = AssetDatabase.LoadAssetAtPath<LogSetting>(path);
			if (instance == null)
			{
				throw new Exception($"加载失败:{path}");
			}

			_instance = instance;
		}
	}
}