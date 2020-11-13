/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:20:22
* description : 
*******************************************
** ************************************* */
using Dal;

namespace Battle
{
	public interface ILogicEntity : IDispose
	{
		EntityType EntityType { get; }
	}
}