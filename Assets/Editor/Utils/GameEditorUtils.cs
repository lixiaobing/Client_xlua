/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-11 18:15:26
* description : 
*******************************************
** ************************************* */

using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace GameEditor
{
	public static class GameEditorUtils
	{
		public static string GetScriptPath<T>(T script)
		{
			MonoScript ms;
			switch (script)
			{
				case MonoBehaviour behaviour:
					ms = MonoScript.FromMonoBehaviour(behaviour);
					break;
				case ScriptableObject scriptableObject:
					ms = MonoScript.FromScriptableObject(scriptableObject);
					break;
				default:
					throw new Exception($"{script}");
			}

			return AssetDatabase.GetAssetPath(ms);
		}

		public static string GetScriptDirectory<T>(T script)
		{
			var p = GetScriptPath(script);
			return Path.GetDirectoryName(p);
		}
		
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
		
		public static void EnsurePath(string path, bool isCreateFile=false)
		{
			if (IsExist(path))
			{
				return;
			}

			if (Path.HasExtension(path))
			{
				var dir = Path.GetDirectoryName(path);
				EnsurePath(dir);
				if (isCreateFile)
				{
					File.Create(path);
				}
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
		
		public static string Md5(string filePath)
		{
			if (!IsExist(filePath))
			{
				Debug.LogError($"没有文件:({filePath})");
				return string.Empty;
			}

			return Md5(File.ReadAllBytes(filePath));
		}
		
		public static string Md5(byte[] contents)
		{
			var md5 = MD5.Create();
			var byteNew =  md5.ComputeHash(contents);
			var sb = new StringBuilder();
			foreach (byte b in byteNew)
			{
				sb.Append(b.ToString("x2"));
			}
			return sb.ToString();
		}
		
		public static void DefaultGui(VisualElement container, SerializedObject serializedObject, bool hideScript)
		{
			var property = serializedObject.GetIterator();
			if (!property.NextVisible(true))
			{
				return;
			}

			do
			{
				if (hideScript && property.propertyPath == "m_Script")
				{
					continue;
				}

				var field = new PropertyField(property);
				if (property.propertyPath == "m_Script" && serializedObject.targetObject != null)
				{
					field.SetEnabled(false);
				}
				field.Bind(serializedObject);
				container.Add(field);
			} while (property.NextVisible(false));
		}

		public static void Write(string p, string content)
		{
			EnsurePath(p);
			File.WriteAllText(p, content);
		}
	}
}