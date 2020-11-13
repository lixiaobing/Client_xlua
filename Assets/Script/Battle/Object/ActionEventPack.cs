using System;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class ActionEventPack : ScriptableObject
{
    public string luaPath;

    public List<ActionEventSubPack> clipPacks = new List<ActionEventSubPack>();

    public ActionEventSubPack SearchEventSubPack(string stateName, AnimationClip clip)
    {
        foreach (ActionEventSubPack subPack in clipPacks)
        {
            if (subPack.stateName == stateName)
            {
                return subPack;
            }
        }

        ActionEventSubPack newSubPack = new ActionEventSubPack();
        clipPacks.Add(newSubPack);
        return newSubPack;
    }

    public static Color GetEventColor(ActionEventKind tp)
    {
        Color color = Color.white;
        switch (tp)
        {
            case ActionEventKind.Warning:
            case ActionEventKind.AttackFlag:
                color = Color.yellow;
                break;
            case ActionEventKind.Effect:
            case ActionEventKind.Sound:
                ColorUtility.TryParseHtmlString("#00b9fd", out color);
                break;
            case ActionEventKind.CameraSpecial:
            case ActionEventKind.CameraFix:
            case ActionEventKind.CameraEffect:
                ColorUtility.TryParseHtmlString("#FFFFFF", out color);
                break;
            case ActionEventKind.BehaviorTag:
                ColorUtility.TryParseHtmlString("#30F6D7", out color); ;
                break;
            case ActionEventKind.Attack:
                color = Color.red;
                break;
            case ActionEventKind.Bullet:
            case ActionEventKind.BulletScreen:
            case ActionEventKind.Trap:
            case ActionEventKind.Summon:
                color = Color.magenta;
                break;
            case ActionEventKind.Forward:
            case ActionEventKind.Backward:
            case ActionEventKind.Leftward:
            case ActionEventKind.Rightward:
            case ActionEventKind.FlowUp:
                color = Color.green;
                break;
            case ActionEventKind.Armor:
            case ActionEventKind.Super:
            case ActionEventKind.SceneDark:
            case ActionEventKind.UseJoystick:
            case ActionEventKind.IgnoreCollision:
            case ActionEventKind.ModelDisappear:
            case ActionEventKind.JumpTwice:
                color = Color.grey;
                break;
            case ActionEventKind.AttackWindow:
            case ActionEventKind.RunWindow:
            case ActionEventKind.RushWindow:
            case ActionEventKind.SkillWindow:
            case ActionEventKind.SuperWindow:
            case ActionEventKind.ChangeWindow:
                ColorUtility.TryParseHtmlString("#FD79C2", out color);
                break;
            default:
                color = Color.black;
                break;
        }
        return color;
    }

    public static CameraEffectType GetCameraEffectType(string typeName)
    {
        CameraEffectType eventType = CameraEffectType.None;
        string[] types = Enum.GetNames(typeof(CameraEffectType));
        for (int i = 0; i < types.Length; i++)
        {
            if (types[i] == typeName)
            {
                eventType = (CameraEffectType)i;
            }
        }
        return eventType;
    }


    public static bool CheckExportAttr(string typeName, string attrName)
    {
        ActionEventKind kind = ActionEvent.GetActionEventKind(typeName);

        if (attrName == "file")
        {
            return false;
        }

        List<string> attrList = new List<string>();
        string[] attrs = { "type", "time", "realTime" };
        attrList.AddRange(attrs);

        if (kind==ActionEventKind.Attack)
        {
            attrList.Add("filePath");
            attrList.Add("attackGroupTag");
        }
        else if (kind == ActionEventKind.AttackFlag)
        {
            attrList.Add("flagPosition");
            attrList.Add("flagDirection");
            attrList.Add("flagTime");
            attrList.Add("flagRealTime");
            attrList.Add("flagRange");
            attrList.Add("flagAngle");
            attrList.Add("flagRadius");
            attrList.Add("flagSize");
        }
        else if (kind == ActionEventKind.SpaceCheck)
        {
            attrList.Add("toggle");
            attrList.Add("spaceTime");
            attrList.Add("spaceRealTime");
        }
        else if (kind == ActionEventKind.Effect)
        {
            attrList.Add("filePath");
        }
        else if (kind == ActionEventKind.Warning)
        {
            attrList.Add("filePath");
            attrList.Add("endTime");
            attrList.Add("endRealTime");
        }
        else if (kind == ActionEventKind.Sound)
        {
            attrList.Add("akEventName");
            attrList.Add("volume");
            attrList.Add("mute");
        }
        else if (kind == ActionEventKind.Bullet)
        {
            attrList.Add("bulletShootPosition");
            attrList.Add("bulletShootDirection");
            attrList.Add("bulletId");
            attrList.Add("bulletCount");
            attrList.Add("bulletInterval");
        }
        else if (kind == ActionEventKind.BulletScreen)
        {
            attrList.Add("bulletScreenId");
            attrList.Add("bulletScreenPosition");
        }
        else if (kind == ActionEventKind.Trap)
        {
            attrList.Add("trapPosition");
            attrList.Add("trapDirection");
            attrList.Add("trapId");
        }
        else if (kind == ActionEventKind.CameraFix)
        {
            attrList.Add("toggle");
            attrList.Add("cameraPosition");
            attrList.Add("cameraAngle");
            attrList.Add("cameraSmooth");
        }
        else if (kind == ActionEventKind.PlayAction)
        {
            attrList.Add("actionName");
        }
        else if (kind == ActionEventKind.TimeScale)
        {
            attrList.Add("timeScale");
            attrList.Add("timeScaleMonster");
        }
        else if (kind == ActionEventKind.FlowUp)
        {
            attrList.Add("toggle");
            attrList.Add("flowUpPower");
        }
        else if (kind == ActionEventKind.CameraEffect)
        {
            attrList.Add("cameraEffectId");
        }
        else if(kind == ActionEventKind.UseJoystick)
        {
            attrList.Add("toggle");
            attrList.Add("moveSpeed");
        }
        else if (kind == ActionEventKind.BehaviorTag)
        {
            attrList.Add("content");
        }
        else if (kind == ActionEventKind.UserState)
        {
            attrList.Add("toggle");
            attrList.Add("content");
            attrList.Add("isClear");
        }
        else if (kind == ActionEventKind.Forward || kind == ActionEventKind.Backward || kind == ActionEventKind.Leftward || kind == ActionEventKind.Rightward)
        {
            attrList.Add("filePath");
        }
        else if (kind == ActionEventKind.AttackWindow || kind == ActionEventKind.RunWindow || kind == ActionEventKind.RushWindow || 
            kind == ActionEventKind.SkillWindow || kind == ActionEventKind.SuperWindow || kind == ActionEventKind.ChangeWindow)
        {
            attrList.Add("toggle");
            if(kind == ActionEventKind.AttackWindow)
            {
                attrList.Add("isClear");
            }
        }
        else if (kind == ActionEventKind.ModelDisappear || kind == ActionEventKind.SceneDark || 
            kind == ActionEventKind.Armor || kind == ActionEventKind.Super || kind == ActionEventKind.CameraSpecial || 
            kind == ActionEventKind.IgnoreCollision || kind == ActionEventKind.Speedbreaker || kind == ActionEventKind.JumpTwice)
        {
            attrList.Add("toggle");
        }
        else if (kind == ActionEventKind.Capsule)
        {
            attrList.Add("toggle");
            attrList.Add("capsuleCenter");
            attrList.Add("capsuleRadius");
            attrList.Add("capsuleHeight");
        }
        else if (kind == ActionEventKind.LookTarget)
        {
            attrList.Add("lookTargetSpeed");
            attrList.Add("lookTargetTime");
            attrList.Add("lookTargetRealTime");
        }
        else if (kind == ActionEventKind.Summon)
        {
            attrList.Add("filePath");
        }

        return attrList.Contains(attrName);
    }
}

[System.Serializable]
public class ActionEventSubPack
{
    public string stateName;

    public AnimationClip clip;

    public int frameLength;

    public List<ActionEvent> events = new List<ActionEvent>();
}

