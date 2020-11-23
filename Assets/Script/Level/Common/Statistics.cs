

using UnityEngine;


namespace hjcd.level
{
    /// <summary>
    /// 关卡数据统计
    /// </summary>
    public class Statistics
    {
        private static Statistics instance;
        public static  Statistics Instance
        {
            get {
                if(instance == null){
                    instance = new Statistics();
                }
                return instance;
            }
        }
        //战斗时间
        public float time;
        public void Reset() 
        {
            time = 0;

        }
    }


}





