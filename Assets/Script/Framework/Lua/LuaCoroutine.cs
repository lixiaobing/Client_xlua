using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using XLua;

namespace Framework
{
    public class LuaCoroutine : MonoBehaviour
    {
        public void YieldAndCallback(object to_yield, Action callback)
        {
            StartCoroutine(CoBody(to_yield, callback));
        }

        private IEnumerator CoBody(object to_yield, Action callback)
        {
            if (to_yield is IEnumerator)
            {
                yield return StartCoroutine((IEnumerator)to_yield);
            }
            else
            {
                yield return to_yield;
            }
            callback();
        }
    }

    public static class LuaCoroutineConfig
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp
        {
            get
            {
                return new List<Type>()
            {
                typeof(WaitForSeconds),
                typeof(WWW)
            };
            }
        }
    }
}
