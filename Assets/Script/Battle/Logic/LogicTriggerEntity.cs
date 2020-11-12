/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:02:06
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicTriggerEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Trigger;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}