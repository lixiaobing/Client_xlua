/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 11:44:12
* description : 
*******************************************
** ************************************* */


using UnityEditor;
using UnityEngine;

namespace GameEditor
{
	[CustomEditor(typeof(LogSetting))]
	public class LogSettingEditor : Editor
	{
		private LogSetting _owner;

		private void OnEnable()
		{
			_owner = serializedObject.targetObject as LogSetting;
		}

		private void OnDisable()
		{
			_owner = null;
		}

		public override void OnInspectorGUI()
		{
			base.OnInspectorGUI();
			GUILayout.BeginHorizontal();

			if (GUILayout.Button("Refresh"))
			{
				_owner.Refresh();
			}
			
			if (GUILayout.Button("Apply"))
			{
				_owner.Apply();
			}
			
			GUILayout.EndHorizontal();
		}

//		private void OnSceneGUI()
//		{
//		}
	}
}