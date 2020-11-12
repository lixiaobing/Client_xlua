/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:20:22
* description : 
*******************************************
** ************************************* */


namespace Dal
{
	public interface ILogicEntity : IDispose
	{
		EntityType EntityType { get; }
	}
}