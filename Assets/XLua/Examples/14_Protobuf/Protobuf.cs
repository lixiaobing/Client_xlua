/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-11 11:40:13
* description : 
*******************************************
** ************************************* */

using System.IO;
using UnityEngine;
using XLua;

namespace XLuaTest
{
#if UNITY_EDITOR
	public class Protobuf : MonoBehaviour
	{
		public TextAsset ProtoString;
		public TextAsset ProtoBinary;
		public string[] RequireDirs;
		public string[] RequireFiles;
		private LuaEnv _luaEnv; 
		
		private void Awake()
		{
			_luaEnv = new LuaEnv();
			_luaEnv.AddLoader((ref string filename) =>
			{
				foreach (var requireFile in RequireFiles)
				{
					if (requireFile != filename)
					{
						continue;
					}
					foreach (var requireDir in RequireDirs)
					{
						var p = Path.Combine(requireDir, filename) + ".lua";
						if (!File.Exists(p))
						{
							continue;
						}
						var fileBytes = File.ReadAllBytes(p);
						return fileBytes;
					}
					break;
				}
				return null;
			});
		}

		private void OnDestroy()
		{
			_luaEnv.Dispose();
		}

		public void RunString()
		{
			_luaEnv.DoString(ProtoString.text);
		}
		
		public void RunBinary()
		{
			_luaEnv.DoString(ProtoBinary.text);
		}
	}
#endif
}