/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:02:06
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class TriggerEntity : IEntity
	{
		public EntityType EntityType => EntityType.Trigger;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}