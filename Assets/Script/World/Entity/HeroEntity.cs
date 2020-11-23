/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:39:55
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class HeroEntity : IEntity
	{
		public EntityType EntityType => EntityType.Hero;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}