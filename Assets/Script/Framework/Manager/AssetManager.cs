using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using UnityObject = UnityEngine.Object;
using UnityEngine.Networking;
using UnityEngine.SceneManagement;
using UnityEngine.AddressableAssets;
using UnityEngine.ResourceManagement.AsyncOperations;
using Battle;
using Framework;
using System.Reflection;

public class AssetManager : MonoBehaviour
{
    public static AssetManager Instance
    {
        get;
        protected set;
    }

    List<UnityObject> assetsCache = new List<UnityObject>();

    private Dictionary<string, AsyncOperationHandle<TextAsset>> luaHandles = new Dictionary<string, AsyncOperationHandle<TextAsset>>();
    public Dictionary<string, TextAsset> luaAssets = new Dictionary<string, TextAsset>();

    private Dictionary<string, AsyncOperationHandle<TextAsset>> audioHandles = new Dictionary<string, AsyncOperationHandle<TextAsset>>();
    public Dictionary<string, TextAsset> audioAssets = new Dictionary<string, TextAsset>();

    private string[] settingNames = { "BattleCameraSet", "UIStyleSet", "CameraEffectSet", "BattlePowerCurveSet" };
    public Dictionary<string, object> settings = new Dictionary<string, object>();


    protected void Awake()
    {
        Instance = this;
    }

    public IEnumerator CheckAssets()
    {
        var handle = Addressables.CheckForCatalogUpdates(false);

        UIBoot.Instance.SetLabel("正在检查更新...");
        UIBoot.Instance.SetProgress(0);

        while (!handle.IsDone)
        {
            yield return null;
        }

        if (handle.Status == AsyncOperationStatus.Succeeded)
        {
            List<string> catalogs = handle.Result;

            Debug.Log("Catalog Update Count:" + catalogs.Count.ToString());
            if (catalogs != null && catalogs.Count > 0)
            {
                foreach (var catalog in catalogs)
                {
                    Debug.Log(catalog);
                }

                var updateHandle = Addressables.UpdateCatalogs(catalogs, true);

                while (!updateHandle.IsDone)
                {
                    UIBoot.Instance.SetProgress(updateHandle.PercentComplete);

                    yield return null;
                }

                List<object> updateKeys = new List<object>();

                var locators = updateHandle.Result;
                foreach (var locator in locators)
                {
                    updateKeys.AddRange(locator.Keys);
                }

                yield return UpdateAssets(updateKeys.ToArray());

                Addressables.Release(updateHandle);
            }
            else
            {
                yield return UpdateComplete();
            }
        }
        else
        {
            yield return UpdateComplete();
        }

        Addressables.Release(handle);

        yield return null;
    }

    IEnumerator UpdateAssets(object[] keys)
    {
        var sizeHandle = Addressables.GetDownloadSizeAsync(keys);
        yield return sizeHandle;

        UIBoot.Instance.SetLabel("正在更新资源...");
        UIBoot.Instance.SetProgress(0);

        long totalDownloadSize = sizeHandle.Result;
        if (totalDownloadSize > 0)
        {
            var downloadHandle = Addressables.DownloadDependenciesAsync(keys, Addressables.MergeMode.Union);
            while (!downloadHandle.IsDone)
            {
                float percent = downloadHandle.PercentComplete;
                UIBoot.Instance.SetProgress(percent);
                UIBoot.Instance.SetLabel(($"正在更新资源({(int)(totalDownloadSize * percent)}/{totalDownloadSize})..."));
            }
        }
        yield return null;
    }

    IEnumerator UpdateComplete()
    {
        yield return ReadyLuaFiles();
        yield return ReadySettings();
    }

    public IEnumerator ReadyLuaFiles()
    {
        UIBoot.Instance.SetLabel("正在载入脚本...");
        UIBoot.Instance.SetProgress(0);

        ClearLua();

        var handleMap = Addressables.LoadAssetAsync<TextAsset>("Lua/LuaFilesMap");
        yield return handleMap;

        TextAsset map = handleMap.Result as TextAsset;
        string[] files = map.text.Split(new string[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);

        for (var i = 0; i < files.Length; i++)
        {
            string fileKey = files[i];
            luaHandles[fileKey] = Addressables.LoadAssetAsync<TextAsset>(fileKey);
        }

        while (luaHandles.Count > 0)
        {
            var removeKeys = new List<string>();
            foreach (KeyValuePair<string, AsyncOperationHandle<TextAsset>> kv in luaHandles)
            {
                if (kv.Value.IsValid() && kv.Value.Status == AsyncOperationStatus.Succeeded)
                {
                    luaAssets.Add(kv.Key, kv.Value.Result);
                    removeKeys.Add(kv.Key);

                    Debug.Log(kv.Key + " " + kv.Value.Result.bytes.Length);
                }
            }
            foreach (var key in removeKeys)
            {
                luaHandles.Remove(key);
            }

            float progress = (float)(files.Length - luaHandles.Count) / (float)files.Length;
            UIBoot.Instance.SetProgress(progress);

            yield return null;
        }

        UIBoot.Instance.SetProgress(1);

        yield return new WaitForSeconds(0.5f);
    }

    /*
    public IEnumerator ReadyShaders()
    {
        GameAsset
    }
    */

    public IEnumerator ReadAudioFiles()
    {
        UIBoot.Instance.SetLabel("正在载入音频...");
        UIBoot.Instance.SetProgress(0);


        string[] files = new string[] { "AkAudio/Windows/Music.bytes" , "AkAudio/Windows/Init.bytes",
                "AkAudio/Windows/Player.bytes", "AkAudio/Windows/UI.bytes",
            };

        for (var i = 0; i < files.Length; i++)
        {
            string fileKey = files[i];
            audioHandles[fileKey] = Addressables.LoadAssetAsync<TextAsset>(fileKey);
        }

        while (audioHandles.Count > 0)
        {
            var removeKeys = new List<string>();
            foreach (KeyValuePair<string, AsyncOperationHandle<TextAsset>> kv in audioHandles)
            {
                if (kv.Value.IsValid() && kv.Value.Status == AsyncOperationStatus.Succeeded)
                {
                    audioAssets.Add(kv.Key, kv.Value.Result);
                    removeKeys.Add(kv.Key);

                    Debug.Log(kv.Key + " " + kv.Value.Result.bytes.Length);
                }
            }
            foreach (var key in removeKeys)
            {
                audioHandles.Remove(key);
            }

            float progress = (float)(files.Length - audioHandles.Count) / (float)files.Length;
            UIBoot.Instance.SetProgress(progress);

            yield return new WaitForSeconds(0);
        }

        UIBoot.Instance.SetProgress(1);

        yield return new WaitForSeconds(0.5f);
    }


    public IEnumerator ReadySettings()
    {
        UIBoot.Instance.SetLabel("正在载入设置...");
        UIBoot.Instance.SetProgress(0);

        string[] keys = new string[settingNames.Length];
        for (var i = 0; i < settingNames.Length; i++)
        {
            keys[i] = "Setting/"+settingNames[i];
        }

        int completeCount = 0;

        GameAsset.LoadObjects(keys, (sort, obj) =>
        {
            completeCount++;
            UIBoot.Instance.SetProgress((float)completeCount / (float)settingNames.Length);

            settings.Add(settingNames[sort - 1], obj);
        });
        while (completeCount < settingNames.Length)
        {
            yield return null;
        }
        yield return new WaitForSeconds(0.5f);
    }

    public void ClearLua()
    {
        foreach (KeyValuePair<string, TextAsset> kv in luaAssets)
        {
            Addressables.Release(kv.Value);
        }
        luaAssets.Clear();
    }

    public IEnumerator AddAkBasePath()
    {
        /*string basePathToSet = Application.streamingAssetsPath + "/Audio/GeneratedSoundBanks/" + AkBasePathGetter.GetPlatformName();
        AkSoundEngine.SetBasePath(basePathToSet);*/

        //string fullBasePath = Application.persistentDataPath + "/Audio/GeneratedSoundBanks/" + AkBasePathGetter.GetPlatformName();
        //AkSoundEngine.AddBasePath(fullBasePath);
        yield return null;
    }

    public T GetSetting<T>()
    {
        string name = typeof(T).Name;
        T set;
        if (settings.ContainsKey(name))
        {
            set = (T)settings[name];
        }
        else
        {
            set = default(T);
        }
        return set;
    }

    /*
    public IEnumerator CheckAudioAssets()
    {
        UIBoot.Instance.SetLabel("正在更新音频文件...");
        UIBoot.Instance.SetProgress(0);

        yield return AudioUpdate.Start((index, count) =>
        {
            UIBoot.Instance.SetProgress((float)index / (float)count);
        },
        (error) =>
        {
            Debug.LogError("下载失败:" + error);
        });

        yield return AddAkBasePath();
    }
    */
}








