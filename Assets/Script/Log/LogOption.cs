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
		Stack1 = 1 << 3,
		Stack2 = 1 << 4,
		Stack3 = 1 << 5,
		Stack4 = 1 << 6,
		Stack5 = 1 << 7,
		Stack6 = 1 << 8,
	}
}