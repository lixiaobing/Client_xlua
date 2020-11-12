using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
namespace hjcd.level
{
    public abstract class BaseWindow : EditorWindow
    {
        static readonly List<EditorWindow> windows = new List<EditorWindow>();

        public readonly bool[] extends = { true, true, true, true, true, true, true, true , true, true, true, true, true, true, true, true , true, true, true, true, true, true, true, true };
        //子窗体
        readonly List<BaseWindow> childs = new List<BaseWindow>();
        //父窗体
        BaseWindow parent;

        //是否初始化
        bool bInit;

        public static T GetWindow<T>(params System.Object[] obj) where T : BaseWindow
        {
            foreach (var item in windows)
            {
                if (item.GetType() == typeof(T)) {
                    return (T)item;
                }
            }
            T t = EditorWindow.GetWindow<T>();
            t.DoInitlize(obj);
            return t;
        }
        public static T OpenWindow<T>(params System.Object[] obj) where T : BaseWindow {
            T t = BaseWindow.GetWindow<T>(obj);
            return t;
        }

        public T Open<T>(params System.Object[] obj) where T : BaseWindow
        {
            T t = EditorWindow.GetWindow<T>();
            t.parent = this;
            t.DoInitlize(obj);
            childs.Add(t); //添加到子窗体
            return t;           
        }
/*        public BaseWindow Parent {
            set {
                Parent = value;
            }
        }*/
        public void DoInitlize(params System.Object[] obj) {
            if (!bInit) {
                bInit = true;
                Initlize(obj);
            }
        }
        public abstract void Initlize(params System.Object[] obj);
        public void CloseChild() {
            foreach (var child in childs)
            {
                child.Close_();
            }

        }
        public void Close_()
        {
            this.Close();
            this.CloseChild();
        }

/*        public virtual void Awake_() { 
        
        }*/
        public void Awake() {
            windows.Add(this);
        }
        public void OnDestroy() {
            windows.Remove(this);
            OnDestroyImp();
        }

        public virtual void OnDestroyImp()
        {
        
        }
        public string TitleContent {
            set { 
                this.titleContent = new GUIContent(value); 
            }
        }

        public void SetExtend(int index, bool value)
        {
            if (extends[index] != value)
            {
                if (value)
                {
                    for (int i = 0; i < 2; i++)
                    {
                        extends[i] = false;
                    }
                }
            }
            extends[index] = value;
        }
    }
}