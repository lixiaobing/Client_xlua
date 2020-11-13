/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 13:59:26
* description : 
*******************************************
** ************************************* */


using UnityEngine;
using Dal;

namespace Battle
{
	public class BattleFactory
	{
		/// <summary>
		/// 需要与EntityType索引一致
		/// </summary>
		private static readonly Pool<ILogicEntity>[] EntityPools =
		{
			/*EntityType.HeroController*/new Pool<ILogicEntity>(
				() => new LogicHeroController(), entity => entity.Dispose()), 
			/*EntityType.MonsterController*/new Pool<ILogicEntity>(
				() => new LogicMonsterController(), entity => entity.Dispose()),
			/*EntityType.Gate*/new Pool<ILogicEntity>(
				() => new LogicGateEntity(), entity => entity.Dispose()),
			/*EntityType.Console*/new Pool<ILogicEntity>(
				() => new LogicConsoleEntity(), entity => entity.Dispose()),
			/*EntityType.Trigger*/new Pool<ILogicEntity>(
				() => new LogicTriggerEntity(), entity => entity.Dispose()),
			/*EntityType.BattleArea*/new Pool<ILogicEntity>(
				() => new LogicBattleAreaEntity(), entity => entity.Dispose()),
			/*EntityType.Obstacle*/new Pool<ILogicEntity>(
				() => new LogicObstacleEntity(), entity => entity.Dispose()),
			/*EntityType.Bullet*/new Pool<ILogicEntity>(
				() => new LogicBulletEntity(), entity => entity.Dispose()),
			/*EntityType.BulletScreen*/new Pool<ILogicEntity>(
				() => new LogicBulletScreenEntity(), entity => entity.Dispose()),
			/*EntityType.Trap*/new Pool<ILogicEntity>(
				() => new LogicTrapEntity(), entity => entity.Dispose()),
			/*EntityType.AirWall*/new Pool<ILogicEntity>(
				() => new LogicAirWallEntity(), entity => entity.Dispose()),
			/*EntityType.Area*/new Pool<ILogicEntity>(
				() => new LogicAreaEntity(), entity => entity.Dispose()),
			/*EntityType.Stronghold*/new Pool<ILogicEntity>(
				() => new LogicStrongholdEntity(), entity => entity.Dispose()),
			/*EntityType.DropItem*/new Pool<ILogicEntity>(
				() => new LogicDropItemEntity(), entity => entity.Dispose()),
			/*EntityType.Summon*/new Pool<ILogicEntity>(
				() => new LogicSummonEntity(), entity => entity.Dispose()),
		};

		public static void EnterFight(in BattleData battleData)
		{
		}

		public static void ExitFight()
		{
			foreach (var pool in EntityPools)
			{
				pool.Dispose();
			}
		}

		public static BattleData GenBattleData()
		{
			return new BattleData();
		}

		public static ILogicEntity NewLogicEntity(EntityType entityType)
		{
			if (entityType >= 0 && (int) entityType < EntityPools.Length)
			{
				return EntityPools[(int) entityType].New();
			}
			Debug.LogError($"越界的实体类型:{entityType}");
			return null;
		}

		public static void DeleteLogicEntity(ILogicEntity entity)
		{ 
			EntityPools[(int) entity.EntityType].Delete(entity);
		}
	}
}