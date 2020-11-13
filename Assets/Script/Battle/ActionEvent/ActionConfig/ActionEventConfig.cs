using UnityEngine;
using Dal;

namespace Battle
{
	public abstract class ActionEventConfig : ScriptableObject
	{
		public abstract ActionEventKind type { get; }
		public float time;
		public float realTime;

		public virtual void CollectAssetPaths(IPathCollector collector) {  }
	}
}
