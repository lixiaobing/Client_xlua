/* ****************************************
*******************************************
* author : kaka
* create time : 2020-07-29 10:25:47
* description : 
*******************************************
** ************************************* */


using System;
using System.IO;
using System.Text;
using System.Threading;

namespace Dal
{
	public class Logger
	{
		private readonly StringBuilder _stackInfo = new StringBuilder(1024);
		private readonly RingBuffer<string> _logsPool = new RingBuffer<string>(256);
		private Thread _writeLogInfoThread;
		private StreamWriter _fileWriter;
		private readonly object _threadLock = new object();
		private string _rootPath;

		public void Init(string rootPath)
		{
			_rootPath = rootPath;
			EnsureLogDir();
			TryDeleteLogFiles();
			InitFileWriter();

			_writeLogInfoThread = new Thread(WriteFile);
			if (_writeLogInfoThread == null)
			{
				throw new Exception("new _writeLogInfoThread failed.");
			}

			_writeLogInfoThread.IsBackground = true;
			_writeLogInfoThread.Start();
		}

		public void Dispose()
		{
			_writeLogInfoThread.Abort();
			_writeLogInfoThread = null;
			// 写完剩下的日志再退出
			if (_logsPool.IsEmpty)
			{
				_fileWriter.Close();
				_fileWriter = null;
				return;
			}

			while (!_logsPool.IsEmpty)
			{
				var log = _logsPool.Dequeue();
				_fileWriter.Write(log + "\r\n");
			}

			_fileWriter.Flush();
			_fileWriter.Close();
			_fileWriter = null;
		}

		private void EnsureLogDir()
		{
			if (Directory.Exists(_rootPath))
			{
				return;
			}

			Directory.CreateDirectory(_rootPath);
		}

		private void InitFileWriter()
		{
			var fileName = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss") + ".txt";
			var filePath = Path.Combine(_rootPath, fileName);
			if (File.Exists(filePath))
			{
				_fileWriter = File.AppendText(filePath);
			}
			else
			{
				_fileWriter = File.CreateText(filePath);
			}
		}

		private void TryDeleteLogFiles()
		{
			var keepCount = 19;
			var filesPath = Directory.GetFiles(_rootPath);
			if (filesPath.Length <= keepCount)
			{
				return;
			}

			var deleteCount = filesPath.Length - keepCount;
			Array.Sort(filesPath);
			for (int i = 0; i < deleteCount; i++)
			{
				File.Delete(filesPath[i]);
			}
		}

		public void Log(string moduleName, LogLevel level, LogOption option, int stack, string message)
		{
			if (_writeLogInfoThread == null)
			{
				return;
			}

			if ((option & LogOption.Console) != 0)
			{
				Console(moduleName, level, message);
			}

			if ((option & LogOption.File) != 0)
			{
				string date;
				if ((option & LogOption.Date) != 0)
				{
					date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");;
				}
				else
				{
					date = string.Empty;
				}
			
				lock (_threadLock)
				{
					var stackInfo = stack > 0 ? GetStackInfo(stack) : string.Empty;
					_logsPool.Enqueue($"[{moduleName}:{level}]{date}:{message}\n{stackInfo}");
				}
			}
		}

		private string GetStackInfo(int depth)
		{
			_stackInfo.Length = 0;
			var st = new System.Diagnostics.StackTrace(3, true);
			for (int i = 0; i < depth; i++)
			{
				var sf = st.GetFrame(i);
				if (sf == null)
				{
					continue;
				}

				_stackInfo.Append("\r\n\t");
				_stackInfo.Append(sf.GetFileName());
				_stackInfo.Append(":");
				_stackInfo.Append(sf.GetFileLineNumber());
			}

			return _stackInfo.ToString();
		}

		private void Console(string moduleName, LogLevel level, string message)
		{
			switch (level)
			{
				case LogLevel.Log:
					UnityEngine.Debug.Log($"[{moduleName}]:{message}");
					break;
				case LogLevel.Warning:
					UnityEngine.Debug.LogWarning($"[{moduleName}]:{message}");
					break;
				case LogLevel.Error:
					UnityEngine.Debug.LogError($"[{moduleName}]:{message}");
					break;
				case LogLevel.Assert:
					break;
				default:
					throw new ArgumentOutOfRangeException(nameof(level), level, null);
			}
		}

		private void WriteFile()
		{
			while (true)
			{
				if (_logsPool.IsEmpty)
				{
					Thread.Sleep(5);
				}
				else
				{
					int count = 0;
					while (!_logsPool.IsEmpty && count < 3)
					{
						var log = _logsPool.Dequeue();
						_fileWriter.Write(log + "\r\n");
						count++;
					}

					_fileWriter.Flush();
					Thread.Sleep(10);
				}
			}
		}
	}
}
