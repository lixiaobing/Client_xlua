/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:06:24
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicDropItemEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.DropItem;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}