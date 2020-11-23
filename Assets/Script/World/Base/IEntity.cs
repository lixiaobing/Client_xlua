/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 14:20:22
* description : 
*******************************************
** ************************************* */

namespace World
{
	public interface IEntity : IDispose
	{
		EntityType EntityType { get; }
	}
}