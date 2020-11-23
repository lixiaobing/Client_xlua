/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:54:22
* description : 
*******************************************
** ************************************* */


namespace Battle
{
	public class LogicMonsterEntity : ILogicEntity
	{
		public EntityType EntityType => EntityType.Monster;

		public void Dispose()
		{
			throw new System.NotImplementedException();
		}
	}
}