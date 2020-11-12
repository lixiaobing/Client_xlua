#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;

namespace hjcd.level
{
    public interface IToolBar
    {
        string EntryName();
    }
}
#endif