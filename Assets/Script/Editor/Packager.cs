﻿using UnityEditor;
using UnityEngine;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using Framework;
using UnityEditor.AddressableAssets.Settings;
using System;
using UnityEditor.AddressableAssets.Settings.GroupSchemas;

public class Packager
{

    [MenuItem("Build/Build LuaFiles", false, 100)]
    public static void BuildLuaFiles()
    {
        HandleLuaFile();
    }

    [MenuItem("Build/Build AkAudio", false, 100)]
    public static void BuildAkAudio()
    {
        HandleAkAudioFile(true);
    }

    [MenuItem("Build/Build Content", false, 101)]
    public static void BuildContent()
    {
        ClientTool.ClearMissFile();

        HandleLuaFile();

        HandleAkAudioFile();

        PackagerSetEditor.GenerateShaderVariants();

        PackagerSet set = AssetDatabase.LoadAssetAtPath<PackagerSet>("Assets/PackagerSet.asset");

        AddressableAssetBuildSettings buildSetting = new AddressableAssetBuildSettings();

        AddressableAssetSettings.BuildPlayerContent();

        //string[] levels = {"Assets/Start.unity"};
        //BuildPipeline.BuildPlayer(levels, "dal2.apk", BuildTarget.Android, BuildOptions.None);
    }

    public static string platform = string.Empty;
    static List<string> paths = new List<string>();
    static List<string> files = new List<string>();
    static List<AssetBundleBuild> maps = new List<AssetBundleBuild>();


    //[MenuItem("Build/Build iOS", false, 100)]
    public static void BuildiOSResource()
    {

    }

    //[MenuItem("Build/Build Android", false, 101)]
    public static void BuildAndroidResource()
    {

    }

    //[MenuItem("Build/Build Windows", false, 102)]
    public static void BuildWindowsResource()
    {

    }

    [MenuItem("Build/Build Shader", false, 102)]
    public static void BuildShader()
    {
        //string shaderPath = AppDataPath.
        //DirectoryInfo direc = new DirectoryInfo("")
        PackagerSetEditor.GenerateShaderVariants();
    }

    static void DepthDirectories(List<DirectoryInfo> list, DirectoryInfo direc)
    {
        DirectoryInfo[] direcs = direc.GetDirectories();
        foreach (DirectoryInfo d in direcs)
        {
            list.Add(d);
            DepthDirectories(list, d);
        }
    }

    static void HandleLuaFile()
    {
        /*

        string luaPath = AppDataPath + "/ResourcesAsset/Lua/";

        if (Directory.Exists(luaPath))
        {
            Directory.Delete(luaPath, true);
        }
        Directory.CreateDirectory(luaPath);

        string[] luaPaths = { LuaConst.luaDir, LuaConst.toluaDir };
        string luaList = string.Empty;

        for (int i = 0; i < luaPaths.Length; i++)
        {
            paths.Clear(); files.Clear();
            string luaDataPath = luaPaths[i].ToLower();
            Recursive(luaDataPath);
            int n = 0;
            foreach (string f in files)
            {
                if (f.EndsWith(".json")) continue;
                if (f.EndsWith(".bat")) continue;
                if (f.EndsWith(".meta")) continue;

                string newfile = f.Replace(luaDataPath, "");
                string newpath = luaPath + newfile;

                if (f.IndexOf("lua/proto/C2S") > -1 || (f.IndexOf("lua/proto/S2C") > -1))
                {

                }
                else
                {
                    if (GameConst.LuaByteMode)
                    {
                        newfile = newfile.Replace(".lua", ".bytes");
                        newpath = newpath.Replace(".lua", ".bytes");
                    }
                    else
                    {
                        newfile = newfile.Replace(".lua", ".txt");
                        newpath = newpath.Replace(".lua", ".txt");
                    }
                }


                string path = Path.GetDirectoryName(newpath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                if (File.Exists(newpath))
                {
                    File.Delete(newpath);
                }
                if (GameConst.LuaByteMode)
                {
                    EncodeLuaFile(f, newpath);
                }
                else
                {
                    File.Copy(f, newpath, true);
                }

                n++;
                EditorUtility.DisplayProgressBar("Build Lua Files", newpath, (float)n / (float)files.Count);

                luaList += "Lua/" + newfile.Replace(".bytes", "").Replace(".txt", "") + "\r\n";
            }
        }

        luaList = luaList.Remove(luaList.LastIndexOf("\r\n"));

        var encoding = new UTF8Encoding(false);
        File.WriteAllText(luaPath + "LuaFilesMap.txt", luaList, encoding);

        EditorUtility.ClearProgressBar();
        AssetDatabase.Refresh();

    */
    }

    static public void HandleAkAudioFile(bool isWindows = false)
    {
        string AkAudioPath = AppDataPath + "/ResourcesAsset/AkAudio/";

        if (Directory.Exists(AkAudioPath))
        {
            Directory.Delete(AkAudioPath, true);
        }
        Directory.CreateDirectory(AkAudioPath);

#if UNITY_ANDROID && UNITY_EDITOR
        string Paths = AppDataPath + "/AkAudio/Audio/GeneratedSoundBanks/Android";
        if (isWindows)
            Paths = AppDataPath + "/AkAudio/Audio/GeneratedSoundBanks/Windows";
#elif UNITY_STANDALONE_WIN && UNITY_EDITOR
        string Paths = AppDataPath + "/AkAudio/Audio/GeneratedSoundBanks/Windows";
#elif UNITY_IOS && UNITY_EDITOR
    string Paths = AppDataPath + "/AkAudio/Audio/GeneratedSoundBanks/iOS";
#endif
        paths.Clear(); files.Clear();
        string DataPath = Paths.ToLower();
        Recursive(DataPath);
        int n = 0;
        foreach (string f in files)
        {
            if (f.EndsWith(".txt") || f.EndsWith(".xml") || f.EndsWith(".meta"))
            {
                n++;
                EditorUtility.DisplayProgressBar("gen Bnk Files", f, (float)n / (float)files.Count);
                continue;
            }

            string newfile = f.Replace(DataPath, "");
            string newpath = AkAudioPath + newfile;

            newfile = newfile.Replace(".bnk", ".bytes");
            newpath = newpath.Replace(".bnk", ".bytes");


            string path = Path.GetDirectoryName(newpath);

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            if (File.Exists(newpath))
            {
                File.Delete(newpath);
            }

            File.Copy(f, newpath, true);

            n++;
            EditorUtility.DisplayProgressBar("Build Bnk Files", newpath, (float)n / (float)files.Count);

        }

        EditorUtility.ClearProgressBar();
        AssetDatabase.Refresh();
    }

    /// <summary>
    /// 数据目录
    /// </summary>
    static string AppDataPath
    {
        get { return Application.dataPath.ToLower(); }
    }

    /// <summary>
    /// 遍历目录及其子目录
    /// </summary>
    static void Recursive(string path)
    {
        string[] names = Directory.GetFiles(path);
        string[] dirs = Directory.GetDirectories(path);
        foreach (string filename in names)
        {
            string ext = Path.GetExtension(filename);
            if (ext.Equals(".meta")) continue;
            files.Add(filename.Replace('\\', '/'));
        }
        foreach (string dir in dirs)
        {
            paths.Add(dir.Replace('\\', '/'));
            Recursive(dir);
        }
    }

    static void UpdateProgress(int progress, int progressMax, string desc)
    {
        string title = "Processing...[" + progress + " - " + progressMax + "]";
        float value = (float)progress / (float)progressMax;
        EditorUtility.DisplayProgressBar(title, desc, value);
    }

    public static void EncodeLuaFile(string srcFile, string outFile)
    {
        /*
        if (!srcFile.ToLower().EndsWith(".lua"))
        {
            File.Copy(srcFile, outFile, true);
            return;
        }
        bool isWin = true;
        string luaexe = string.Empty;
        string args = string.Empty;
        string exedir = string.Empty;
        string currDir = Directory.GetCurrentDirectory();
        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            isWin = true;
            luaexe = "luajit.exe";
            args = "-b -g " + srcFile + " " + outFile;
            exedir = AppDataPath.Replace("assets", "") + "LuaEncoder/luajit/";
        }
        else if (Application.platform == RuntimePlatform.OSXEditor)
        {
            isWin = false;
            luaexe = "./luajit";
            args = "-b -g " + srcFile + " " + outFile;
            exedir = AppDataPath.Replace("assets", "") + "LuaEncoder/luajit_mac/";
        }
        Directory.SetCurrentDirectory(exedir);
        ProcessStartInfo info = new ProcessStartInfo();
        info.FileName = luaexe;
        info.Arguments = args;
        info.WindowStyle = ProcessWindowStyle.Hidden;
        info.UseShellExecute = isWin;
        info.ErrorDialog = true;
        GameUtility.Log(info.FileName + " " + info.Arguments);

        Process pro = Process.Start(info);
        pro.WaitForExit();
        Directory.SetCurrentDirectory(currDir);
        */
    }

    [MenuItem("Build/Build Protobuf-lua-gen File")]
    public static void BuildProtobufFile()
    {
        /*
        string dir = AppDataPath + "/Lua/3rd/pblua";
        paths.Clear(); files.Clear(); Recursive(dir);

        string protoc = "d:/protobuf-2.4.1/src/protoc.exe";
        string protoc_gen_dir = "\"d:/protoc-gen-lua/plugin/protoc-gen-lua.bat\"";

        foreach (string f in files)
        {
            string name = Path.GetFileName(f);
            string ext = Path.GetExtension(f);
            if (!ext.Equals(".proto")) continue;

            ProcessStartInfo info = new ProcessStartInfo();
            info.FileName = protoc;
            info.Arguments = " --lua_out=./ --plugin=protoc-gen-lua=" + protoc_gen_dir + " " + name;
            info.WindowStyle = ProcessWindowStyle.Hidden;
            info.UseShellExecute = true;
            info.WorkingDirectory = dir;
            info.ErrorDialog = true;
            GameUtility.Log(info.FileName + " " + info.Arguments);

            Process pro = Process.Start(info);
            pro.WaitForExit();
        }
        AssetDatabase.Refresh();
        */
    }
}