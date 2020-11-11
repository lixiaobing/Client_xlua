
using System.Collections.Generic;
using UnityEngine;
using XLua;

[LuaCallCSharp]
public static class GameLog
{
    public static bool Enable = true;

    public static List<BattleLog> battleLogs = new List<BattleLog>();

    public static void Log(object message)
    {
        if (Enable)
            Debug.Log(message);
    }

    public static void Log(object message, Object context)
    {
        if (Enable)
            Debug.Log(message, context);
    }

    public static void Log(string format, params object[] args)
    {
        if (Enable)
            Debug.LogFormat(format, args);
    }

    public static void Log(Object context, string format, params object[] args)
    {
        if (Enable)
            Debug.LogFormat(context, format, args);
    }

    public static void Info(object message)
    {
        Debug.Log(message);
    }

    public static void Info(object message, Object context)
    {
        Debug.Log(message, context);
    }

    public static void Info(string format, params object[] args)
    {
        Debug.LogFormat(format, args);
    }

    public static void Info(Object context, string format, params object[] args)
    {
        Debug.LogFormat(context, format, args);
    }

    public static void LogError(object message)
    {
        Debug.LogError(message);
    }

    public static void LogError(object message, Object context)
    {
        Debug.LogError(message, context);
    }

    public static void LogError(string format, params object[] args)
    {
        if (Enable)
            Debug.LogErrorFormat(format, args);
    }

    public static void LogError(Object context, string format, params object[] args)
    {
        if (Enable)
            Debug.LogErrorFormat(context, format, args);
    }


    public static void LogWarning(object message)
    {
        if (Enable)
            Debug.LogWarning(message);
    }

    public static void LogWarning(object message, Object context)
    {
        if (Enable)
            Debug.LogWarning(message, context);
    }


    public static void LogWarning(string format, params object[] args)
    {
        if (Enable)
            Debug.LogWarningFormat(format, args);
    }

    public static void LogWarning(Object context, string format, params object[] args)
    {
        if (Enable)
            Debug.LogWarningFormat(context, format, args);
    }

    public static void LogException(System.Exception e)
    {
        Debug.LogException(e);
    }

    public static void BattleLog(string message, string traceback)
    {
        BattleLog log = new BattleLog();
        log.time = System.DateTime.Now.ToString("HH:mm:ss");
        log.message = message;
        log.traceback = traceback;
        battleLogs.Add(log);

        if (battleLogs.Count > 100)
            battleLogs.RemoveAt(0);
    }

    public static void ClearBattleLog()
    {
        battleLogs.Clear();
    }
}

public struct BattleLog
{
    public string time;
    public string message;
    public string traceback;
}
