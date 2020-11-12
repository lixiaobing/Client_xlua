/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-12 11:32:33
* description : 
*******************************************
** ************************************* */


using System;

namespace Dal
{
	[Flags]
	public enum LogLevel
	{
		Log = 1 << 0,
		Warning = 1 << 1,
		Error = 1 << 2,
		Assert = 1 << 3,
	}
}