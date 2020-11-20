using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using XLua;
using XLua.Cast;

namespace Framework
{
    public class LuaCoroutine : MonoBehaviour
    {
        public void YieldShell(object o, Action callback)
        {
            StartCoroutine(CoBody(o, callback));
        }

        private IEnumerator CoBody(object o, Action callback)
        {
            if (o is IEnumerator)
            {
                yield return StartCoroutine((IEnumerator)o);
            }
            else
            {
                yield return o;
            }
            callback();
        }
    }

    public class XIEnumerator : Any<IEnumerator>
    {
        public XIEnumerator(IEnumerator i) : base(i)
        {
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
