/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:01:40
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicConsoleEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Console;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}