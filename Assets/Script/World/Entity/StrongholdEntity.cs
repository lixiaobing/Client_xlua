/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:05:57
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class StrongholdEntity : IEntity
	{
		public EntityType EntityType => EntityType.Stronghold;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}