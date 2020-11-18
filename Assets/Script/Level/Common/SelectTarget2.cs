using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level {


    [SerializeField]
    public class SelectTarget2 
    {

        public SelectTargetType2 selectTargetType = SelectTargetType2.SELF;
        //指定目标的ID
        public int targetId;
        //自定义的阵营
        public Camp camp = Camp.ALL;
        //自定义的目标状态
        public TargetState targetState = TargetState.HP_MIN;

    }
}