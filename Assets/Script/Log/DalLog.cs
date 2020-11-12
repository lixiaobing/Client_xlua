/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 16:01:52
* description : 
*******************************************
** ************************************* */

using System;
using System.Collections.Generic;
using UnityEngine;

namespace Dal
{
	public class DalLog : MonoBehaviour
	{
		[Serializable]
		public class LogSetting
		{
			public LogOption LogOption;
			[Range(0, 7)] public int StackDeep;
		}

		[Serializable]
		public class ModuleSetting
		{
			public string ModuleName;
			public LogModule Module;
			public LogSetting LogSetting;
			public LogSetting WarningSetting;
			public LogSetting ErrorSetting;
			public LogSetting AssertSetting;
			[HideInInspector] public List<LogSetting> LogSettings = new List<LogSetting>();

			public void Init()
			{
				LogSettings.Add(LogSetting);
				LogSettings.Add(WarningSetting);
				LogSettings.Add(ErrorSetting);
				LogSettings.Add(AssertSetting);
			}
		}

		private static DalLog _instance;

		public string LogDirectory;
		public string[] ScriptsDir;
		public ModuleSetting[] LogItems;
		private Logger _logger = new Logger();
		private const int DefaultModule = (int) LogModule.Common;

		private Dictionary<int, ModuleSetting> _moduleLogSetting = new Dictionary<int, ModuleSetting>();

		private void Awake()
		{
			if (_instance != null)
			{
				Debug.LogError("多个日志实体");
				return;
			}

			_instance = this;

			for (int i = 0; i < LogItems.Length; i++)
			{
				var item = LogItems[i];
				if (_moduleLogSetting.ContainsKey((int) item.Module))
				{
					throw new Exception($"重复的键值:数组索引{i},模块名:{item.ModuleName}");
				}
				item.Init();
				_moduleLogSetting.Add((int) item.Module, item);
			}

			DontDestroyOnLoad(this);
			_logger.Init(LogDirectory);
		}

		private void Start()
		{
			Error("hello logger");
		}

		private void OnDestroy()
		{
			_logger.Dispose();
			_logger = null;
			_moduleLogSetting.Clear();
			_moduleLogSetting = null;
			_instance = null;
		}

		public static void Log(string message)
		{
			if (_instance._moduleLogSetting.TryGetValue(DefaultModule, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Log];
				_instance._logger.Log(setting.ModuleName, LogLevel.Log, option.LogOption, option.StackDeep, message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{DefaultModule},message:{message}");
			}
		}

		public static void Log(LogModule module, string message)
		{
			if (_instance._moduleLogSetting.TryGetValue((int) module, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Log];
				_instance._logger.Log(setting.ModuleName, LogLevel.Log, option.LogOption, option.StackDeep, message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{module},message:{message}");
			}
		}

		public static void Warning(string message)
		{
			if (_instance._moduleLogSetting.TryGetValue(DefaultModule, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Warning];
				_instance._logger.Log(setting.ModuleName, LogLevel.Warning, option.LogOption, option.StackDeep,
					message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{DefaultModule},message:{message}");
			}
		}

		public static void Warning(LogModule module, string message)
		{
			if (_instance._moduleLogSetting.TryGetValue((int) module, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Warning];
				_instance._logger.Log(setting.ModuleName, LogLevel.Warning, option.LogOption, option.StackDeep,
					message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{module},message:{message}");
			}
		}

		public static void Error(string message)
		{
			if (_instance._moduleLogSetting.TryGetValue(DefaultModule, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Error];
				_instance._logger.Log(setting.ModuleName, LogLevel.Error, option.LogOption, option.StackDeep, message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{DefaultModule},message:{message}");
			}
		}

		public static void Error(LogModule module, string message)
		{
			if (_instance._moduleLogSetting.TryGetValue((int) module, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Error];
				_instance._logger.Log(setting.ModuleName, LogLevel.Error, option.LogOption, option.StackDeep, message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{module},message:{message}");
			}
		}
		
		public static void Assert(LogModule module, bool condition, string message)
		{
			if (_instance._moduleLogSetting.TryGetValue((int)module, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Assert];
				_instance._logger.Log(setting.ModuleName, LogLevel.Assert, option.LogOption, option.StackDeep, message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{module},message:{message}");
			}
			Debug.Assert(condition, message);
		}
		
		public static void Assert(bool condition, string message)
		{
			if (_instance._moduleLogSetting.TryGetValue(DefaultModule, out var setting))
			{
				var option = setting.LogSettings[(int) LogLevel.Assert];
				_instance._logger.Log(setting.ModuleName, LogLevel.Assert, option.LogOption, option.StackDeep, message);
			}
			else
			{
				Debug.LogError($"没有配置模块的日志配置:{DefaultModule},message:{message}");
			}
			Debug.Assert(condition, message);
		}
	}
}