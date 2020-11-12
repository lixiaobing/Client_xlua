using System;
using System.Collections.Generic;
using UnityEngine;

public class LevelNogs:MonoBehaviour
{   //战斗据点
    [SerializeField][Header("据点")]
    public List<GameObject> strongholds;
    //战斗区域
    [SerializeField][Header("战斗区域")]
    public List<GameObject> areas;
    //区域空气墙（和战斗区域成对出现）
    [SerializeField][Header("区域空气墙")]
    public List<GameObject> walls;

}

