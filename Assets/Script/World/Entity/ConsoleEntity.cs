/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:01:40
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class ConsoleEntity : IEntity
	{
		public EntityType EntityType => EntityType.Console;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}