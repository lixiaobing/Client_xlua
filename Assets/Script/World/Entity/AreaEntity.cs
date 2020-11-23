/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:05:31
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class AreaEntity : IEntity
	{
		public EntityType EntityType => EntityType.Area;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}