/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:04:39
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicTrapEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Trap;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}