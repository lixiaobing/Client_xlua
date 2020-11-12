using hjcd.level;
using System;
namespace hjcd.level.CheckPoint
{

    [Serializable]
    public class Group: IFoldOut
    {
        public int id ; //分组ID
        public string name;  //分组名称
        //显示名称
        public string Name()
        {
            return name+" "+id;
        }
        private bool edit = false;
        public bool Edit {
            get { return edit; }
            set { edit = value; }
        }
    }
}