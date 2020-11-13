using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
	public abstract class ActionEventConfig : ScriptableObject
	{
		public abstract ActionEventKind kind { get; }
		public virtual string[] CollectAssetPaths() { return null; }
	}
}
