/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:00:50
* description : 
*******************************************
** ************************************* */


using UnityEngine;

namespace Dal
{
	public struct BattleData
	{
		public enum BattleMode
		{
			Pve = 1,
			MultiPlayer = 2,
		}

		public struct Player
		{
			public int Id;
			public int InputId;
			public string Name;
			public Hero[] Heroes;
			public int MainHeroId;
			public Vector3 BornInfo;
		}

		public struct Hero
		{
			public int Id;
			public int Cid;
			public int[] Attrs;
		}

		public BattleMode Mode;
		public Player[] Players;
		public int MainPlayerId;
		public int LevelId;
		public bool PlayStartAnimation;
		public string SceneName;
		public string Ip;
		public int Port;
	}
}