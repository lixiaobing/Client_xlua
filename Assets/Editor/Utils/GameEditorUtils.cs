/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-11 18:15:26
* description : 
*******************************************
** ************************************* */

using System;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace GameEditor
{
	public static class GameEditorUtils
	{
		public static System.Diagnostics.Process CreateShellExProcess(string cmd, string args, string workingDir = "")
		{
			var pStartInfo = new System.Diagnostics.ProcessStartInfo(cmd);
			pStartInfo.Arguments = args;
			pStartInfo.CreateNoWindow = false;
			pStartInfo.UseShellExecute = true;
			pStartInfo.RedirectStandardError = false;
			pStartInfo.RedirectStandardInput = false;
			pStartInfo.RedirectStandardOutput = false;
			if (!string.IsNullOrEmpty(workingDir))
				pStartInfo.WorkingDirectory = workingDir;
			return System.Diagnostics.Process.Start(pStartInfo);
		}

		public static void RunBat(string batfile, string args, string workingDir = "")
		{
			var p = CreateShellExProcess(batfile, args, workingDir);
			p.Close();
		}

		public static string FormatPath(string path)
		{
			path = path.Replace("/", "\\");
			return Application.platform == RuntimePlatform.OSXEditor ? path.Replace("\\", "/") : path;
		}

		private static bool IsExist(string path)
		{
			return File.Exists(path) || Directory.Exists(path);
		}
		
		private static void EnsurePath(string path)
		{
			if (IsExist(path))
			{
				return;
			}

			if (Path.HasExtension(path))
			{
				var dir = Path.GetDirectoryName(path);
				EnsurePath(dir);
				File.Create(path);
			}
			else
			{
				Directory.CreateDirectory(path);
			}
		}

		public static void DeleteFileOrDirectory(string path)
		{
			FileUtil.DeleteFileOrDirectory(path);
		}

		public static void CopyFileOrDirectory(string src, string dst, bool isDeleteDst=false)
		{
			if (!IsExist(src))
			{
				Debug.LogError($"源路径不存在:{src}");
				return;
			}

			EnsurePath(Path.GetDirectoryName(dst));
			if (isDeleteDst)
			{
				FileUtil.DeleteFileOrDirectory(dst);
			}
			FileUtil.CopyFileOrDirectory(src, dst);
		}
		
		public interface IWalkDirectory
		{
			string SearchPattern { get; }
		}

		public static void WalkDirectory(string path, string searchPattern, SearchOption searchOption)
		{
			if (!IsExist(path))
			{
				return;
			}

			var files = Directory.GetFiles(path, searchPattern, SearchOption.AllDirectories);
			foreach (var file in files)
			{
				Debug.LogError($"{file}");
			}
		}
	}
}