/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-16 20:16:00
* description : 
*******************************************
** ************************************* */

using UnityEditor;
using UnityEngine;

namespace GameEditor
{
	public class UIItem : ScriptableObject
	{
		public string Md5;
		public string Path;
		public GameObject Prefab;

		public void Init(GameObject prefab)
		{
			Prefab = prefab;
			Path = AssetDatabase.GetAssetPath(prefab);
			Md5 = GameEditorUtils.Md5(Path);
		}
	}
}