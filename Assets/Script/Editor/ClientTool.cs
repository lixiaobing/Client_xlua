using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using UnityEditor.AddressableAssets.Settings;
using UnityEditor.AddressableAssets.Settings.GroupSchemas;
using System.IO;
using UnityEditor.AddressableAssets;
using UnityEngine.SceneManagement;
using Framework;

public class ClientTool
{
    [MenuItem("Tools/Clear Player Prefs", false, 100)]
    public static void ClearPlayerPrefs()
    {
        PlayerPrefs.DeleteAll();
    }

    [MenuItem("Addressables/Generate")]
    public static void AddressablesGenerate()
    {
        /*
        string folderPath = Application.dataPath + "/AddressableAssetsData";

        if (Directory.Exists(folderPath))
        {
            Directory.Delete(folderPath, true);
            File.Delete(folderPath + ".meta");

            AddressableAssetSettingsDefaultObject.Settings = null;

            AssetDatabase.Refresh();
            AssetDatabase.SaveAssets();
        }
        */

        var settings = AddressableAssetSettings.Create(AddressableAssetSettingsDefaultObject.kDefaultConfigFolder, AddressableAssetSettingsDefaultObject.kDefaultConfigAssetName, true, true);
        AddressableAssetSettingsDefaultObject.Settings = settings;
        EditorUtility.SetDirty(AddressableAssetSettingsDefaultObject.Settings);

        var bundleList = AssetDatabase.GetAllAssetBundleNames();
        if (settings != null && bundleList.Length > 0)
        {
            AssetDatabase.RemoveUnusedAssetBundleNames();
            float fullCount = bundleList.Length;
            int currCount = 0;

            foreach (var bundle in bundleList)
            {
                if (EditorUtility.DisplayCancelableProgressBar("Converting Legacy Asset Bundles", bundle, currCount / fullCount))
                    break;

                currCount++;
                var group = settings.CreateGroup(bundle, false, false, false, null);
                var schema = group.AddSchema<BundledAssetGroupSchema>();
                schema.BuildPath.SetVariableByName(settings, AddressableAssetSettings.kLocalBuildPath);
                schema.LoadPath.SetVariableByName(settings, AddressableAssetSettings.kLocalLoadPath);
                schema.BundleMode = BundledAssetGroupSchema.BundlePackingMode.PackTogether;
                group.AddSchema<ContentUpdateGroupSchema>().StaticContent = true;

                var assetList = AssetDatabase.GetAssetPathsFromAssetBundle(bundle);

                foreach (var asset in assetList)
                {
                    var guid = AssetDatabase.AssetPathToGUID(asset);
                    settings.CreateOrMoveEntry(guid, group, false, false);
                    var imp = AssetImporter.GetAtPath(asset);
                    if (imp != null)
                        imp.SetAssetBundleNameAndVariant(string.Empty, string.Empty);
                }
            }

            if (fullCount > 0)
                settings.SetDirty(AddressableAssetSettings.ModificationEvent.BatchModification, null, true, true);
            EditorUtility.ClearProgressBar();
            AssetDatabase.RemoveUnusedAssetBundleNames();
        }

        AddressablesReimport();
    }

    [MenuItem("Addressables/Reimport")]
    public static void AddressablesReimport()
    {
        List<string> paths = new List<string>();

        string path1 = Path.Combine(Application.dataPath, "ResourcesAsset");
        foreach (string subFile in Directory.GetFiles(path1, "*.*", SearchOption.AllDirectories))
        {
            if (!subFile.EndsWith(".meta"))
            {
                var newPath = subFile.Replace(Application.dataPath, "");
                newPath = "Assets" + newPath.Replace("\\","/");
                paths.Add(newPath);
            }
        }

        string path2 = Path.Combine(Application.dataPath, "Scenes");

        foreach (string subFile in Directory.GetFiles(path2, "*.unity", SearchOption.AllDirectories))
        {
            if (!subFile.EndsWith(".meta"))
            {
                var newPath = subFile.Replace(Application.dataPath, "");
                newPath = "Assets" + newPath.Replace("\\", "/");
                paths.Add(newPath);
            }
        }

        AssetPostprocess.PostprocessAssets(paths.ToArray());

        EditorUtility.SetDirty(AddressableAssetSettingsDefaultObject.Settings);
        AssetDatabase.Refresh();
        AssetDatabase.SaveAssets();
    }


    [MenuItem("Addressables/ClearMiss")]
    public static void ClearMissFile()
    {
        var setting = AssetDatabase.LoadAssetAtPath<AddressableAssetSettings>("Assets/AddressableAssetsData/AddressableAssetSettings.asset");

        int sort = 0;
        foreach (var group in setting.groups)
        {
            sort++;
            List<string> missList = new List<string>();
            foreach (var entry in group.entries)
            {
                string path = AssetDatabase.GUIDToAssetPath(entry.guid);
                if (string.IsNullOrEmpty(path))
                {
                    missList.Add(entry.guid);
                }
                else
                {
                    string np = path.Replace("Assets/", "/");
                    if (!File.Exists(Application.dataPath + np))
                    {
                        missList.Add(entry.guid);
                    }
                }
            }

            foreach (var guid in missList)
            {
                setting.RemoveAssetEntry(guid);
            }
            EditorUtility.DisplayProgressBar("Addressables Clear Miss Files", "Clear Group " + group.name, (float)sort / (float)setting.groups.Count);
        }
        EditorUtility.ClearProgressBar();

        EditorUtility.SetDirty(setting);
        AssetDatabase.Refresh();
        AssetDatabase.SaveAssets();
    }

    [MenuItem("Tools/Find Missing Objects")]

    public static void FindMissingRefrencesInCurrentScene()

    {
        GameObject[] objects = Resources.FindObjectsOfTypeAll<GameObject>();

        foreach (var go in objects)
        {
            var components = go.GetComponents(typeof(Component));

            foreach (var c in components)

            {

                if (!c)

                {

                    Debug.LogError("Missing Component in GO: " + FullPath(go), go);

                    continue;

                }

                SerializedObject so = new SerializedObject(c);

                var sp = so.GetIterator();

                while (sp.NextVisible(true))

                {

                    if (sp.propertyType == SerializedPropertyType.ObjectReference)

                    {

                        if (sp.objectReferenceValue == null && sp.objectReferenceInstanceIDValue != 0)

                        {

                            Debug.LogError($"Missing Refrence in {SceneManager.GetActiveScene().name}, {FullPath(go)}, {c.GetType().Name}, {ObjectNames.NicifyVariableName(sp.name)}");

                        }

                    }

                }

            }

        }
    }

    private static string FullPath(GameObject go)
    {
        return go.transform.parent == null ? go.name : FullPath(go.transform.parent.gameObject) + "/" + go.name;
    }

    [MenuItem("Tools/Active GameObjects &Q", false, 1)]
    public static void ActiveObjects()
    {
        if (Selection.gameObjects != null)
        {
            foreach (GameObject obj in Selection.gameObjects)
            {
                obj.SetActive(!obj.activeSelf);
            }
        }
        else Debug.Log("You must select a game object first, such as your button.");
    }

    [MenuItem("Tools/Copy GameObject Path in Hierarchy %G", false, 2)]
    public static void CopyGameObjectPath()
    {
        var go = Selection.activeTransform;

        if (go == null) return;
        if (go.name == null) return;
        if (go.transform.parent == null) return;

        var path = go.name;

        while (go.parent != null && go.parent.name.IndexOf("Canvas") < 0 && go.parent.name.IndexOf("Window") < 0)
        {
            path = string.Format("{0}/{1}", go.parent.name, path);

            go = go.parent;
        }

        EditorGUIUtility.systemCopyBuffer = path;
        Debug.Log(string.Format("内容:{0} 已经拷贝到剪切板", path));
    }

    [MenuItem("Tools/Copy Prefab Path in Project &F1", false, 3)]
    public static void CopyPrefabPath()
    {
        var selections = Selection.GetFiltered(typeof(UnityEngine.Object), SelectionMode.Assets);
        if (selections != null && selections.Length > 0)
        {
            string path = AssetDatabase.GetAssetPath(selections[0]);
            EditorGUIUtility.systemCopyBuffer = path;
            Debug.Log(string.Format("内容:{0} 已经拷贝到剪切板", path));
        }
    }

    [MenuItem("Tools/Open UIPanelWindow %H", false, 3)]
    public static void OpenUIPanelWindow()
    {
        var objSelect = Selection.activeGameObject;

        if (objSelect == null)
        {
            Debug.Log(string.Format("请先选中预制件节点"));
            return;
        }
        if (objSelect.GetComponent<UIPanel>() == null)
        {
            Debug.Log(string.Format("请先选中UIPanel的预制件节点"));
            return;
        }
        var window = UnityEditor.EditorWindow.GetWindow(typeof(UIPanelWindow), true);

        window.BeginWindows();
    }

    [MenuItem("Tools/Clear AutoRequireConfig", false, 3)]
    public static void ClearAutoRequireConfig()
    {
        string pathAutoRequireConfig = "Assets/Lua/AutoRequireConfig.lua";
        AssetDatabase.DeleteAsset(pathAutoRequireConfig);
    }

}