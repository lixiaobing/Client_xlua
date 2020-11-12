using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{

    public interface IOperate
    {
/*        void Copy<T>(T t);
        void PreDel<T>(T t);*/

        void Copy(object obj);
        void PreDel(object obj);
    }
}