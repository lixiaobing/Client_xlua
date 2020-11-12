/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 10:18:38
* description : 
*******************************************
** ************************************* */


using MaybeInside;
using UnityEngine;

namespace UnityEditor
{
	[CustomEditor(typeof(DefineSymbols))]
	public class DefineSymbolsEditor : Editor
	{
		private DefineSymbols _owner;

		private void OnEnable()
		{
			_owner = serializedObject.targetObject as DefineSymbols;
		}

		private void OnDisable()
		{
			_owner = null;
		}

		public override void OnInspectorGUI()
		{
			base.OnInspectorGUI();
			GUILayout.BeginHorizontal();
			
			if (GUILayout.Button("Reset"))
			{
				_owner.Reset();
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