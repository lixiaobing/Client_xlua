using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    public class ETransform : IExport
    {
        public int id;
        public string name;
        public Vector3 position = Vector3.zero;
        public Vector3 scale = Vector3.one;
        public Vector3 rotation = Vector3.zero;
        //
        public Vector3 size = Vector3.one;

        public ETransform Clone()
        {
            ETransform data = new ETransform();
            data.position = new Vector3(position.x, position.y, position.z);
            data.scale = new Vector3(scale.x, scale.y, scale.z);
            data.rotation = new Vector3(rotation.x, rotation.y, rotation.z);
            data.size = new Vector3(size.x, size.y, size.z);
            return data;
        }
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(indent, true));
            sb.Append(ExportUtils.KV(nameof(id), id, indent + 1, newLine));
            sb.Append(ExportUtils.KV(nameof(name), name, indent + 1, newLine));
            sb.Append(ExportUtils.KV(nameof(position), position, indent + 1, newLine));
            sb.Append(ExportUtils.KV(nameof(scale), scale, indent + 1, newLine));
            sb.Append(ExportUtils.KV(nameof(rotation), rotation, indent + 1, newLine));
            sb.Append(ExportUtils.KV(nameof(size), size, indent + 1, newLine));
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));

            return sb.ToString();
        }
        public virtual void OnDraw(GameObject gameObject, GUIStyle style, bool showStickGrond)
        {
            if (gameObject != null)
            {
                if (style != null)
                {
                    EditorGUILayout.BeginVertical(style);
                }
                else
                {
                    EditorGUILayout.BeginVertical();
                }


                if (showStickGrond)
                {
                    if (Utils.Button("贴地"))
                    {
                        StickGround(gameObject);
                    }
                }

                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
                gameObject.transform.position = EditorGUILayout.Vector3Field("", gameObject.transform.position);
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
                Vector3 eulerAngles = EditorGUILayout.Vector3Field("", gameObject.transform.rotation.eulerAngles);
                gameObject.transform.rotation = Quaternion.Euler(eulerAngles);
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Scale", GUILayout.MaxWidth(80));
                gameObject.transform.localScale = EditorGUILayout.Vector3Field("", gameObject.transform.localScale);
                EditorGUILayout.EndHorizontal();


                BoxCollider collider  = gameObject.transform.GetComponent<BoxCollider>();
                if (collider!= null) {

                    EditorGUILayout.BeginHorizontal();
                    EditorGUILayout.LabelField("Collider size", GUILayout.MaxWidth(80));
                    collider.size = EditorGUILayout.Vector3Field("", collider.size);
                    EditorGUILayout.EndHorizontal();
                    size = collider.size;
                }
                EditorGUILayout.EndVertical();

                position = gameObject.transform.position;
                rotation = eulerAngles;
                scale = gameObject.transform.localScale;
            }

        }
        public virtual void OnDraw(GameObject gameObject)
        {
         
            OnDraw(gameObject, Utils.Style1, true);
        }




        public static ETransform create(GameObject gameObject)
        {
            ETransform xObject = new ETransform();
            xObject.name = gameObject.name;
            xObject.id = int.Parse(gameObject.name.Split('_')[1]);
            xObject.position = gameObject.transform.position;
            xObject.scale = gameObject.transform.localScale;
            xObject.rotation = gameObject.transform.rotation.eulerAngles;
            return xObject;
        }

        public static void StickGround(GameObject gameObject)
        {
            if (gameObject != null)
            {
                CharacterController characterController = gameObject.GetComponent<CharacterController>();
                if (characterController != null)
                {
                    characterController.Move(new Vector3(0, 5, 0));
                    characterController.Move(new Vector3(0, -10, 0));
                }
                else
                {
                    Utils.Log("StickGround 贴地");
                    Vector3 position = gameObject.transform.position;
                    position.y = 0;
                    gameObject.transform.position = position;
                }
                Selection.activeGameObject = gameObject;
            }

        }
        public static ETransform CreateAirWallData()
        {
            ETransform data = new ETransform();
            data.size = new Vector3(10, 10, 0.5f);
            data.position = new Vector3(Utils.random.Next(-5, 5), 0, Utils.random.Next(-5, 5));
            return data;
        }

        public static ETransform CreateGateData()
        {
            ETransform data = new ETransform();
            data.size = new Vector3(10, 10, 0.5f);
            data.position = new Vector3(Utils.random.Next(-5, 5), 0, Utils.random.Next(-5, 5));
            return data;
        }


        public void OnDraw()
        {

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
            this.position = EditorGUILayout.Vector3Field("", this.position);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
            this.rotation = EditorGUILayout.Vector3Field("",this.rotation);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Scale", GUILayout.MaxWidth(80));
            this.scale = EditorGUILayout.Vector3Field("", this.scale);
            EditorGUILayout.EndHorizontal();
          
        }

        /// <summary>
        /// 出生点绘制
        /// </summary>
        /// <param name="gameObject"></param>
/*        public void DrawBorn(GameObject gameObject)
        {
            if (gameObject != null)
            {
       
                EditorGUILayout.BeginVertical();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
                gameObject.transform.position = EditorGUILayout.Vector3Field("", gameObject.transform.position);
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
                Vector3 eulerAngles = EditorGUILayout.Vector3Field("", gameObject.transform.rotation.eulerAngles);
                gameObject.transform.rotation = Quaternion.Euler(eulerAngles);
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.EndVertical();
                position = gameObject.transform.position;
                rotation = eulerAngles;

            }
        }*/


        public void DrawBorn(GameObject gameObject)
        {
            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
            this.position = EditorGUILayout.Vector3Field("", this.position);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
            this.rotation = EditorGUILayout.Vector3Field("", this.rotation);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndVertical();
            if (gameObject != null) {
                gameObject.transform.position = this.position;
                gameObject.transform.eulerAngles = this.rotation;
            }
        }
        public void DrawPosition(GameObject gameObject) {

            this.DrawBorn(gameObject);
        }
        
        //区域触发器/空气墙
        public void DrawArea(GameObject gameObject ,bool bStickGround = false)
        {
                EditorGUILayout.BeginVertical(Utils.Style1);
                if (gameObject != null)
                {
                    if(bStickGround){
                        if (Utils.Button("贴地"))
                        {
                            StickGround(gameObject);
                        }
                    } 
                    
                 }
                

                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
                this.position = EditorGUILayout.Vector3Field("", this.position);
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
                this.rotation = EditorGUILayout.Vector3Field("", this.rotation);
   
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Scale", GUILayout.MaxWidth(80));
                this.scale = EditorGUILayout.Vector3Field("",this.scale);
                EditorGUILayout.EndHorizontal();


                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("Collider size", GUILayout.MaxWidth(80));
                this.size = EditorGUILayout.Vector3Field("", this.size);
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.EndVertical();
            if (gameObject != null)
            {
                gameObject.transform.position    = this.position;
                gameObject.transform.eulerAngles = this.rotation;
                gameObject.transform.localScale = this.scale;

                BoxCollider collider = gameObject.transform.GetComponent<BoxCollider>();
                if (collider != null)
                {
                    collider.size = this.size;
                }
                SphereCollider _collider = gameObject.transform.GetComponent<SphereCollider>();
                if (_collider != null)
                {
                    _collider.radius = this.size.x;
                }
            }

        }



        //特效
        public void DrawEffect(GameObject gameObject)
        {
         
            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
            this.position = EditorGUILayout.Vector3Field("", this.position);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
            this.rotation = EditorGUILayout.Vector3Field("", this.rotation);

            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Scale", GUILayout.MaxWidth(80));
            this.scale = EditorGUILayout.Vector3Field("", this.scale);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndVertical();
            if (gameObject != null)
            {
                 gameObject.transform.position = position;
                 gameObject.transform.eulerAngles = rotation;
                 gameObject.transform.localScale = scale;
            }

        }
        //操作台
        public void DrawConsole(GameObject gameObject) {

            DrawEffect(gameObject);
        }
        //障碍物
        public void DrawObstacle(GameObject gameObject) {
            DrawEffect(gameObject);
        }
        public void DrawGate(GameObject gameObject) {


            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
            this.position = EditorGUILayout.Vector3Field("", this.position);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Rotation", GUILayout.MaxWidth(80));
            this.rotation = EditorGUILayout.Vector3Field("", this.rotation);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Scale", GUILayout.MaxWidth(80));
            this.scale = EditorGUILayout.Vector3Field("", this.scale);
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Collider size", GUILayout.MaxWidth(80));
            EditorGUILayout.Vector3Field("", this.size); //读取的BoxCollider的size 无法修改
            EditorGUILayout.EndHorizontal();
         
            EditorGUILayout.EndVertical();
            if (gameObject != null)
            {
                gameObject.transform.position = position;
                gameObject.transform.eulerAngles = rotation;
                gameObject.transform.localScale = scale;
            }
        }
        public void DrawMonster(GameObject gameObject)
        {

            DrawEffect(gameObject);
        }
        public void DrawGroup(GameObject gameObject)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
            this.position = EditorGUILayout.Vector3Field("", this.position);
            EditorGUILayout.EndHorizontal();


            if (gameObject != null)
            {
                gameObject.transform.position = position;
                gameObject.transform.eulerAngles = Vector3.zero;
                gameObject.transform.localScale = Vector3.one;
            }
        }

        //平台绘制
        public void DrawPlatform(GameObject gameObject)
        {
            DrawEffect(gameObject);
        }

        public void DrawPlatformPoint(GameObject gameObject)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Position", GUILayout.MaxWidth(80));
            this.position = EditorGUILayout.Vector3Field("", this.position);
            EditorGUILayout.EndHorizontal();
            if (gameObject != null)
            {
                gameObject.transform.position = position;
                gameObject.transform.eulerAngles = Vector3.zero;
                gameObject.transform.localScale = Vector3.one;
            }
        }
    }

}