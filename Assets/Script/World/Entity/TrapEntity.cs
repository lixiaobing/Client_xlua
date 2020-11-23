/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:04:39
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class TrapEntity : IEntity
	{
		public EntityType EntityType => EntityType.Trap;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}