/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 11:34:16
* description : 
*******************************************
** ************************************* */


using System;

namespace Dal
{
	[Flags]
	public enum LogOption
	{
		Console = 1 << 0,
		File = 1 << 1,
		Date = 1 << 2,
		Stack = 1 << 3,
	}
}