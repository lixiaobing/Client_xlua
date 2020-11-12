/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:01:16
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicGateEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Gate;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}