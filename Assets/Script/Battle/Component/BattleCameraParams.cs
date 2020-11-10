using Framework;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Battle
{
    public class BattleCameraParams : MonoBehaviour
    {
        public static BattleCameraParams Instance;

        [Header("常规视角")]
        public NormalCameraParams normalCamera;
        [Header("侧面视角")]
        public SideCameraParams sideCamera;
        [Header("顶部视角")]
        public TopCameraParams topCamera;

        public bool debugLock = false;

        private void Awake()
        {
            Instance = this;
        }

        public void Init()
        {
            BattleCameraSet set = AssetManager.Instance.GetSetting<BattleCameraSet>();

            normalCamera = set.normalParams;
            sideCamera = set.sideParams;
            topCamera = set.topParams;
        }

    }
}
