

using UnityEngine;


namespace hjcd.level
{
    /// <summary>
    /// �ؿ�����ͳ��
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
        //ս��ʱ��
        public float time;
        public void Reset() 
        {
            time = 0;

        }
    }


}





