using Framework;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class Initialize : MonoBehaviour
{
    void Start()
    {
#if !UNITY_EDITOR

            AkSoundEngine.Term();
            var WwiseGlobal = GameObject.Find("WwiseGlobal");
            if(WwiseGlobal != null)
                Destroy(WwiseGlobal.gameObject);
#endif
        InitAppSetting();

        CreateLog();
        CreateUIBoot();

        this.gameObject.AddComponent<GameManager>();
    }

    void InitAppSetting()
    {
        Screen.orientation = ScreenOrientation.Landscape;
        //Screen.fullScreen = true;
        //Screen.fullScreenMode = FullScreenMode.ExclusiveFullScreen;
        Screen.autorotateToPortrait = false;
        Screen.autorotateToPortraitUpsideDown = false;
        Screen.autorotateToLandscapeLeft = true;
        Screen.autorotateToLandscapeRight = true;

        Screen.sleepTimeout = SleepTimeout.NeverSleep;
        Application.targetFrameRate = GameConst.frameRate;

        if (Application.isMobilePlatform)
        {
            GameConst.isDevelop = false;
        }
        else
        {
            string path = Path.Combine(Application.dataPath, GameConst.luaCodePath); 
            if (!Directory.Exists(path))
            {
                GameConst.isDevelop = false;
            }
        }
    }

    void CreateLog()
    {
        if (Application.isMobilePlatform)
        {
            var log = GameObject.Find("UILog");
            log.SetActive(true);
        }
    }

    void CreateUIBoot()
    {
        GameObject uiBoot = Resources.Load<GameObject>("UIBoot");
        GameObject go = GameObject.Instantiate(uiBoot);
        go.name = "UIBoot";
        go.transform.SetParent(GameObject.Find("UI/Canvas").transform, false);
        go.AddComponent<UIBoot>();
    }
}