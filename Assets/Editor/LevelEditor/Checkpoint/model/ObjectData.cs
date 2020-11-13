using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    public class ObjectData : IExport
    {
        public int id;
        public string name;
        public Vector3 position = Vector3.zero;
        public Vector3 scale = Vector3.one;
        public Vector3 rotation = Vector3.zero;
        //
        public Vector3 size = Vector3.one;

        public ObjectData Clone()
        {
            ObjectData data = new ObjectData();
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
                    if (Utils.Button("ÌùµØ"))
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
         
            OnDraw(gameObject, LGUISkin.Style1, true);
        }




        public static ObjectData create(GameObject gameObject)
        {
            ObjectData xObject = new ObjectData();
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
                    Utils.Log("StickGround ÌùµØ");
                    Vector3 position = gameObject.transform.position;
                    position.y = 0;
                    gameObject.transform.position = position;
                }
                Selection.activeGameObject = gameObject;
            }

        }
        public static ObjectData CreateAirWallData()
        {
            ObjectData data = new ObjectData();
            data.size = new Vector3(10, 10, 0.5f);
            data.position = new Vector3(Utils.random.Next(-5, 5), 0, Utils.random.Next(-5, 5));
            return data;
        }

        public static ObjectData CreateGateData()
        {
            ObjectData data = new ObjectData();
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
    }

}