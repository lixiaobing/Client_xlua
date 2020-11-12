/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:05:09
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicAirWallEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.AirWall;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}