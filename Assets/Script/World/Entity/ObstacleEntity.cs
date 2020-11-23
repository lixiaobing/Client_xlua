/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:03:16
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class ObstacleEntity : IEntity
	{
		public EntityType EntityType => EntityType.Obstacle;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}