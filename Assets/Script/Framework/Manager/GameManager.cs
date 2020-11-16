using Framework;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance
    {
        get;
        protected set;
    }

    AssetManager asset;
    LuaManager lua;
    TFNetManager net;
    //AkAudioManager akAudio;

    private void Awake()
    {
        DontDestroyOnLoad(this.gameObject);

        Instance = this;

        asset = this.gameObject.AddComponent<AssetManager>();
        lua = this.gameObject.AddComponent<LuaManager>();
        net = this.gameObject.AddComponent<TFNetManager>();

        if (GameConst.isUseWwise)
        {
            //akAudio = this.gameObject.AddComponent<AkAudioManager>();
        }
    }

    IEnumerator Start()
    {
        if (GameConst.isDevelop)
        {
            yield return asset.ReadySettings();
        }
        else
        {
            yield return asset.CheckAssets();
            yield return asset.ReadyLuaFiles();
            yield return asset.ReadySettings();
        }

        if (GameConst.isUseWwise)
        {
            //yield return res.CheckAudioAssets();
            //yield return res.ReadAudioFiles();
        }

        yield return StartGame();
    }

    IEnumerator StartGame()
    {
        lua.Init();
        yield return null;
    }
}
