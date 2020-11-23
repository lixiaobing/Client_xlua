/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:00:53
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class SummonEntity : IEntity
	{
		public EntityType EntityType => EntityType.Summon;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}