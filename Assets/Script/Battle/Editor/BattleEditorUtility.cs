using Dal;
using Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using UnityEditor;
using UnityEditor.Animations;
using UnityEngine;

public static class BattleEditorUtility
{
    public static void GenerateBehaviorLua(BattleBehaviorPack pack)
    {
        string content = string.Empty;
        content += "return {\n";

        foreach (BattleBehaviorConfig item in pack.list)
        {
            content += $"\t[{item.id}] = {{\n";
            item.content.Trim();

            string label = string.Empty;
            string[] splits = item.content.Split(';');
            foreach(var sp in splits)
            {
                string[] arr = sp.Split(',');
                label += $"\t\t{arr[0]}_{arr[1]} = {{";
                for(var i=0;i < pack.fields.Count; i++)
                {
                    if (pack.fields[i].type == BattleBehaviorFieldType.String)
                    {
                        label += $"{pack.fields[i].name} = \"{arr[i]}\", ";
                    }
                    else
                    {
                        label += $"{pack.fields[i].name} = {arr[i]}, ";
                    }
                }
                label += "},\n";
            }

            content += label;
            content += "\t},\n";
        }

        content += "\n}";

        string fileName = "HitBehavior";
        string savePath = Application.dataPath + $"/Lua/config/";

        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        var encoding = new UTF8Encoding(false);
        File.WriteAllText(savePath + fileName + ".lua", content, encoding);
    }

    public static void GenerateSummonSetLua(SummonSet bsFile)
    {
        Type tp = bsFile.GetType();

        FieldInfo[] fields = tp.GetFields();

        List<string> strs = new List<string>();

        foreach (FieldInfo field in fields)
        {
            var name = field.Name;
            var value = field.GetValue(bsFile);
            //Debug.Log(name);
            if (name == "lifeTime")
            {
                strs.Add(TranslateFieldToFixed(name, value));
            }
            else if (value is SummonBornConfig)
            {
                Type tp2 = value.GetType();
                FieldInfo[] fields2 = tp2.GetFields();
                string ss = $"{name} = {{";
                foreach (FieldInfo f in fields2)
                {
                    var n = f.Name;
                    var v = f.GetValue(value);
                    ss += "\n\t\t" + TranslateFieldToFixed(n, v)+",";
                }
                ss += "\n\t}";
                strs.Add(ss);
            }
            else
            {
                strs.Add(TranslateField(name, value));
            }
        }

        string fileName = bsFile.name;

        string contentHead = $"--SummonSet\n--{bsFile.luaPath}--{fileName}\n\n";
        string content = $"return\n{{\n";

        foreach (string s in strs)
        {
            content += $"\t{s},\n";
        }

        content += $"}}";

        string savePath = Application.dataPath + $"/Lua/config/summon/";

        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        var encoding = new UTF8Encoding(false);
        File.WriteAllText(savePath + fileName + ".lua", contentHead + content, encoding);

        if (Application.isPlaying)
        {
            //string content2 = content.Replace("return", "SummonSetConfig[\"" + bsFile.path + "\"]=");
            //Debug.Log($"SummonSetConfig {bsFile.path} Require Success!");
            //GameManager.Instance.LuaMgr.DoLuaString(content2);
        }
    }

    public static void GenerateBulletScreenLua(BulletScreenSet bsFile)
    {
        Type tp = bsFile.GetType();

        FieldInfo[] fields = tp.GetFields();

        List<string> strs = new List<string>();

        foreach (FieldInfo field in fields)
        {
            var name = field.Name;
            var value = field.GetValue(bsFile);
            //Debug.Log(name);
            strs.Add(TranslateFieldToFixed(name, value));
        }

        string fileName = bsFile.name;

        string contentHead = $"--BulletScreen\n--{bsFile.filePath}--{fileName}\n\n";
        string content = $"return\n{{\n";

        foreach (string s in strs)
        {
            content += $"\t{s},\n";
        }

        content += $"}}";

        string savePath = Application.dataPath + $"/Lua/config/bulletscreen/";

        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        var encoding = new UTF8Encoding(false);
        File.WriteAllText(savePath + fileName + ".lua", contentHead + content, encoding);

        if (Application.isPlaying)
        {
            //string content2 = content.Replace("return", "BulletScreenConfig[\"" + bsFile.filePath + "\"]=");
            //Debug.Log($"BulletScreenConfig {bsFile.filePath} Require Success!");
            //GameManager.Instance.LuaMgr.DoLuaString(content2);
        }
    }

    public static void GenerateAttackFrameLua(AttackFrame frameFile)
    {
        Type tp = frameFile.GetType();

        FieldInfo[] fields = tp.GetFields();

        List<string> strs = new List<string>();

        foreach (FieldInfo field in fields)
        {
            var name = field.Name;
            var value = field.GetValue(frameFile);
            //Debug.Log(name);
            strs.Add(TranslateFieldToFixed(name, value));
        }

        string fileName = frameFile.name;

        string contentHead = $"--AttackFrame\n--{frameFile.filePath}--{fileName}\n\n";
        string content = $"return\n{{\n";

        foreach (string s in strs)
        {
            content += $"\t{s},\n";
        }

        content += $"}}";

        string saveFolder = frameFile.filePath.Split('/')[0];
        string savePath = Application.dataPath + $"/Lua/config/attackframe/{saveFolder}/";

        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        var encoding = new UTF8Encoding(false);
        File.WriteAllText(savePath + fileName + ".lua", contentHead+content, encoding);

        if (Application.isPlaying)
        {
            //string content2 = content.Replace("return", "AttackFrameConfig[\"" + frameFile.filePath + "\"]=");
            //Debug.Log($"AttackFrameConfig {frameFile.filePath} Require Success!");
            //GameManager.Instance.LuaMgr.DoLuaString(content2);
        }
    }

    public static void GenerateMoveCurveLua(MoveCurve frameFile)
    {
        Type tp = frameFile.GetType();

        FieldInfo[] fields = tp.GetFields();

        List<string> strs = new List<string>();

        foreach (FieldInfo field in fields)
        {
            var name = field.Name;
            var value = field.GetValue(frameFile);

            if (value is AnimationCurve)
            {
                AnimationCurve curve = value as AnimationCurve;

                string curvestr = $"{name} = {{\n";

                for (int i = 0; i < curve.length; i++)
                {
                    Keyframe frame = curve.keys[i];

                    curvestr += $"\t\t[{i + 1}] = {{\n";
                    curvestr += $"\t\t\t{TranslateFieldToFixed("time", frame.time, true)},\n";
                    curvestr += $"\t\t\t{TranslateFieldToFixed("value", frame.value, true)},\n";
                    curvestr += $"\t\t\t{TranslateFieldToFixed("inTangent", frame.inTangent, true)},\n";
                    curvestr += $"\t\t\t{TranslateFieldToFixed("outTangent", frame.outTangent, true)},\n";
                    curvestr += $"\t\t}},\n";
                }

                curvestr += "\t}";
                strs.Add(curvestr);
            }
            else
            {
                strs.Add(TranslateFieldToFixed(name, value));
            }
        }

        string fileName = frameFile.name;

        string contentHead = $"--MoveCurve\n--{frameFile.filePath + " " + fileName}\n\n";
        string content = $"return\n{{\n";

        foreach (string s in strs)
        {
            content += $"\t{s},\n";
        }

        content += $"}}";

        string saveFolder = frameFile.filePath.Split('/')[0];
        string savePath = Application.dataPath + "/Lua/config/movecurve/" + saveFolder + "/";

        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        var encoding = new UTF8Encoding(false);
        File.WriteAllText(savePath + fileName + ".lua", contentHead+content, encoding);

        if (Application.isPlaying)
        {
            //string content2 = content.Replace("return", "MoveCurveConfig[\"" + frameFile.filePath + "\"]=");
            //Debug.Log($"MoveCurveConfig {frameFile.filePath} Require Success!");
            //GameManager.Instance.LuaMgr.DoLuaString(content2);
        }
    }

    public static void GenerateStateMachineLua(string tabName, string folderName)
    {
        string packPath = $"Assets/ResourcesWork/Model/{tabName}/{folderName}";

        string[] paths = Directory.GetFiles(packPath, "*.*").Where(file => file.ToLower().EndsWith("controller") || file.ToLower().EndsWith("overrideController")).ToArray();

        foreach (string path in paths)
        {
            RuntimeAnimatorController ctrl;
            AnimatorController animatorCtrl;
            AnimatorStateMachine stateMachine;
            string fileName = Path.GetFileNameWithoutExtension(path);

            if (path.EndsWith("overrideController"))
            {
                ctrl = AssetDatabase.LoadAssetAtPath<AnimatorOverrideController>(path);
                string runTimePath = AssetDatabase.GetAssetPath((ctrl as AnimatorOverrideController).runtimeAnimatorController);
                animatorCtrl = AssetDatabase.LoadAssetAtPath<AnimatorController>(runTimePath);
                AnimatorControllerLayer layer = animatorCtrl.layers[0];
                stateMachine = layer.stateMachine;
            }
            else
            {
                ctrl = AssetDatabase.LoadAssetAtPath<AnimatorController>(path);
                animatorCtrl = ctrl as AnimatorController;
                AnimatorControllerLayer layer = animatorCtrl.layers[0];
                stateMachine = layer.stateMachine;
            }

            string content = string.Empty;

            string paramContent = string.Empty;

            for (var i = 0; i < animatorCtrl.parameters.Length; i++)
            {
                var parameter = animatorCtrl.parameters[i];
                paramContent += $"\t\t[\"{parameter.name}\"] = {{\n" +
                    $"\t\t\ttype = \"{parameter.type.ToString()}\",\n" +
                    $"\t\t\tdefaultBool = {parameter.defaultBool.ToString().ToLower()},\n" +
                    $"\t\t\t{TranslateFieldToFixed("defaultInt", parameter.defaultInt)},\n" +
                    $"\t\t\t{TranslateFieldToFixed("defaultFloat", parameter.defaultFloat)}\n";

                paramContent += $"\t\t}},\n";
            }

            string anyContent = string.Empty;

            for (var i = 0; i < stateMachine.anyStateTransitions.Length; i++)
            {
                var transition = stateMachine.anyStateTransitions[i];
                anyContent += GetTransitionData(animatorCtrl, transition, i, "\t\t");
            }

            string mapContent = string.Empty;

            ChildAnimatorState[] stateList = GetChildAnimatorState(stateMachine);

            foreach (var childState in stateList)
            {
                if (childState.state != null && childState.state.motion)
                {
                    string name = childState.state.motion.name;
                    AnimationClip clip = GetClipData(name, ctrl);

                    mapContent += $"\n\t\t[\"{name}\"] = {{\n" +
                        $"\t\t\t{BattleEditorUtility.TranslateFieldToFixed("length", clip.length)},\n" +
                        $"\t\t\tloop = {clip.isLooping.ToString().ToLower()},\n" +
                        $"\t\t\ttransitions = {{\n";

                    List<AnimatorStateTransition> trans = new List<AnimatorStateTransition>(childState.state.transitions);
                    trans.Sort((a, b) => {
                        if (a.exitTime > b.exitTime)
                            return 1;
                        else if (a.exitTime < b.exitTime)
                            return -1;
                        else
                            return 0;
                    });

                    for (var i = 0; i < trans.Count; i++)
                    {
                        var transition = trans[i];
                        if (transition.destinationState)
                            mapContent += GetTransitionData(animatorCtrl, transition, i, "\t\t\t\t");
                    }

                    mapContent += $"\t\t\t}}\n\t\t}},";
                }
            }

            content = $"\n\tdefaultState = \"{stateMachine.defaultState.name}\",";
            content += $"\n\tparameters = {{\n{paramContent}\t}},";
            content += $"\n\tanyStates = {{\n{anyContent}\t}},";
            content += $"\n\tstateMap = {{{mapContent}\n\t}}";

            string savePath = Application.dataPath + "/Lua/config/statemachine/";

            string fileNameExport = fileName + ".lua";

            string contentHead = $"--StateMachine {fileName}\n\n";
            content = $"return\n{{{content}\n}}";

            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }

            var encoding = new UTF8Encoding(false);
            File.WriteAllText(savePath + fileNameExport, contentHead+content, encoding);

            if (Application.isPlaying)
            {
                //string content2 = content.Replace("return", $"StateMachineConfig[\"{fileName}\"]=");
                //Debug.Log($"StateMachineConfig {fileName} Require Success!");
                //GameManager.Instance.LuaMgr.DoLuaString(content2);
            }
        }

    }

    static string GetTransitionData(AnimatorController controller, AnimatorStateTransition transition, int sort, string tab)
    {
        string str = $"{tab}[{sort + 1}] = {{\n" +
            $"{tab}\tname = \"{transition.destinationState.name}\",\n" +
            $"{tab}\thasExitTime = {transition.hasExitTime.ToString().ToLower()},\n" +
            $"{tab}\thasFixedDuration = {transition.hasFixedDuration.ToString().ToLower()},\n" +
            $"{tab}\t{TranslateFieldToFixed("exitTime", transition.exitTime)},\n" +
            $"{tab}\t{TranslateFieldToFixed("duration", transition.duration)},\n" +
            $"{tab}\t{TranslateFieldToFixed("offset", transition.offset)},\n";

        str += $"{tab}\tconditions = {{\n";
        for (var i = 0; i < transition.conditions.Length; i++)
        {
            var condition = transition.conditions[i];
            str += $"{tab}\t\t[{i + 1}] = {{";
            str += $"\n{tab}\t\t\tparameter = \"{condition.parameter}\",";
            str += $"\n{tab}\t\t\ttype = \"{GetControllerParameterType(controller, condition.parameter)}\",";
            str += $"\n{tab}\t\t\tmode = \"{condition.mode.ToString()}\",";
            str += $"\n{tab}\t\t\t{TranslateFieldToFixed("threshold", condition.threshold)},";
            str += $"\n{tab}\t\t}},\n";
        }

        str += $"{tab}\t}}\n";

        str += $"{tab}}},\n";

        return str;
    }

    public static ChildAnimatorState[] GetChildAnimatorState(AnimatorStateMachine m)
    {
        List<ChildAnimatorState> stateList = new List<ChildAnimatorState>();
        stateList.AddRange(m.states);
        foreach (var cm in m.stateMachines)
        {
            stateList.AddRange(GetChildAnimatorState(cm.stateMachine));
        }
        return stateList.ToArray();
    }

    static string GetControllerParameterType(AnimatorController ctrl, string parameter)
    {
        foreach (var t in ctrl.parameters)
        {
            if (t.name == parameter)
            {
                return t.type.ToString();
            }
        }
        return string.Empty;
    }

    public static AnimationClip GetClipData(string clipName, RuntimeAnimatorController ctrl)
    {
        if(ctrl is AnimatorOverrideController)
        {
            List<KeyValuePair<AnimationClip, AnimationClip>> m_Clips = new List<KeyValuePair<AnimationClip, AnimationClip>>();
            (ctrl as AnimatorOverrideController).GetOverrides(m_Clips);

            foreach (KeyValuePair<AnimationClip, AnimationClip> kvp in m_Clips)
            {
                if (kvp.Key.name == clipName)
                {
                    if (kvp.Value != null)
                    {
                        return kvp.Value;
                    }
                    else
                    {
                        return kvp.Key;
                    }
                }
            }
            return null;
        }
        else
        {
            AnimatorController actrl = ctrl as AnimatorController;
            foreach (var clip in actrl.animationClips)
            {
                if(clip.name== clipName)
                {
                    return clip;
                }
            }
        }
        return null;
    }

    public static string TranslateField(string name, object value)
    {
        bool isString = value is string;

        if (value is bool)
        {
            value = value.ToString().ToLower();
        }
        else if (value is float)
        {
            value = value.ToString().ToLower();
        }
        else if (value is int)
        {
            value = value.ToString().ToLower();
        }
        else if (value is Vector3)
        {
            value = value.ToString().ToLower();
        }
        else
        {
            if (value != null)
            {
                value = value.ToString();
            }
            else
            {
                value = "";
            }

            isString = true;
        }

        if (isString)
        {
            value = $"\"{value}\"";
        }

        return $"{name} = {value}";
    }

    public static string TranslateFieldToFixed(string name, object value, bool isPureValue=false )
    {
        bool isString = value is string;

        if (value is bool)
        {
            value = value.ToString().ToLower();
        }
        else if (value is float)
        {
            //value = FixedUtils.ConvertToFixed64LuaStr((float)value, isPureValue);
        }
        else if (value is int)
        {
            //value = FixedUtils.ConvertToFixed64LuaStr((int)value, isPureValue);
        }
        else if (value is Vector3)
        {
            //value = FixedUtils.ConvertToVector3LuaStr((Vector3)value, isPureValue);
        }
        else
        {
            if (value != null)
            {
                value = value.ToString();
            }
            else
            {
                value = "";
            }

            isString = true;
        }

        if (isString)
        {
            value = $"\"{value}\"";
        }

        return $"{name} = {value}";
    }
}