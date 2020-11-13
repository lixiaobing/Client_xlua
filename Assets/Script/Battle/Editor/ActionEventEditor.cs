using Framework;
//using LuaInterface;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;
using Dal;
using UnityEditor;
using UnityEngine;
using System;
using UnityEngine.Rendering.PostProcessing;
using UnityEditor.Animations;
using System.Linq;
using System.Diagnostics;

namespace Battle
{
    public class ActionEventEditor : EditorWindow
    {
        [MenuItem("Tools/ActionEventEditor #A")]
        public static void Init()
        {

            ActionEventEditor window = (ActionEventEditor)EditorWindow.GetWindow((typeof(ActionEventEditor)));
            window.maximized = true;
            window.ShowUtility();
        }

        string selectAnimationFilePath;
        string selectAnimationClipPath;
        ModelImporter selectModelImporter;
        SerializedObject selectModelObject;

        string selectModelClipState;
        int selectModelClipFrameLength;

        AnimationNamePack namePack;

        CameraEffectSet cameraEffectPack;

        Vector2 scrollModelPosition;

        bool forceApply = false;

        string[] modelTypeTabs = { "Hero", "Monster", "Summon", "Dungeon" };
        int modelTypeTabIndex = 0;
        string modelTabName = string.Empty;

        void OnGUI()
        {
            namePack = AssetDatabase.LoadAssetAtPath<AnimationNamePack>("Assets/EditorConfig/AnimationNamePack.asset");
            cameraEffectPack = AssetDatabase.LoadAssetAtPath<CameraEffectSet>("Assets/ResourcesAsset/Setting/CameraEffectPack.asset");

            EditorGUILayout.BeginVertical(CustomEditorStyles.box);
            GUILayout.Space(5);
            modelTypeTabIndex = GUILayout.SelectionGrid(modelTypeTabIndex, modelTypeTabs, 15);
            modelTabName = modelTypeTabs[modelTypeTabIndex];
            GUILayout.Space(5);
            EditorGUILayout.EndVertical();

            Rect rect = EditorGUILayout.BeginHorizontal();
            ShowAnimatorList();
            ShowAnimatorContent();
            EditorGUILayout.EndHorizontal();
        }

        Vector2 scrollPosition;
        string selectPath;
        string selectFolder;
        string selectFile;
        string selectFileType;

        AnimationClip selectModelClip;
        ActionEventPack selectEventPack;
        ActionEventSubPack selectModelClipPack;

        int selectOrder = 0;

        string selectModelFolder;

        void ShowAnimatorList()
        {
            EditorGUILayout.BeginVertical(GUILayout.Width(200));
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition, EditorStyles.helpBox, GUILayout.ExpandHeight(true));

            selectModelFolder = Application.dataPath + "/ResourcesWork/Model/" + modelTabName + "/";

            string[] heroFolders = Directory.GetDirectories(selectModelFolder);
            List<string> heroPaths = new List<string>();

            foreach (string path in heroFolders)
            {
                heroPaths.AddRange(Directory.GetFiles(path, "*.controller"));
                heroPaths.AddRange(Directory.GetFiles(path, "*.overrideController"));
            }

            string[] paths = heroPaths.ToArray();

            Array.Sort(paths, (a, b) =>
            {
                string namea = Path.GetFileNameWithoutExtension(a);
                string nameb = Path.GetFileNameWithoutExtension(b);
                return string.CompareOrdinal(namea, nameb);
            });

            List<string> selectFolders = new List<string>();

            foreach (string path in paths)
            {
                string fileName = Path.GetFileNameWithoutExtension(path);
                string[] folders = Path.GetDirectoryName(path).Split('\\');
                string folderName = folders[folders.Length - 1];
                selectFolders.Add(folderName);

                bool isOpen = EditorGUILayout.Foldout(selectPath == path, fileName);
                if (isOpen)
                {
                    if (path != selectPath)
                    {
                        selectOrder = 0;
                        selectOrder = 0;
                        selectPath = path;

                        selectFolder = folderName;
                        selectFile = Path.GetFileNameWithoutExtension(path);
                        selectFileType = Path.GetExtension(path);
                        selectEventPack = LoadActionEventPack(modelTabName, selectFolder, selectFile);
                    }

                    for (var i = selectEventPack.clipPacks.Count - 1; i >= 0; i--)
                    {
                        var pack = selectEventPack.clipPacks[i];
                        if (pack.clip == null)
                        {
                            selectEventPack.clipPacks.RemoveAt(i);
                        }
                    }

                    ShowClipList();
                }
                else
                {
                    if (path == selectPath)
                    {
                        selectPath = "";
                        selectFolder = "";
                        selectFile = "";
                        selectEventPack = null;
                    }
                }
            }

            EditorGUILayout.EndScrollView();
            GUILayout.Space(5);
            if (GUILayout.Button("Export All Animator", GUILayout.Height(40)))
            {
                int index = 0;
                foreach (var folder in selectFolders)
                {
                    index++;
                    EditorUtility.DisplayProgressBar("Export Animator", $"{modelTabName}/{folder}", index / selectFolders.Count);
                    BattleEditorUtility.GenerateStateMachineLua(modelTabName, folder);
                }
                AssetDatabase.SaveAssets();
                EditorUtility.ClearProgressBar();
            }
            GUILayout.Space(10);
            EditorGUILayout.EndVertical();
        }

        ActionEventPack LoadActionEventPack(string tabName, string folderName, string animatorName)
        {
            string packPath = $"Assets/ResourcesWork/Model/{tabName}/{folderName}/{animatorName}.asset";
            ActionEventPack pack = AssetDatabase.LoadAssetAtPath<ActionEventPack>(packPath);
            if (pack == null)
            {
                ActionEventPack obj = ScriptableObject.CreateInstance<ActionEventPack>();
                AssetDatabase.CreateAsset(obj, packPath);
                AssetDatabase.Refresh();

                pack = obj;
            }
            return pack;
        }

        void ShowAnimatorContent()
        {
            forceApply = false;

            if (selectModelClip == null)
            {
                return;
            }
            if (selectEventPack == null)
            {
                return;
            }

            selectModelClipPack = selectEventPack.SearchEventSubPack(selectModelClipState, selectModelClip);
            selectModelClipPack.stateName = selectModelClipState;
            selectModelClipPack.clip = selectModelClip;
            selectModelClipPack.frameLength = selectModelClipFrameLength;

            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginHorizontal(EditorStyles.helpBox);
            GUILayout.Space(10);
            EditorGUILayout.BeginVertical();
            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.ObjectField("Animation Clip", selectModelClipPack.clip, typeof(AnimationClip), false);
            GUILayout.Label($"[ {selectModelClipFrameLength} ]", GUILayout.MaxWidth(50));
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.ObjectField("Event Pack", selectEventPack, typeof(ActionEventPack), false);
            GUILayout.Label("", GUILayout.MaxWidth(50));
            EditorGUILayout.EndHorizontal();
            GUILayout.Space(5);
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginHorizontal(GUILayout.Width(400));
            if (GUILayout.Button("+", GUILayout.Width(45), GUILayout.Height(45)))
            {
                ActionEvent newEvent = new ActionEvent();
                newEvent.addTime = ConvertDateTimeToInt(System.DateTime.Now);
                selectModelClipPack.events.Add(newEvent);

                EditorUtility.SetDirty(selectEventPack);

                if (!Application.isPlaying)
                {
                    AssetDatabase.SaveAssets();
                }
            }
            if (GUILayout.Button("Copy All", GUILayout.Width(90), GUILayout.Height(45)))
            {
                CopyEventList();
            }
            if (GUILayout.Button("Paste All", GUILayout.Width(90), GUILayout.Height(45)))
            {
                PasteEventList();
            }
            if (GUILayout.Button("Export Animator", GUILayout.Width(120), GUILayout.Height(45)))
            {
                EditorUtility.DisplayProgressBar("Export Animator", $"{modelTabName}/{selectFolder}", 0);
                BattleEditorUtility.GenerateStateMachineLua(modelTabName, selectFolder);
                EditorUtility.ClearProgressBar();
                if (!Application.isPlaying)
                {
                    AssetDatabase.SaveAssets();
                }
            }
            if (GUILayout.Button("Generate Lua", GUILayout.Width(120), GUILayout.Height(45)))
            {
                GenerateLua();
                if (!Application.isPlaying)
                {
                    AssetDatabase.SaveAssets();
                }
            }
            EditorGUILayout.EndHorizontal();
            GUILayout.Space(10);
            EditorGUILayout.EndHorizontal();

            scrollModelPosition = EditorGUILayout.BeginScrollView(scrollModelPosition, GUILayout.ExpandHeight(true));
            for (int i = 0; i < selectModelClipPack.events.Count; i++)
            {
                EditorGUILayout.BeginHorizontal(EditorStyles.helpBox, GUILayout.Height(48));
                if (GUILayout.Button("一", GUILayout.Width(45), GUILayout.Height(45)))
                {
                    selectModelClipPack.events.RemoveAt(i);

                    EditorUtility.SetDirty(selectEventPack);
                }
                if (GUILayout.Button("Copy", GUILayout.Width(45), GUILayout.Height(45)))
                {
                    copyEvent = (ActionEvent)selectModelClipPack.events[i];
                }
                if (GUILayout.Button("Paste", GUILayout.Width(45), GUILayout.Height(45)))
                {
                    if (copyEvent != null)
                    {
                        selectModelClipPack.events[i] = (ActionEvent)copyEvent.Clone();
                    }
                }
                if (selectModelClipPack.events.Count > i)
                {
                    ShowEventContent(selectModelClipPack.events[i]);
                }
                GUI.backgroundColor = Color.white;
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndScrollView();
            EditorGUILayout.EndVertical();

            //ReCalDamages();

            if (EditorUtility.IsDirty(selectEventPack))
            {
                EditorUtility.SetDirty(selectEventPack);
            }
        }

        void CheckEventPack(ActionEventPack pack, string[] fileNames)
        {
            List<string> nameList = new List<string>(fileNames);

            for (var i = pack.clipPacks.Count - 1; i >= 0; i--)
            {
                var item = pack.clipPacks[i];
                if (!nameList.Contains(item.stateName))
                {
                    pack.clipPacks.Remove(item);
                }
            }
        }

        ActionEvent[] copyEventList;

        ActionEvent copyEvent;

        void CopyEventList()
        {
            copyEventList = new ActionEvent[selectModelClipPack.events.Count];
            for (var i = 0; i < selectModelClipPack.events.Count; i++)
            {
                copyEventList[i] = (ActionEvent)selectModelClipPack.events[i].Clone();
            }
        }

        void PasteEventList()
        {
            if (copyEventList != null)
            {
                selectModelClipPack.events.Clear();
                selectModelClipPack.events.AddRange(copyEventList);

                copyEventList = null;
            }
        }

        /*
        void ReCalDamages()
        {
            List<ActionEvent> elist = new List<ActionEvent>();

            foreach (var e in selectModelClipPack.events)
            {
                if (e.type==ActionEventKind.Attack || e.type==ActionEventKind.Bullet || e.type == ActionEventKind.Trap)
                {
                    elist.Add(e);
                }
            }

            if (elist.Count > 0)
            {
                float dmg = 1000;
                foreach (var e in elist)
                {
                    e.damageRatio = e.damageRatio * 1000;
                    if (dmg - e.damageRatio >= 0)
                    {
                        dmg -= e.damageRatio;
                    }
                    else
                    {
                        e.damageRatio = 0;
                    }
                }

                if (dmg > 0)
                {
                    int zeroCount = 0;
                    foreach (var e in elist)
                    {
                        if (e.damageRatio == 0)
                        {
                            zeroCount++;
                        }
                    }
                    if (dmg > zeroCount)
                    {
                        int per = (int)Mathf.Floor(dmg / zeroCount);
                        foreach (var e in elist)
                        {
                            if (e.damageRatio == 0)
                            {
                                e.damageRatio = per;
                                dmg -= per;
                            }
                        }
                    }
                }

                if (dmg > 0)
                {
                    var last = elist[elist.Count - 1];
                    last.damageRatio += dmg;
                }

                foreach (var e in elist)
                {
                    e.damageRatio = e.damageRatio / 1000;
                }
            }
        }*/

        public static long ConvertDateTimeToInt(System.DateTime time)
        {
            //System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1, 0, 0, 0, 0));
            //long t = (time.Ticks - startTime.Ticks) / 10000;   //除10000调整为13位      
            long t = (time.Ticks - 621356256000000000) / 10000;
            return t;
        }

        float contentWidth;
        float columnWidth;

        void ShowEventContent(ActionEvent e)
        {
            contentWidth = this.position.width - 300;
            columnWidth = contentWidth / 5;

            GUI.backgroundColor = ActionEventPack.GetEventColor(e.type);

            EditorGUILayout.BeginVertical(GUILayout.Width(150));
            GUILayout.Space(2);
            e.type = (ActionEventKind)EditorGUILayout.EnumPopup(e.type);
            GUILayout.Space(2);

            EditorGUILayout.BeginHorizontal();
            e.time = EditorGUILayout.FloatField(e.time);
            e.time = Mathf.Clamp(e.time, 0, 100);
            e.time = float.Parse(e.time.ToString("0.0"));
            e.realTime = e.time / 100f * selectModelClip.length;
            e.frame = (int)(e.time / 100f * selectModelClipPack.frameLength);
            GUILayout.Label("Frame " + e.frame, GUILayout.Width(70));
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(CustomEditorStyles.box, GUILayout.ExpandWidth(true), GUILayout.ExpandHeight(true));
            if (e.type == ActionEventKind.Warning)
            {
                ShowContentWarning(e);
            }
            else if (e.type == ActionEventKind.EffectSave)
            {
                ShowContentEffectSave(e);
            }
            else if (e.type == ActionEventKind.Effect)
            {
                ShowContentEffect(e);
            }
            else if (e.type == ActionEventKind.Sound)
            {
                ShowContentSound(e);
            }
            else if (e.type == ActionEventKind.Attack)
            {
                ShowContentAttack(e);
            }
            else if (e.type == ActionEventKind.AttackFlag)
            {
                ShowContentAttackFlag(e);
            }
            else if (e.type == ActionEventKind.SpaceCheck)
            {
                ShowContentSpaceCheck(e);
            }
            else if (e.type == ActionEventKind.BehaviorTag)
            {
                ShowContentBehaviourTag(e);
            }
            else if (e.type == ActionEventKind.UserState)
            {
                ShowContentUserState(e);
            }
            else if (e.type == ActionEventKind.LookTarget)
            {
                ShowContentLookTarget(e);
            }
            else if (e.type == ActionEventKind.Bullet)
            {
                ShowContentBullet(e);
            }
            else if (e.type == ActionEventKind.BulletScreen)
            {
                ShowContentBulletScreen(e);
            }
            else if (e.type == ActionEventKind.UseJoystick)
            {
                ShowContentUseJoystick(e);
            }
            else if (e.type == ActionEventKind.AttackWindow || e.type == ActionEventKind.RunWindow || e.type == ActionEventKind.RushWindow ||
                e.type == ActionEventKind.SkillWindow || e.type == ActionEventKind.SuperWindow || e.type == ActionEventKind.ChangeWindow)
            {
                ShowContentWindow(e);
            }
            else if (e.type == ActionEventKind.CameraSpecial || e.type == ActionEventKind.SceneDark || e.type == ActionEventKind.ModelDisappear ||
                e.type == ActionEventKind.IgnoreCollision || e.type == ActionEventKind.Armor || e.type == ActionEventKind.Super ||
                e.type == ActionEventKind.Speedbreaker || e.type == ActionEventKind.JumpTwice)
            {
                ShowContentToggle(e);
            }
            else if (e.type == ActionEventKind.CameraFix)
            {
                ShowContentCameraFix(e);
            }
            else if (e.type == ActionEventKind.CameraEffect)
            {
                ShowContentCameraEffect(e);
            }
            else if (e.type == ActionEventKind.TimeScale)
            {
                ShowContentTimeScale(e);
            }
            else if (e.type == ActionEventKind.FlowUp)
            {
                ShowContentFlowUp(e);
            }
            else if (e.type == ActionEventKind.Forward || e.type == ActionEventKind.Backward || e.type == ActionEventKind.Leftward || e.type == ActionEventKind.Rightward)
            {
                ShowContentMoveCurve(e);
            }
            else if (e.type == ActionEventKind.PlayAction)
            {
                ShowContentPlayAction(e);
            }
            else if (e.type == ActionEventKind.Trap)
            {
                ShowContentTrap(e);
            }
            else if (e.type == ActionEventKind.Summon)
            {
                ShowContentSummon(e);
            }
            else if (e.type == ActionEventKind.Capsule)
            {
                ShowContentCapsule(e);
            }
            EditorGUILayout.EndVertical();

            EditorUtility.SetDirty(selectEventPack);
        }

        void ShowContentWarning(ActionEvent e)
        {
            WarningSet set = null;
            string path = null;

            if (e.file)
            {
                path = AssetDatabase.GetAssetPath(e.file.GetInstanceID());
                set = AssetDatabase.LoadAssetAtPath<WarningSet>(path);

                string folder = Path.GetDirectoryName(path).Replace("\\", "/");
                string[] strs = folder.Split('/');
                string folderName = strs[strs.Length - 1];
                e.filePath = $"Warning/{folderName}/{set.name}";
            }
            else
            {
                e.filePath = "";
            }

            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("File", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            if (set)
            {
                GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
                GUILayout.Label("StartTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("EndTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.file = (WarningSet)EditorGUILayout.ObjectField(set, typeof(WarningSet), false, GUILayout.Width(columnWidth - 53));

            if (set)
            {
                if (GUILayout.Button("Select", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    Selection.activeObject = e.file;
                }

                EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));

                e.time = EditorGUILayout.FloatField(e.time, GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                EditorGUILayout.LabelField(e.realTime.ToString(), GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                float endTime = EditorGUILayout.FloatField(e.endTime, GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                if (endTime < e.time) endTime = e.time;

                e.endTime = endTime;
                e.endRealTime = endTime / 100f * selectModelClip.length;
                EditorGUILayout.LabelField(e.endRealTime.ToString(), GUILayout.Width(60), GUILayout.Width(columnWidth / 4));
            }
            else
            {
                if (GUILayout.Button("Create", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    string savePath = $"ResourcesAsset/Warning/{selectFolder}/";
                    string mydirPath = Application.dataPath + "/" + savePath;
                    if (!Directory.Exists(mydirPath))
                    {
                        Directory.CreateDirectory(mydirPath);
                    }

                    set = ScriptableObject.CreateInstance<WarningSet>();

                    string newPath = "Assets/" + savePath + "/NewWarningSet.asset";
                    int counter = 0;
                    while (true)
                    {
                        var asset = AssetDatabase.LoadAssetAtPath<WarningSet>(newPath);
                        if (asset != null)
                        {
                            counter++;
                            newPath = $"Assets/{savePath}/NewWarningSet_{counter}.asset";
                        }
                        else
                        {
                            break;
                        }
                    }

                    AssetDatabase.CreateAsset(set, newPath);
                    AssetDatabase.Refresh();
                    e.file = AssetDatabase.LoadAssetAtPath<WarningSet>(newPath);

                    EditorUtility.SetDirty(set);
                    AssetDatabase.SaveAssets();

                    forceApply = true;
                }
            }

            EditorGUILayout.EndHorizontal();
        }

        void ShowContentEffectSave(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("File", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("BoneNogs", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("Global", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 4));
            GUILayout.Label("Clear", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 4));
            GUILayout.Label("Lock", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 4));
            GUILayout.Label("CustomTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 4));
            if (e.isCustomLifeTime)
                GUILayout.Label("EndTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 4));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();

            GameObject obj = null;
            if (e.file)
            {
                obj = AssetDatabase.LoadAssetAtPath<GameObject>(AssetDatabase.GetAssetPath(e.file.GetInstanceID()));
                e.file = (GameObject)EditorGUILayout.ObjectField(obj, typeof(GameObject), false, GUILayout.Width(columnWidth));
                e.filePath = AssetDatabase.GetAssetPath(e.file).Replace("Assets/ResourcesAsset/", "").Replace(".prefab", "");
            }
            else
            {
                e.file = EditorGUILayout.ObjectField(e.file, typeof(GameObject), false, GUILayout.Width(columnWidth));
            }

            EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));
            e.boneNogType = (BoneNogType)EditorGUILayout.EnumPopup(e.boneNogType, GUILayout.Width(columnWidth / 2));
            e.isGlobalSpace = EditorGUILayout.Toggle(e.isGlobalSpace, GUILayout.Width(columnWidth / 4));
            e.isClear = EditorGUILayout.Toggle(e.isClear, GUILayout.Width(columnWidth / 4));
            e.lockRotation = EditorGUILayout.Toggle(e.lockRotation, GUILayout.Width(columnWidth / 4));
            e.isCustomLifeTime = EditorGUILayout.Toggle(e.isCustomLifeTime, GUILayout.Width(columnWidth / 4));
            if (e.isCustomLifeTime)
            {
                float endTime = EditorGUILayout.FloatField(e.endTime, GUILayout.Width(columnWidth / 4));
                if (endTime <= e.time && e.file)
                {
                    GameObject go = e.file as GameObject;
                    do
                    {
                        if (go)
                        {
                            EffectControll ec = go.GetComponent<EffectControll>();
                            if (ec)
                            {
                                endTime = e.time + (100 / selectModelClip.length * ec.lifeTime);
                                break;
                            }
                        }
                        endTime = e.time;
                    } while (false);
                }
                e.endTime = endTime;
                e.endRealTime = endTime / 100f * selectModelClip.length;
                e.customLifeTime = e.endRealTime - e.realTime;
                EditorGUILayout.LabelField(e.endRealTime.ToString("0.00"), GUILayout.Width(columnWidth / 4));
            }

            if (GUILayout.Button("Make Effect"))
            {
                string oldPath = AssetDatabase.GetAssetPath(e.file);
                string newPath = oldPath.Replace("ResourcesAsset/Effect/", "ResourcesWork/Effect/Prefab/");
                string savePath = oldPath.Replace(".prefab", ".asset");

                EffectSet set = ScriptableObject.CreateInstance<EffectSet>();
                set.name = e.file.name;
                set.prefab = e.file as GameObject;
                set.boneNog = e.boneNogType;
                set.isGlobal = e.isGlobalSpace;
                set.isClear = e.isClear;
                set.isLock = e.lockRotation;

                AssetDatabase.CreateAsset(set, savePath);
                AssetDatabase.Refresh();

                string folder = Path.GetDirectoryName(newPath);
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                AssetDatabase.MoveAsset(oldPath, newPath);

                e.type = ActionEventKind.Effect;
                e.file = AssetDatabase.LoadAssetAtPath<EffectSet>(savePath);


                EditorUtility.SetDirty(set);
                AssetDatabase.SaveAssets();
            }
            EditorGUILayout.EndHorizontal();

        }

        void ShowContentEffect(ActionEvent e)
        {
            EffectSet set = null;
            string path = null;

            if (e.file)
            {
                path = AssetDatabase.GetAssetPath(e.file.GetInstanceID());
                set = AssetDatabase.LoadAssetAtPath<EffectSet>(path);

                string folder = Path.GetDirectoryName(path).Replace("\\", "/");
                string[] strs = folder.Split('/');
                string folderName = strs[strs.Length - 1];
                e.filePath = $"Effect/{folderName}/{set.name}";
            }
            else
            {
                e.filePath = "";
            }

            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("File", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            if (set)
            {
                GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.file = (EffectSet)EditorGUILayout.ObjectField(set, typeof(EffectSet), false, GUILayout.Width(columnWidth - 53));

            if (set)
            {
                if (GUILayout.Button("Select", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    Selection.activeObject = e.file;
                }
            }
            else
            {
                if (GUILayout.Button("Create", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    string savePath = $"ResourcesAsset/Effect/{selectFolder}/";
                    string mydirPath = Application.dataPath + "/" + savePath;
                    if (!Directory.Exists(mydirPath))
                    {
                        Directory.CreateDirectory(mydirPath);
                    }

                    set = ScriptableObject.CreateInstance<EffectSet>();

                    string newPath = "Assets/" + savePath + "/NewEffectSet.asset";
                    int counter = 0;
                    while (true)
                    {
                        var asset = AssetDatabase.LoadAssetAtPath<EffectSet>(newPath);
                        if (asset != null)
                        {
                            counter++;
                            newPath = $"Assets/{savePath}/NewEffectSet_{counter}.asset";
                        }
                        else
                        {
                            break;
                        }
                    }

                    AssetDatabase.CreateAsset(set, newPath);
                    AssetDatabase.Refresh();
                    e.file = AssetDatabase.LoadAssetAtPath<EffectSet>(newPath);

                    EditorUtility.SetDirty(set);
                    AssetDatabase.SaveAssets();

                    forceApply = true;
                }
            }

            EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentBehaviourTag(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Tag", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.content = EditorGUILayout.TextField("", e.content, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentUserState(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("State Name", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("isClear", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.content = EditorGUILayout.TextField("", e.content, GUILayout.Width(columnWidth));
            e.toggle = EditorGUILayout.Toggle("", e.toggle, GUILayout.Width(columnWidth / 2));
            e.isClear = EditorGUILayout.Toggle("", e.isClear, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();
        }


        void ShowContentSound(ActionEvent e)
        {
            UnityEngine.Debug.LogError("音频模块没加入过来，暂时注释掉");
            //EditorGUILayout.BeginHorizontal();
            //GUILayout.Label("AkEventName", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            ////GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            //GUILayout.Label("Mute", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            //EditorGUILayout.EndHorizontal();

            //EditorGUILayout.BeginHorizontal();

            //var style = new GUIStyle(GUI.skin.button);
            //style.alignment = TextAnchor.MiddleLeft;
            //style.fontStyle = FontStyle.Normal;
            //var eventName = e.akEventName;
            //var tempText = "No " + WwiseObjectType.Event + " is currently selected";
            //if (string.IsNullOrEmpty(eventName))
            //{
            //    eventName = tempText;
            //    style.normal.textColor = Color.red;
            //}

            //Rect rect = position;
            //rect.y = position.yMax - 300;
            //rect.width = 300;
            //rect.height = 600;
            //if (GUILayout.Button("select", style, GUILayout.Width(52)))
            //{
            //    new AkWwiseComponentPicker.PickerCreator
            //    {
            //        objectType = WwiseObjectType.Event,
            //        wwiseObjectReference = null,
            //        pickerPosition = AkUtilities.GetLastRectAbsolute(rect),
            //        selectCallback = (eventname) =>
            //        {
            //            eventName = eventname;
            //            e.akEventName = eventname;
            //        },
            //        serializedObject = null
            //    };
            //}

            //Rect __rect = EditorGUILayout.GetControlRect(GUILayout.Width(columnWidth - 52));
            //eventName = EditorGUI.TextField(__rect, eventName);
            //if (eventName != tempText)
            //    e.akEventName = eventName;

            //if (UnityEngine.Event.current.type == UnityEngine.EventType.DragUpdated
            //            && __rect.Contains(Event.current.mousePosition))
            //{
            //    //改变鼠标的外表  
            //    DragAndDrop.visualMode = DragAndDropVisualMode.Generic;
            //}

            //if (UnityEngine.Event.current.type == UnityEngine.EventType.DragExited
            //            && __rect.Contains(Event.current.mousePosition))
            //{
            //    if (DragAndDrop.paths.Length > 0 && DragAndDrop.paths[0] == "Event")
            //    {
            //        eventName = DragAndDrop.paths[1];
            //        e.akEventName = DragAndDrop.paths[1];
            //        AkWwiseComponentPicker.CloseWindows();
            //    }
            //}

            ///*GameObject obj = null;
            //if (e.file)
            //{
            //    obj = AssetDatabase.LoadAssetAtPath<GameObject>(AssetDatabase.GetAssetPath(e.file.GetInstanceID()));
            //    e.file = (GameObject)EditorGUILayout.ObjectField(obj, typeof(GameObject), false, GUILayout.Width(columnWidth - 52));
            //    e.filePath = AssetDatabase.GetAssetPath(e.file).Replace("Assets/ResourcesAsset/", "").Replace(".prefab", "");
            //}
            //else
            //{*/
            ////   e.file = EditorGUILayout.ObjectField(e.file, typeof(GameObject), false, GUILayout.Width(columnWidth - 52));
            ////}

            ////EditorGUILayout.TextField(componentName, GUILayout.Width(columnWidth));

            ///*if (e.volume == 0)
            //{
            //    e.volume = 0.6f;
            //}
            //e.volume = EditorGUILayout.Slider(e.volume, 0, 1, GUILayout.Width(columnWidth));
            //*/

            //e.mute = EditorGUILayout.Toggle("", e.mute, GUILayout.Width(columnWidth / 2));
            //EditorGUILayout.EndHorizontal();
        }

        void ShowContentAttack(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            //GUILayout.Label("Damage Ratio", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("File", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Group Tag", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();

            //e.damageRatio = EditorGUILayout.FloatField(e.damageRatio, GUILayout.Width(columnWidth));
            //e.damageRatio = ClampDamageRatio(e.damageRatio);

            AttackFrame attackObj = null;
            if (e.file != null)
            {
                string path = AssetDatabase.GetAssetPath(e.file.GetInstanceID());
                attackObj = AssetDatabase.LoadAssetAtPath<AttackFrame>(path);
                e.file = EditorGUILayout.ObjectField(attackObj, typeof(AttackFrame), false, GUILayout.Width(columnWidth - 52));

                string folder = Path.GetDirectoryName(path).Replace("\\", "/");
                string[] strs = folder.Split('/');
                string folderName = strs[strs.Length - 1];
                attackObj.filePath = $"{folderName}/{attackObj.name}";
                e.filePath = attackObj.filePath;

                if (GUILayout.Button("Select", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    Selection.activeObject = e.file;
                }

                EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));
            }
            else
            {
                e.file = EditorGUILayout.ObjectField(attackObj, typeof(AttackFrame), false, GUILayout.Width(columnWidth - 52));
                e.filePath = "";

                if (GUILayout.Button("Create", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    string savePath = $"ResourcesWork/Data/AttackFrame/{selectFolder}/";
                    string mydirPath = Application.dataPath + "/" + savePath;
                    if (!Directory.Exists(mydirPath))
                    {
                        Directory.CreateDirectory(mydirPath);
                    }

                    attackObj = ScriptableObject.CreateInstance<AttackFrame>();

                    string newPath = "Assets/" + savePath + "/" + selectModelClipState + ".asset";
                    int counter = 1;

                    while (AssetDatabase.LoadAssetAtPath<AttackFrame>(newPath) != null && counter < 100)
                    {
                        newPath = "Assets/" + savePath + "/" + selectModelClipState + "_" + counter + ".asset";
                        counter++;
                    }

                    if (counter > 100)
                    {
                        return;
                    }

                    savePath = newPath;

                    AssetDatabase.CreateAsset(attackObj, savePath);
                    AssetDatabase.Refresh();
                    e.file = AssetDatabase.LoadAssetAtPath<AttackFrame>(savePath);

                    EditorUtility.SetDirty(attackObj);
                    AssetDatabase.SaveAssets();
                }

                EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));
            }
            e.attackGroupTag = EditorGUILayout.TextField(e.attackGroupTag, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        float ClampDamageRatio(float f)
        {
            f = Mathf.Clamp(f, 0, 1);
            int c = (int)(f * 1000);
            return (float)c / (float)1000;
        }

        void ShowContentAttackFlag(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();

            GUILayout.Label("Type", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("Position", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));

            if (e.flagRange == AttackFlagType.Sector)
            {
                GUILayout.Label("Direction", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("Radius", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("Angle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }
            else if (e.flagRange == AttackFlagType.Rect)
            {
                GUILayout.Label("Direction", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("Long", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("Wide", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }
            else if (e.flagRange == AttackFlagType.Range)
            {
                GUILayout.Label("Radius", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }

            GUILayout.Label("StartTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("EndTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("EndRealTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.flagRange = (AttackFlagType)EditorGUILayout.EnumPopup(e.flagRange, GUILayout.Width(columnWidth / 2));
            e.flagPosition = EditorGUILayout.Vector3Field("", e.flagPosition, GUILayout.Width(columnWidth / 2));

            if (e.flagRange == AttackFlagType.Sector)
            {
                e.flagDirection = EditorGUILayout.FloatField("", e.flagDirection, GUILayout.Width(columnWidth / 2));
                e.flagRadius = EditorGUILayout.FloatField(e.flagRadius, GUILayout.Width(columnWidth / 2));
                e.flagAngle = EditorGUILayout.FloatField(e.flagAngle, GUILayout.Width(columnWidth / 2));
            }
            else if (e.flagRange == AttackFlagType.Rect)
            {
                e.flagDirection = EditorGUILayout.FloatField("", e.flagDirection, GUILayout.Width(columnWidth / 2));
                e.flagSize = EditorGUILayout.Vector3Field("", e.flagSize, GUILayout.Width(columnWidth / 2));
            }
            else if (e.flagRange == AttackFlagType.Range)
            {
                e.flagRadius = EditorGUILayout.FloatField(e.flagRadius, GUILayout.Width(columnWidth / 2));
            }

            EditorGUILayout.FloatField(e.time, GUILayout.Width(columnWidth / 2));
            e.flagTime = EditorGUILayout.FloatField(e.flagTime, GUILayout.Width(columnWidth / 2));
            if (e.flagTime < e.time) e.flagTime = e.time;
            if (e.flagTime > 100) e.flagTime = 100;
            e.flagRealTime = e.flagTime / 100f * selectModelClip.length;
            EditorGUILayout.LabelField(e.flagRealTime.ToString(), GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentSpaceCheck(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("StartTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("EndTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("EndRealTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.FloatField(e.time, GUILayout.Width(columnWidth / 2));
            e.spaceTime = EditorGUILayout.FloatField(e.spaceTime, GUILayout.Width(columnWidth / 2));
            if (e.spaceTime < e.time) e.spaceTime = e.time;
            if (e.spaceTime > 100) e.spaceTime = 100;
            e.spaceRealTime = e.spaceTime / 100f * selectModelClip.length;
            EditorGUILayout.LabelField(e.spaceRealTime.ToString(), GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentLookTarget(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("StartTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("EndTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("EndRealTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("Speed", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.FloatField(e.time, GUILayout.Width(columnWidth / 2));
            e.lookTargetTime = EditorGUILayout.FloatField(e.lookTargetTime, GUILayout.Width(columnWidth / 2));
            if (e.lookTargetTime < e.time) e.lookTargetTime = e.time;
            if (e.lookTargetTime > 100) e.lookTargetTime = 100;
            e.lookTargetRealTime = e.lookTargetTime / 100f * selectModelClip.length;

            EditorGUILayout.LabelField(e.lookTargetRealTime.ToString(), GUILayout.Width(columnWidth / 2));

            e.lookTargetSpeed = EditorGUILayout.FloatField(e.lookTargetSpeed, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentBullet(ActionEvent e)
        {
            //初始骨骼|配置ID|发射个数|发射间隔帧数
            EditorGUILayout.BeginHorizontal();
            //GUILayout.Label("Damage Ratio", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Shoot Position", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("Shoot Direction", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("ConfigID/Count/Interval", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            //e.damageRatio = EditorGUILayout.FloatField(e.damageRatio, GUILayout.Width(columnWidth));
            //e.damageRatio = ClampDamageRatio(e.damageRatio);

            e.bulletShootPosition = EditorGUILayout.Vector3Field("", e.bulletShootPosition, GUILayout.Width(columnWidth / 2));
            e.bulletShootDirection = EditorGUILayout.Vector3Field("", e.bulletShootDirection, GUILayout.Width(columnWidth / 2));

            e.bulletId = EditorGUILayout.IntField(e.bulletId, GUILayout.Width(columnWidth / 3 - 3));
            e.bulletCount = EditorGUILayout.IntField(e.bulletCount, GUILayout.Width(columnWidth / 3 - 3));
            e.bulletInterval = EditorGUILayout.IntField(e.bulletInterval, GUILayout.Width(columnWidth / 3 - 3));

            EditorGUILayout.EndHorizontal();
        }

        void ShowContentTrap(ActionEvent e)
        {
            //陷阱位置/陷阱ID
            EditorGUILayout.BeginHorizontal();
            //GUILayout.Label("Damage Ratio", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Trap Position", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Trap Direction", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("ConfigID", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            //e.damageRatio = EditorGUILayout.FloatField(e.damageRatio, GUILayout.Width(columnWidth));
            //e.damageRatio = ClampDamageRatio(e.damageRatio);

            e.trapPosition = EditorGUILayout.Vector3Field("", e.trapPosition, GUILayout.Width(columnWidth));
            e.trapDirection = EditorGUILayout.Vector3Field("", e.trapDirection, GUILayout.Width(columnWidth));

            e.trapId = EditorGUILayout.IntField(e.trapId, GUILayout.Width(columnWidth / 2));

            EditorGUILayout.EndHorizontal();
        }


        void ShowContentSummon(ActionEvent e)
        {
            SummonSet asset = null;
            string path = null;

            if (e.file)
            {
                path = AssetDatabase.GetAssetPath(e.file.GetInstanceID());
                asset = AssetDatabase.LoadAssetAtPath<SummonSet>(path);
                asset.luaPath = $"summon/{asset.name}";
                e.filePath = asset.luaPath;
            }

            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("File", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            if (asset)
            {
                GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();

            e.file = (SummonSet)EditorGUILayout.ObjectField(asset, typeof(SummonSet), false, GUILayout.Width(columnWidth - 53));

            if (asset)
            {
                if (GUILayout.Button("Select", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    Selection.activeObject = e.file;
                }
                EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));
                EditorUtility.SetDirty(asset);
            }
            else
            {
                if (GUILayout.Button("Create", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    string savePath = $"ResourcesWork/Data/Summon/";
                    string mydirPath = Application.dataPath + "/" + savePath;
                    if (!Directory.Exists(mydirPath))
                    {
                        Directory.CreateDirectory(mydirPath);
                    }

                    SummonSet newAsset = ScriptableObject.CreateInstance<SummonSet>();

                    string newPath = "Assets/" + savePath + "/New SummonSet.asset";
                    savePath = newPath;

                    AssetDatabase.CreateAsset(newAsset, savePath);
                    AssetDatabase.Refresh();
                    e.file = AssetDatabase.LoadAssetAtPath<SummonSet>(savePath);

                    EditorUtility.SetDirty(newAsset);
                    AssetDatabase.SaveAssets();

                    forceApply = true;
                }
            }
            EditorGUILayout.EndHorizontal();
        }


        void ShowContentCapsule(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            if (e.toggle)
            {
                GUILayout.Label("Center", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
                GUILayout.Label("Radius", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("Height", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.toggle = EditorGUILayout.Toggle(e.toggle, GUILayout.Width(columnWidth / 2));
            if (e.toggle)
            {
                e.capsuleCenter = EditorGUILayout.Vector3Field("", e.capsuleCenter, GUILayout.Width(columnWidth));
                e.capsuleRadius = EditorGUILayout.FloatField("", e.capsuleRadius, GUILayout.Width(columnWidth / 2));
                e.capsuleHeight = EditorGUILayout.FloatField("", e.capsuleHeight, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();
        }


        void ShowContentBulletScreen(ActionEvent e)
        {
            //初始骨骼|配置ID|发射个数|发射间隔帧数
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("ConfigID", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Position", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.bulletScreenId = EditorGUILayout.IntField(e.bulletScreenId, GUILayout.Width(columnWidth));
            e.bulletScreenPosition = EditorGUILayout.Vector3Field("", e.bulletScreenPosition, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentUseJoystick(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Speed", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.toggle = EditorGUILayout.Toggle(e.toggle, GUILayout.Width(columnWidth));
            e.moveSpeed = EditorGUILayout.FloatField(e.moveSpeed, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentFlowUp(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            if (e.toggle)
                GUILayout.Label("Power", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.toggle = EditorGUILayout.Toggle(e.toggle, GUILayout.Width(columnWidth));
            if (e.toggle)
                e.flowUpPower = EditorGUILayout.FloatField(e.flowUpPower, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentTimeScale(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Scale Value", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.timeScale = EditorGUILayout.FloatField(e.timeScale, GUILayout.Width(columnWidth / 2));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentToggle(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.toggle = EditorGUILayout.Toggle(e.toggle, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentWindow(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            if (e.type == ActionEventKind.AttackWindow)
            {
                GUILayout.Label("ClearState", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.toggle = EditorGUILayout.Toggle(e.toggle, GUILayout.Width(columnWidth / 2));
            if (e.type == ActionEventKind.AttackWindow)
            {
                e.isClear = EditorGUILayout.Toggle(e.isClear, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentCameraFix(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            if (e.toggle)
            {
                GUILayout.Label("Position", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
                GUILayout.Label("Angle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
                GUILayout.Label("Smooth", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();

            //坐标|角度|进入速度|退出速度

            EditorGUILayout.BeginHorizontal();
            e.toggle = EditorGUILayout.Toggle(e.toggle, GUILayout.Width(columnWidth / 2));
            if (e.toggle)
            {
                e.cameraPosition = EditorGUILayout.Vector3Field("", e.cameraPosition, GUILayout.Width(columnWidth));
                e.cameraAngle = EditorGUILayout.Vector3Field("", e.cameraAngle, GUILayout.Width(columnWidth));
                e.cameraSmooth = EditorGUILayout.FloatField("", e.cameraSmooth, GUILayout.Width(columnWidth / 2));
            }
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentArmorToggle(AnimationEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Toggle", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            bool state = e.intParameter == 1;
            state = EditorGUILayout.Toggle(state, GUILayout.Width(columnWidth));
            e.intParameter = state ? 1 : 0;
        }

        void ShowContentPlayAction(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("Animation Name", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.actionName = EditorGUILayout.TextField(e.actionName, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentCameraEffect(ActionEvent e)
        {
            EditorGUILayout.BeginHorizontal();
            //GUILayout.Label("Template", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
            GUILayout.Label("ID", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            GUILayout.Label("Name", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            //int selectSort = EditorGUILayout.Popup(0, cameraEffectNames.ToArray(), GUILayout.Width(columnWidth / 2));

            e.cameraEffectId = EditorGUILayout.IntField(e.cameraEffectId, GUILayout.Width(columnWidth));
            CameraEffectTemplate template = cameraEffectPack.GetTemplateById(e.cameraEffectId);
            if (template != null)
            {
                EditorGUILayout.TextField(template.name, GUILayout.Width(columnWidth));
            }
            else
            {
                EditorGUILayout.TextField("No Template!", GUILayout.Width(columnWidth));
            }
            EditorGUILayout.EndHorizontal();
        }

        void ShowContentMoveCurve(ActionEvent e)
        {
            MoveCurve curveobj = null;
            string path = null;

            if (e.file)
            {
                path = AssetDatabase.GetAssetPath(e.file.GetInstanceID());
                curveobj = AssetDatabase.LoadAssetAtPath<MoveCurve>(path);

                string folder = Path.GetDirectoryName(path).Replace("\\", "/");
                string[] strs = folder.Split('/');
                string folderName = strs[strs.Length - 1];
                curveobj.filePath = $"{folderName}/{curveobj.name}";

                e.filePath = curveobj.filePath;
            }

            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("File", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
            if (curveobj)
            {
                GUILayout.Label("Path", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth));
                GUILayout.Label("StartTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("EndTime", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                GUILayout.Label("isZoom", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                if (e.type == ActionEventKind.Forward)
                {
                    GUILayout.Label("isCompensate", CustomEditorStyles.subTitleLabel, GUILayout.Width(columnWidth / 2));
                }
            }
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            e.file = (MoveCurve)EditorGUILayout.ObjectField(curveobj, typeof(MoveCurve), false, GUILayout.Width(columnWidth - 53));

            if (curveobj)
            {
                curveobj.curve = EditorGUILayout.CurveField(curveobj.curve, GUILayout.Width(50));

                EditorGUILayout.TextField(e.filePath, GUILayout.Width(columnWidth));

                curveobj.startTime = e.time;
                curveobj.startRealTime = curveobj.startTime / 100f * selectModelClip.length;

                e.time = EditorGUILayout.FloatField(curveobj.startTime, GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                EditorGUILayout.LabelField(curveobj.startRealTime.ToString(), GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                float endTime = EditorGUILayout.FloatField(curveobj.endTime, GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                if (endTime < e.time) endTime = e.time;

                curveobj.endTime = endTime;
                curveobj.endRealTime = endTime / 100f * selectModelClip.length;
                EditorGUILayout.LabelField(curveobj.endRealTime.ToString(), GUILayout.Width(60), GUILayout.Width(columnWidth / 4));

                curveobj.isZoom = EditorGUILayout.Toggle(curveobj.isZoom, GUILayout.Width(columnWidth / 2));

                if (e.type == ActionEventKind.Forward)
                {
                    curveobj.isCompensate = EditorGUILayout.Toggle(curveobj.isCompensate, GUILayout.Width(columnWidth / 2));
                }

                EditorUtility.SetDirty(curveobj);
            }
            else
            {
                if (GUILayout.Button("Create", CustomEditorStyles.editBtn, GUILayout.Width(50)))
                {
                    string savePath = $"ResourcesWork/Data/MoveCurve/{selectFolder}/";
                    string mydirPath = Application.dataPath + "/" + savePath;
                    if (!Directory.Exists(mydirPath))
                    {
                        Directory.CreateDirectory(mydirPath);
                    }

                    MoveCurve curveObj = ScriptableObject.CreateInstance<MoveCurve>();

                    string newPath = "Assets/" + savePath + "/" + selectModelClipState + ".asset";
                    int counter = 1;
                    while (AssetDatabase.LoadAssetAtPath<MoveCurve>(newPath) != null && counter < 100)
                    {
                        newPath = "Assets/" + savePath + "/" + selectModelClipState + "_" + counter + ".asset";
                        counter++;
                    }

                    if (counter > 100)
                    {
                        return;
                    }

                    savePath = newPath;

                    AssetDatabase.CreateAsset(curveObj, savePath);
                    AssetDatabase.Refresh();
                    e.file = AssetDatabase.LoadAssetAtPath<MoveCurve>(savePath);

                    EditorUtility.SetDirty(curveObj);
                    AssetDatabase.SaveAssets();

                    forceApply = true;
                }
            }
            EditorGUILayout.EndHorizontal();
        }

        void ShowClipList()
        {
            string path = $"Assets/ResourcesWork/Model/{modelTabName}/{selectFolder}/{selectFile}{selectFileType}";

            RuntimeAnimatorController ctrl;
            AnimatorController animatorCtrl;
            AnimatorStateMachine stateMachine;

            if (selectFileType == ".overrideController")
            {
                ctrl = AssetDatabase.LoadAssetAtPath<AnimatorOverrideController>(path);
                string runTimePath = AssetDatabase.GetAssetPath((ctrl as AnimatorOverrideController).runtimeAnimatorController); ;
                animatorCtrl = AssetDatabase.LoadAssetAtPath<AnimatorController>(runTimePath);
                stateMachine = animatorCtrl.layers[0].stateMachine;
            }
            else
            {
                ctrl = AssetDatabase.LoadAssetAtPath<AnimatorController>(path);
                animatorCtrl = ctrl as AnimatorController;
                stateMachine = animatorCtrl.layers[0].stateMachine;
            }

            ChildAnimatorState[] _stateList = BattleEditorUtility.GetChildAnimatorState(stateMachine);
            List<ChildAnimatorState> stateList = new List<ChildAnimatorState>();
            foreach (var state in _stateList)
            {
                if (state.state.motion)
                {
                    stateList.Add(state);
                }
            }
            stateList.Sort((a, b) =>
            {
                string namea = Path.GetFileNameWithoutExtension(a.state.name);
                string nameb = Path.GetFileNameWithoutExtension(b.state.name);
                return string.CompareOrdinal(namea, nameb);
            });

            List<string> clipNames = new List<string>();
            List<AnimationClip> clips = new List<AnimationClip>();

            foreach (var childState in stateList)
            {
                string name = childState.state.motion.name;
                AnimationClip clip = BattleEditorUtility.GetClipData(name, ctrl);
                if (clip != null)
                {
                    clipNames.Add(childState.state.name);
                    clips.Add(clip);
                }
            }

            CheckEventPack(selectEventPack, clipNames.ToArray());

            EditorGUILayout.BeginHorizontal();
            GUILayout.Space(20);
            selectOrder = GUILayout.SelectionGrid(selectOrder, clipNames.ToArray(), 1, CustomEditorStyles.selectionGridLeft);
            if (selectOrder < clipNames.Count)
            {
                selectModelClipState = clipNames[selectOrder];
                selectModelClip = clips[selectOrder];
                selectModelClipFrameLength = (int)(selectModelClip.length * selectModelClip.frameRate);
                //Selection.activeObject = selectModelClip;
            }
            EditorGUILayout.EndHorizontal();

            /*
            if (!Directory.Exists(path + "/FBX"))
            {
                Directory.CreateDirectory(path + "/FBX");
            }

            DirectoryInfo root = new DirectoryInfo(path + "/FBX");
            FileInfo[] files = root.GetFiles("*.fbx");
            EditorGUILayout.BeginHorizontal();
            GUILayout.Space(20);
            string[] fileNames = new string[files.Length];
            string[] filePaths = new string[files.Length];
            int index = 0;
            foreach (FileInfo file in files)
            {
                if (file.Name.Contains("@"))
                {
                    fileNames[index] = file.Name.Split('@')[1].Replace(".FBX", string.Empty).Replace(".fbx", string.Empty);
                    filePaths[index] = file.FullName;
                    index++;
                }
            }

            CheckEventPack(selectEventPack, fileNames);

            selectOrder = GUILayout.SelectionGrid(selectOrder, fileNames, 1, CustomEditorStyles.selectionGridLeft);

            if (filePaths.Length == 0)
            {
                selectAnimationFilePath = string.Empty;
                selectModelClip = null;

                EditorGUILayout.EndHorizontal();
                return;
            }

            string tPath = string.Empty;
            if (filePaths.Length > 0)
            {
                tPath = filePaths[selectOrder];
                tPath = tPath.Replace("\\", "/");
            }

            if (tPath != selectAnimationFilePath)
            {
                selectAnimationFilePath = tPath;

                selectAnimationClipPath = GetClipPath(selectAnimationFilePath);

                selectModelImporter = AssetImporter.GetAtPath(selectAnimationClipPath) as ModelImporter;
                selectModelObject = new SerializedObject(selectModelImporter);
                selectModelClip = AssetDatabase.LoadAssetAtPath<AnimationClip>(selectAnimationClipPath);
                selectModelClipFrameLength = (int)(selectModelClip.length * selectModelClip.frameRate);
                Selection.activeObject = selectModelClip;
            }

            EditorGUILayout.EndHorizontal();
            */
        }

        List<string> GetModelPaths(string path)
        {
            List<string> list = new List<string>();
            DirectoryInfo root = new DirectoryInfo(path);
            DirectoryInfo[] di = root.GetDirectories();
            for (int i = 0; i < di.Length; i++)
            {
                list.Add(di[i].FullName);
            }
            return list;
        }

        string GetClipPath(string path)
        {
            string[] arr = path.Split('/');
            string clipPath = string.Empty;
            foreach (string str in arr)
            {
                if (str == "Assets")
                {
                    clipPath = str;
                }
                else
                {
                    if (clipPath != "")
                        clipPath += "/" + str;
                }
            }
            return clipPath;
        }


        void GenerateLua()
        {
            string savePath = Application.dataPath + "/Lua/config/action/";
            string fileName = selectFile + ".lua";

            string content = string.Empty;

            for (var i = selectEventPack.clipPacks.Count - 1; i >= 0; i--)
            {
                ActionEventSubPack subPack = selectEventPack.clipPacks[i];
                if (subPack.events.Count == 0)
                {
                    selectEventPack.clipPacks.RemoveAt(i);
                }
            }

            for (var i = 0; i < selectEventPack.clipPacks.Count; i++)
            {
                ActionEventSubPack subPack = selectEventPack.clipPacks[i];

                subPack.events.Sort((a, b) =>
                {
                    if (a.time > b.time)
                        return 1;
                    else if (a.time < b.time)
                        return -1;
                    else
                    {
                        if (a.addTime < b.addTime)
                            return -1;
                        else if (a.addTime > b.addTime)
                            return 1;
                        else
                            return 0;
                    }
                });

                string eventContent = string.Empty;

                for (var j = 0; j < subPack.events.Count; j++)
                {
                    ActionEvent e = subPack.events[j];

                    if (e.file is AttackFrame)
                    {
                        EditorUtility.DisplayProgressBar("Export AttackFrame", e.file.name, j / subPack.events.Count);
                        BattleEditorUtility.GenerateAttackFrameLua(e.file as AttackFrame);
                    }
                    else if (e.file is MoveCurve)
                    {
                        EditorUtility.DisplayProgressBar("Export MoveCurve", e.file.name, j / subPack.events.Count);
                        BattleEditorUtility.GenerateMoveCurveLua(e.file as MoveCurve);
                    }

                    string infoText = string.Empty;
                    PropertyInfo[] infos = e.GetType().GetProperties();
                    for (var x = 0; x < infos.Length; x++)
                    {
                        PropertyInfo info = infos[x];

                        if (ActionEventPack.CheckExportAttr(e.type.ToString(), info.Name))
                        {
                            var value = info.GetValue(e);

                            infoText += $"\t\t\t{BattleEditorUtility.TranslateFieldToFixed(info.Name, value)},\n";
                        }
                    }

                    infoText = infoText.Substring(0, infoText.Length - 2);

                    if (j + 1 == subPack.events.Count)
                        eventContent += string.Format("\t\t[{0}] = {{\n{1}\n\t\t}}\n", j + 1, infoText);
                    else
                        eventContent += string.Format("\t\t[{0}] = {{\n{1}\n\t\t}},\n", j + 1, infoText);
                }

                string subText = string.Format("\n\t[\"{0}\"] = {{\n{1}\t}},", subPack.stateName, eventContent);
                content += subText;
            }

            if (content.Length > 0)
            {
                content = content.Substring(0, content.Length - 1);
            }

            string luaText = $"--action event pack\n--{selectFile}\n\nreturn\n{{\n\t{content}\n}}";

            EditorUtility.DisplayProgressBar("Export ActionEvent", selectFile, 1);

            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }

            //var encoding = new UTF8Encoding(false);
            //File.WriteAllText(savePath+fileName, luaText, encoding);

            //if (Application.isPlaying)
            //{
            //    string content2 = luaText.Replace("return", "ActionConfig[\""+ selectFile + "\"]=");
            //    UnityEngine.Debug.Log($"ActionConfig {selectFile} Require Success!");
            //    GameManager.Instance.LuaMgr.DoLuaString(content2);
            //}

            EditorUtility.ClearProgressBar();
        }
    }






    class AnimationClipInfoProperties
    {
        SerializedProperty m_Property;

        private SerializedProperty Get(string property) { return m_Property.FindPropertyRelative(property); }

        public AnimationClipInfoProperties(SerializedProperty prop) { m_Property = prop; }

        public string name { get { return Get("name").stringValue; } set { Get("name").stringValue = value; } }
        public string takeName { get { return Get("takeName").stringValue; } set { Get("takeName").stringValue = value; } }
        public float firstFrame { get { return Get("firstFrame").floatValue; } set { Get("firstFrame").floatValue = value; } }
        public float lastFrame { get { return Get("lastFrame").floatValue; } set { Get("lastFrame").floatValue = value; } }
        public int wrapMode { get { return Get("wrapMode").intValue; } set { Get("wrapMode").intValue = value; } }
        public bool loop { get { return Get("loop").boolValue; } set { Get("loop").boolValue = value; } }

        // Mecanim animation properties
        public float orientationOffsetY { get { return Get("orientationOffsetY").floatValue; } set { Get("orientationOffsetY").floatValue = value; } }
        public float level { get { return Get("level").floatValue; } set { Get("level").floatValue = value; } }
        public float cycleOffset { get { return Get("cycleOffset").floatValue; } set { Get("cycleOffset").floatValue = value; } }
        public bool loopTime { get { return Get("loopTime").boolValue; } set { Get("loopTime").boolValue = value; } }
        public bool loopBlend { get { return Get("loopBlend").boolValue; } set { Get("loopBlend").boolValue = value; } }
        public bool loopBlendOrientation { get { return Get("loopBlendOrientation").boolValue; } set { Get("loopBlendOrientation").boolValue = value; } }
        public bool loopBlendPositionY { get { return Get("loopBlendPositionY").boolValue; } set { Get("loopBlendPositionY").boolValue = value; } }
        public bool loopBlendPositionXZ { get { return Get("loopBlendPositionXZ").boolValue; } set { Get("loopBlendPositionXZ").boolValue = value; } }
        public bool keepOriginalOrientation { get { return Get("keepOriginalOrientation").boolValue; } set { Get("keepOriginalOrientation").boolValue = value; } }
        public bool keepOriginalPositionY { get { return Get("keepOriginalPositionY").boolValue; } set { Get("keepOriginalPositionY").boolValue = value; } }
        public bool keepOriginalPositionXZ { get { return Get("keepOriginalPositionXZ").boolValue; } set { Get("keepOriginalPositionXZ").boolValue = value; } }
        public bool heightFromFeet { get { return Get("heightFromFeet").boolValue; } set { Get("heightFromFeet").boolValue = value; } }
        public bool mirror { get { return Get("mirror").boolValue; } set { Get("mirror").boolValue = value; } }

        public AnimationEvent GetEvent(int index)
        {
            AnimationEvent evt = new AnimationEvent();
            SerializedProperty events = Get("events");

            if (events != null && events.isArray)
            {
                if (index < events.arraySize)
                {
                    evt.floatParameter = events.GetArrayElementAtIndex(index).FindPropertyRelative("floatParameter").floatValue;
                    evt.functionName = events.GetArrayElementAtIndex(index).FindPropertyRelative("functionName").stringValue;
                    evt.intParameter = events.GetArrayElementAtIndex(index).FindPropertyRelative("intParameter").intValue;
                    evt.objectReferenceParameter = events.GetArrayElementAtIndex(index).FindPropertyRelative("objectReferenceParameter").objectReferenceValue;
                    evt.stringParameter = events.GetArrayElementAtIndex(index).FindPropertyRelative("data").stringValue;
                    evt.time = events.GetArrayElementAtIndex(index).FindPropertyRelative("time").floatValue;
                }
                else
                {
                    UnityEngine.Debug.LogWarning("Invalid Event Index");
                }
            }

            return evt;
        }

        public void SetEvent(int index, AnimationEvent animationEvent)
        {
            SerializedProperty events = Get("events");

            if (events != null && events.isArray)
            {
                if (index < events.arraySize)
                {
                    events.GetArrayElementAtIndex(index).FindPropertyRelative("floatParameter").floatValue = animationEvent.floatParameter;
                    events.GetArrayElementAtIndex(index).FindPropertyRelative("functionName").stringValue = animationEvent.functionName;
                    events.GetArrayElementAtIndex(index).FindPropertyRelative("intParameter").intValue = animationEvent.intParameter;
                    events.GetArrayElementAtIndex(index).FindPropertyRelative("objectReferenceParameter").objectReferenceValue = animationEvent.objectReferenceParameter;
                    events.GetArrayElementAtIndex(index).FindPropertyRelative("data").stringValue = animationEvent.stringParameter;
                    events.GetArrayElementAtIndex(index).FindPropertyRelative("time").floatValue = animationEvent.time;
                }

                else
                {
                    UnityEngine.Debug.LogWarning("Invalid Event Index");
                }
            }
        }


        public void ClearEvents()
        {
            SerializedProperty events = Get("events");

            if (events != null && events.isArray)
            {
                events.ClearArray();
            }
        }

        public int GetEventCount()
        {
            int ret = 0;

            SerializedProperty curves = Get("events");

            if (curves != null && curves.isArray)
            {
                ret = curves.arraySize;
            }

            return ret;
        }

        public void SetEvents(AnimationEvent[] newEvents)
        {
            SerializedProperty events = Get("events");

            if (events != null && events.isArray)
            {
                events.ClearArray();

                foreach (AnimationEvent evt in newEvents)
                {
                    events.InsertArrayElementAtIndex(events.arraySize);
                    SetEvent(events.arraySize - 1, evt);
                }
            }
        }

        public AnimationEvent[] GetEvents()
        {
            AnimationEvent[] ret = new AnimationEvent[GetEventCount()];
            SerializedProperty events = Get("events");

            if (events != null && events.isArray)
            {
                for (int i = 0; i < GetEventCount(); ++i)
                {
                    ret[i] = GetEvent(i);
                }
            }

            return ret;

        }

    }
}
