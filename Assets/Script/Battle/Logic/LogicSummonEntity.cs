/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 15:00:53
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public class LogicSummonEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Summon;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}