/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:01:16
* description : 
*******************************************
** ************************************* */


namespace World
{
	public class GateEntity : IEntity
	{
		public EntityType EntityType => EntityType.Gate;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}