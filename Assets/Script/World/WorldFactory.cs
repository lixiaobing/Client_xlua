/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 13:59:26
* description : 
*******************************************
** ************************************* */


using UnityEngine;

namespace World
{
	public class WorldFactory
	{
		/// <summary>
		/// 需要与EntityType索引一致
		/// </summary>
		private static readonly Pool<IEntity>[] EntityPools =
		{
			/*EntityType.HeroController*/new Pool<IEntity>(
				() => new HeroEntity(), entity => entity.Dispose()), 
			/*EntityType.MonsterController*/new Pool<IEntity>(
				() => new MonsterEntity(), entity => entity.Dispose()),
			/*EntityType.Gate*/new Pool<IEntity>(
				() => new GateEntity(), entity => entity.Dispose()),
			/*EntityType.Console*/new Pool<IEntity>(
				() => new ConsoleEntity(), entity => entity.Dispose()),
			/*EntityType.Trigger*/new Pool<IEntity>(
				() => new TriggerEntity(), entity => entity.Dispose()),
			/*EntityType.BattleArea*/new Pool<IEntity>(
				() => new BattleAreaEntity(), entity => entity.Dispose()),
			/*EntityType.Obstacle*/new Pool<IEntity>(
				() => new ObstacleEntity(), entity => entity.Dispose()),
			/*EntityType.Bullet*/new Pool<IEntity>(
				() => new BulletEntity(), entity => entity.Dispose()),
			/*EntityType.BulletScreen*/new Pool<IEntity>(
				() => new BulletScreenEntity(), entity => entity.Dispose()),
			/*EntityType.Trap*/new Pool<IEntity>(
				() => new TrapEntity(), entity => entity.Dispose()),
			/*EntityType.AirWall*/new Pool<IEntity>(
				() => new AirWallEntity(), entity => entity.Dispose()),
			/*EntityType.Area*/new Pool<IEntity>(
				() => new AreaEntity(), entity => entity.Dispose()),
			/*EntityType.Stronghold*/new Pool<IEntity>(
				() => new StrongholdEntity(), entity => entity.Dispose()),
			/*EntityType.DropItem*/new Pool<IEntity>(
				() => new DropItemEntity(), entity => entity.Dispose()),
			/*EntityType.Summon*/new Pool<IEntity>(
				() => new SummonEntity(), entity => entity.Dispose()),
		};


		public static void Clear()
		{
			foreach (var pool in EntityPools)
			{
				pool.Dispose();
			}
		}

		public static IEntity NewEntity(EntityType entityType)
		{
			if (entityType >= 0 && (int) entityType < EntityPools.Length)
			{
				return EntityPools[(int) entityType].New();
			}
			Debug.LogError($"越界的实体类型:{entityType}");
			return null;
		}

		public static void DeleteEntity(IEntity entity)
		{ 
			EntityPools[(int) entity.EntityType].Delete(entity);
		}
	}
}