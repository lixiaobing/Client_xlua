/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:54:22
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class MonsterEntity : IEntity
	{
		public EntityType EntityType => EntityType.Monster;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}