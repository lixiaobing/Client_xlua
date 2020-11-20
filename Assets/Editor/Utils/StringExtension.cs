/* ****************************************
*******************************************
* author : kaka
* create time : 2020-11-18 10:22:15
* description : 
*******************************************
** ************************************* */


namespace GameEditor
{
	public static class StringExtension
	{
		public static string FirstLowerEx(this string s)
		{
			if (string.IsNullOrEmpty(s))
			{
				return s;
			}

			if (s[0] >= 'A' && s[0] <= 'Z')
			{
				return char.ToLower(s[0]) + s.Substring(1);
			}
			return s;
		}
		
		public static string FirstUpperEx(this string s)
		{
			if (string.IsNullOrEmpty(s))
			{
				return s;
			}

			if (s[0] >= 'a' && s[0] <= 'z')
			{
				return char.ToUpper(s[0]) + s.Substring(1);
			}
			return s;
		}
	}
}