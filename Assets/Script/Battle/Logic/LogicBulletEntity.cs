/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:03:47
* description : 
*******************************************
** ************************************* */


namespace Battle
{
	public class LogicBulletEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Bullet;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}