using Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Xml.Serialization;
using UnityEditor;
using UnityEngine;

namespace hjcd.level {

    //ID生成器
    public static class IDFactory {
        private static System.Random random = new System.Random();
        public static string GetUUID()
        {
            return GetLongUUID().ToString();             //return Guid.NewGuid().ToString("N");
        }
        public static long GetLongUUID()
        {
            byte[] data = Guid.NewGuid().ToByteArray();
            return BitConverter.ToInt64(data, 0);                     //return Guid.NewGuid().ToString().GetHashCode();

        }
        //随机怪物ID
        public static long GenerateMonsterID()
        {
            string millisecond = ((DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000).ToString(); //毫秒
            millisecond = millisecond.Substring(millisecond.Length - 8) + string.Format("{0:D2}", random.Next(0, 99));
            return long.Parse(millisecond);
        }
    }

    public static class LEditorGUILayout
    {


    }

    public static class LGUISkin
    {
            
        private const string skinPath = "Assets/Editor/LevelEditor/res/skin.guiskin";
        private static GUISkin skin;  //自定义
        public static GUISkin Skin
        {
            get
            {
                if (skin == null)
                {
                    skin = AssetDatabase.LoadAssetAtPath<GUISkin>(skinPath);
                }
                return skin;
            }
        }

        public static GUIStyle GetStyle(string styleName)
        {
            return Skin.GetStyle(styleName);
        }
        public static GUIStyle Style1
        {
            get
            {
                return Skin.box;
            }
        }
        public static GUIStyle Style2
        {
            get
            {
                //return GUI.skin.box;
                return GUI.skin.customStyles[1];
            }
        }

        //定义通用字体
        public static Font font
        {
            get
            {
                return Skin.font;
            }
        }



        public const string texturePath = "Assets/Editor/LevelEditor/res/icon/LevelEditorTextures.asset";

        private static TextureList textures;  //自定义
        public static TextureList Textures
        {
            get
            {
                if (textures == null)
                {
                    textures = AssetDatabase.LoadAssetAtPath<TextureList>(texturePath);
                }
                return textures;
            }
        }


    }



    public static class Utils {

        static Utils()
        {
            
        }

        /*
                static List<CameraEffectTemplate> cameraEffectTemplates;

                public static List<CameraEffectTemplate> GetCameraEffectTemplates()
                {
                    if (cameraEffectTemplates == null)
                    {
                        CameraEffectPack  cameraEffectPack = AssetDatabase.LoadAssetAtPath<CameraEffectPack>("Assets/ResourcesAsset/Setting/CameraEffectPack.asset");
                        cameraEffectTemplates = cameraEffectPack.templates;
                    }
                    return cameraEffectTemplates;
                }
        */
        //TODOxlua


        public static string ResourcesPath {
            get
            {
                return Application.dataPath + "/ResourcesAsset/";
            }
        }
        //自定义skin路径
/*        public const string skinPath = "Assets/Editor/LevelEditor/res/skin.guiskin";
        private static GUISkin skin;  //自定义
        public static GUISkin Skin {
            get {
                if (skin == null) {
                    skin = AssetDatabase.LoadAssetAtPath<GUISkin>(skinPath);
                }
                return skin;
            }
        }

        public static GUIStyle GetStyle(string styleName) {
            return LGUISkin.Skin.GetStyle(styleName);
        }
        public static GUIStyle Style1 {
            get{
               return LGUISkin.Skin.box;
            }
        }
        public static GUIStyle Style2{
            get{
                //return GUI.skin.box;
                return GUI.skin.customStyles[1];
            }
        }
        //定义通用字体
        public static Font font
        {
            get
            {
                return LGUISkin.Skin.font;
            }
        }*/

        //提示Label  /* EditorGUILayout.HelpBox*/
        public static void LabelTip(string text, UnityEditor.MessageType messageType)
        {
            EditorGUILayout.HelpBox(text, (UnityEditor.MessageType)messageType);
            //GUILayout.Label(text, Skin.label, options);
        }
        public static void LabelTip(string text)
        {
            LabelTip(text, UnityEditor.MessageType.Info);
        }
        public static string GetDescription(System.Object actionType) {
            FieldInfo fieldInfo = actionType.GetType().GetField(actionType.ToString());
            object[] attribArray = fieldInfo.GetCustomAttributes(false);
            EnumDescription attrib = (EnumDescription)attribArray[0];
            return attrib.Description;
        }

        public static string GetDescription(Type info)
        {
            object[] attributes = info.GetCustomAttributes(true);
            EnumDescription attrib = (EnumDescription)attributes[0];
            return attrib.Description;
        }

        public static void LogError(object text)
        {
            Debug.Log(string.Format("<color=red>{0}</color>", text));
        }
        public static void Log(object text)
        {
            Debug.Log(string.Format("<color=yellow>{0}</color>", text));
        }

        public static void Log(object a, object b)
        {
            Debug.Log(string.Format("<color=yellow>{0}{1}</color>", a, b));
        }



        public static void MoveUp<T>(List<T> list, T e) {
            int index = list.IndexOf(e);
            if (index > 0) {
                list.Remove(e);
                list.Insert(index - 1, e);
            }
        }

        public static void MoveDown<T>(List<T> list, T e)
        {
            int index = list.IndexOf(e);
            if (index > -1 && index < list.Count - 1)
            {
                list.Remove(e);
                list.Insert(index + 1, e);
            }
        }


        public static T DrawPopup<T>(T o)
        {
            Array array = Enum.GetValues(o.GetType());
            string[] options = new string[array.Length];
            for (int index = 0; index < array.Length; index++)
            {
                T triggerType = (T)array.GetValue(index);
                options[index] = Utils.GetDescription(triggerType);
            }
            int selectIndex = Array.IndexOf(array, o);
            int newSelectIndex = EditorGUILayout.Popup(selectIndex, options);
            if (newSelectIndex != selectIndex)
            {
                /*            Repaint();*/
            }
            return (T)array.GetValue(newSelectIndex);
        }






        /*            string uuid = System.Guid.NewGuid().ToString(); // 9af7f46a-ea52-4aa3-b8c3-9fd484c2af12
            string uuidN = System.Guid.NewGuid().ToString("N"); // e0a953c3ee6040eaa9fae2b667060e09 
            string uuidD = System.Guid.NewGuid().ToString("D"); // 9af7f46a-ea52-4aa3-b8c3-9fd484c2af12
            string uuidB = System.Guid.NewGuid().ToString("B"); // {734fd453-a4f8-4c5d-9c98-3fe2d7079760}
            string uuidP = System.Guid.NewGuid().ToString("P"); //  (ade24d16-db0f-40af-8794-1e08e2040df3)
            string uuidX = System.Guid.NewGuid().ToString("X"); // {0x3fa412e3,0x8356,0x428f,{0xaa,0x34,0xb7,0x40,0*//*xda,0xaf,0x45,0x6f}}*/


        public static void DrawBezier(Rect start, Rect end, Color color)
        {
            Vector3 startPos = new Vector3(start.x + start.width - 10, start.y + start.height / 2, 0);
            Vector3 endPos = new Vector3(end.x + end.width, end.y + end.height / 2, 0);
            Vector3 startTan = startPos + (Vector3.right * 50);
            Vector3 endTan = endPos + (Vector3.left * 50);
            Color shadowCol = new Color(0, 0, 0, 0.06f);

            for (int i = 0; i < 3; i++) Handles.DrawBezier(startPos, endPos, startTan, endTan, shadowCol, null, (i + 1) * 5);
            Handles.DrawBezier(startPos, endPos, startTan, endTan, color, null, 2);

        }
        /*        public static T CreateInstance<T>() {
                   return  ScriptableObject.CreateInstance<T>();
                }*/

        //检查文件是否存在
        public static bool FileExists(string filePath) {
            if (!IsVaildPath(filePath)) {
                return false;
            }
            return System.IO.File.Exists(filePath);
        }
        //检查文件路径是否合法
        public static bool IsVaildPath(string path) {
            return !string.IsNullOrEmpty(path);
        }

        public static T CreateInstance<T>(string fullname)
        {
            return (T)Assembly.GetExecutingAssembly().CreateInstance(fullname);
        }

        public static void AssetSerialize(string asset_path, UnityEngine.Object obj)
        {
            AssetDatabase.CreateAsset(obj, asset_path);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }
        public static T AssetDeserialize<T>(string asset_path) where T : UnityEngine.Object
        {
            return AssetDatabase.LoadAssetAtPath<T>(asset_path);
        }


        public static void XmlSerialize(string savePath, object obj)
        {
            XmlSerialize(savePath, obj, obj.GetType());
        }

        //xml序列化
        public static void XmlSerialize(string savePath, object obj, Type type)
        {
            StreamWriter streamWriter = new StreamWriter(savePath);
            XmlSerializer xmlSerializer = new XmlSerializer(obj.GetType());
            xmlSerializer.Serialize(streamWriter, obj);
            streamWriter.Close();
            AssetDatabase.Refresh();
        }
        //xml反序列化
        public static T XmlDeserialize<T>(string xmlPath)
        {
            StreamReader streamWriter = new StreamReader(xmlPath);
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(T));
            T t = (T)xmlSerializer.Deserialize(streamWriter);
            //关闭流
            streamWriter.Close();
            return t;
        }

        public static object XmlDeserialize(string xmlPath, Type type)
        {
            StreamReader streamWriter = new StreamReader(xmlPath);
            XmlSerializer xmlSerializer = new XmlSerializer(type);
            object o = xmlSerializer.Deserialize(streamWriter);
            //关闭流
            streamWriter.Close();
            return o;
        }

        public static void DeleteFile(string path) {
            System.IO.File.Delete(path);
        }

        public static System.Random random = new System.Random();




        public static void DrawBackground(Rect rect)
        {
            float w = rect.width;
            float h = rect.height;

            Texture2D bg = new Texture2D(1, 1, TextureFormat.RGBA32, false);
            bg.SetPixel(0, 0, new Color(0.3f, 0.3f, 0.3f));
            bg.Apply();
            GUI.DrawTexture(new Rect(0, 0, w, h), bg);

            Handles.BeginGUI();
            Handles.color = new Color(0.7f, 0.7f, 0.7f, 0.1f);
            for (int i = 0; i * 60 <= w; i++) Handles.DrawLine(new Vector3(60 * i, 0), new Vector3(60 * i, h));
            for (int i = 0; i * 60 <= h; i++) Handles.DrawLine(new Vector3(0, 60 * i), new Vector3(w, 60 * i));
            Handles.color = new Color(0.5f, 0.5f, 0.5f, 0.1f);
            for (int i = 0; i * 20 <= w; i++) if (i % 3 != 0) Handles.DrawLine(new Vector3(20 * i, 0), new Vector3(20 * i, h));
            for (int i = 0; i * 20 <= h; i++) if (i % 3 != 0) Handles.DrawLine(new Vector3(0, 20 * i), new Vector3(w, 20 * i));
            Handles.EndGUI();
        }

        //折线
        public static void DrawLinkLine(Vector2 start, Vector2 end, Color color)
        {
            float offset = end.y - start.y;
            offset = offset * 0.7f;
            offset = Mathf.Max(offset, 5);
            Handles.color = color;
            Vector3 p1 = new Vector3(start.x, start.y);
            Vector3 p2 = new Vector3(start.x, start.y + offset);
            Vector3 p3 = new Vector3(end.x, start.y + offset);
            Vector3 p4 = new Vector3(end.x, end.y);
            Handles.DrawLine(p1, p2);
            Handles.DrawLine(p2, p3);
            Handles.DrawLine(p3, p4);

        }
        public static void DrawLinkLine(Vector2 start, Vector2 end)
        {
            DrawLinkLine(start, end, Color.white);
        }

        /// //////////////////////////////////////////////////////////////////////////

        public static float Slider(string name, float value,float lValue ,float rValue)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            float result = EditorGUILayout.Slider(value, lValue, rValue);
            EditorGUILayout.EndHorizontal();
            return result;
        }



        public static T EnumPopup<T>(string tile, T t) where T : Enum
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tile);
            T result = Utils.DrawPopup<T>(t);
            EditorGUILayout.EndHorizontal();
            return result;
        }

        public static int Popup(string tile, int selectIndex ,string[] options) 
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tile);
            int result = EditorGUILayout.Popup(selectIndex, options);
            EditorGUILayout.EndHorizontal();
            return result;
        }


        //public static T EnumPopup<T>(string title, T t) where T : Enum
        //{
        //    return (T)EditorGUILayout.EnumPopup(title, t);
        //}

        public static void LabelField(string name, string value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            EditorGUILayout.LabelField(value);
            EditorGUILayout.EndHorizontal();
        }
        public static int IntField(string name, int value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            int result = EditorGUILayout.IntField(value);
            EditorGUILayout.EndHorizontal();
            return result;
        }
        public static long LongField(string name, long value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            long result = EditorGUILayout.LongField(value);
            EditorGUILayout.EndHorizontal();
            return result;
        }
        public static long ULongField(string name, long value)
        {
            value = LongField(name, value);
            value = value < 0 ? 0 : value;
            return value;
        }
        public static int UIntField(string name, int value)
        {
       /*     value = value < 0 ? 0 : value;*/
            value = IntField(name, value);
            value = value < 0 ? 0 : value;
            return value;
        }

        public static string TextField(string name, string value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            string result = EditorGUILayout.TextField(value);
            EditorGUILayout.EndHorizontal();
            return result;
        }
        public static float FloatField(string name, float value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            float result = EditorGUILayout.FloatField(value);
            EditorGUILayout.EndHorizontal();
            return result;
        }
        public static float UFloatField(string name, float value)
        {
            value = Utils.FloatField(name,value);
            value = value < 0 ? 0 : value;
            return value;
        }

        public static Vector3 Vector3Field(string name, Vector3 value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            Vector3 result = EditorGUILayout.Vector3Field("",value);
            EditorGUILayout.EndHorizontal();
            return result;
        }
       
        public static bool Toggle(string name, bool value)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            bool result = EditorGUILayout.Toggle(value);
            EditorGUILayout.EndHorizontal();
            return result;
        }
        public static Vector2 Vector2Field(string name, Vector2 vector) {

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);
            vector = EditorGUILayout.Vector2Field("", vector);
            EditorGUILayout.EndHorizontal();
            return vector;
        }

           
        public static UnityEngine.Object ObjectField(string name, UnityEngine.Object obj, Type objType, bool allowSceneObjects)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(name);

            UnityEngine.Object result = EditorGUILayout.ObjectField(obj != null?obj.name:"", obj, objType, allowSceneObjects);
            EditorGUILayout.EndHorizontal();
            return result;
        }




        public static void CreateAsset<T>() where T : ScriptableObject
        { 
            T asset = ScriptableObject.CreateInstance<T>();
            string path = AssetDatabase.GetAssetPath(Selection.activeObject);
            if(string.IsNullOrEmpty(path ) )
            {
                Debug.LogError("Not select files, select files first! ");
                return;
            }
            else if (!string.IsNullOrEmpty(Path.GetExtension(path)))
            {
                    path = path.Replace(Path.GetFileName(AssetDatabase.GetAssetPath(Selection.activeObject)), "");
            }
            string assetPathAndName = AssetDatabase.GenerateUniqueAssetPath(path + "/New" + typeof(T).ToString() + ".asset");
            AssetDatabase.CreateAsset(asset, assetPathAndName);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            EditorUtility.FocusProjectWindow();
            Selection.activeObject = asset;
        }

        public static GameObject LoadAsset(string path)
        {
            path = "Assets/ResourcesAsset/" + path + ".prefab";
            GameObject gameObject = AssetDatabase.LoadAssetAtPath(path, typeof(GameObject)) as GameObject;
            return gameObject;
        }

        public static GameObject CreateEffect(string path)
        {
            //配置路径
            path = "Assets/ResourcesAsset/" + path + ".asset";
            /*            var effectSet = AssetDatabase.LoadAssetAtPath<EffectSet>(path);

                        if (effectSet == null)
                        {
                            Debug.LogError(string.Format("CreateEffect EffectSet path Error {0} ", path));
                        }

                        GameObject gameObject = (GameObject)GameObject.Instantiate(effectSet.prefab);
                        EffectControll ctrl = gameObject.GetComponent<EffectControll>();
                        if (ctrl)
                        {
                            //GameObject.Destroy(ctrl); //删除组件
                        }
                        gameObject.AddComponent<AnimationPlay>();
                        return gameObject;*/

            //TODOxlua 特效创建临时屏蔽
            return null;
        }

        public static GameObject CreateGameObject(string path)
        {
            GameObject prefab = LoadAsset(path);
            if (prefab == null) {
                Debug.LogError(string.Format("CreateGameObject Error {0} ", path));
                prefab = new GameObject(path);
            }
            GameObject gameObject = (GameObject)GameObject.Instantiate(prefab);
            //TODOxlua 特效创建临时屏蔽
/*            EffectControll ctrl = gameObject.GetComponent<EffectControll>();
            if (ctrl)
            {
                //GameObject.Destroy(ctrl); //删除组件
            }
            gameObject.AddComponent<AnimationPlay>();*/
            return gameObject;
        }
        public static bool Button(string name, params GUILayoutOption[] options) {
            return GUILayout.Button(name, LGUISkin.Skin.button, options);
        }
        //带点击事件和边框的Label
       public static bool EventLabel(string name,bool focused, params GUILayoutOption[] options)
        {
            GUIStyle style;
            if (focused){
                style = LGUISkin.Skin.GetStyle("FocusedEventLabel");
            }
            else{
                style = LGUISkin.Skin.GetStyle("NormalEventLabel");
            }
            return GUILayout.Button(name, style, options);
        }
        //
        public static void Box(string name, params GUILayoutOption[] options)
        {
            GUIStyle style = LGUISkin.Skin.GetStyle("NormalEventLabel");
            GUILayout.Label(name, style, options);
        }

        //指定按鈕文字顔色的按鈕
        public static bool Button(string name, Color textColor, params GUILayoutOption[] options)
        {
            GUIStyle style   = LGUISkin.Skin.button;
            Color _textColor = style.normal.textColor;
            style.normal.textColor  = textColor;
            style.active.textColor  = textColor;
            style.focused.textColor = textColor;
            style.hover.textColor   = textColor;
            bool ret = GUILayout.Button(name, style, options);
            style.normal.textColor  = _textColor;
            style.active.textColor  = _textColor;
            style.focused.textColor = _textColor;
            style.hover.textColor   = _textColor;
            return ret;
        }
        public static int Toolbar<T>(int selected,List<T> list) where T:IToolBar {
            string[] options = new string[list.Count];
            for (int i = 0; i < list.Count; i++){
                options[i] = list[i].EntryName();
            }
            return GUILayout.Toolbar(selected, options);
        }
        /*        public static void BeginVertical2(params GUILayoutOption[] options) {
                    EditorGUILayout.BeginVertical(LGUISkin.Style2, options);
                }*/
        //获取完整的路径
        public static string GetTransPath(Transform trans)
        {
            if (!trans.parent)
            {
                return trans.name;

            }
            return GetTransPath(trans.parent) + "/" + trans.name;
        }

        //获取shader组件类型
        public static ShaderType GetShadeType(GameObject gameObject) {
            if (gameObject != null)
            {
/*                if (gameObject.GetComponent<WallFlow>() != null)
                {
                    return ShaderType.WallFlow;
                }
                else if (gameObject.GetComponent<Door>() != null)
                {
                    return ShaderType.Door;
                }*/
                //TODO xlua 
            }
            return ShaderType.Unkonw;
        }




    }






}