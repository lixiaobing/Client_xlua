using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建空气墙")]
    public class CreateAirWall : ExecuteNode
    {
        public ETransform wall = ETransform.CreateAirWallData();
        //默认特效路径
        public ETransform effect = new ETransform();
        public string effectPath = "Effect/Common/MonsterBorn";
        //特效
        private GameObject gameObjectEffect;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(effectPath), effectPath, indent, newLine));
            sb.Append(ExportUtils.K(nameof(wall), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(wall.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.Comma);
            sb.Append(ExportUtils.K(nameof(effect), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(effect.ToLuaString(indent, newLine));
            return sb.ToString();
        }

        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            CreateObject();

            EditorGUILayout.BeginHorizontal();

            if (Utils.Button("贴地"))
            {
                ETransform.StickGround(this.gameObject);
            }
            if (Utils.Button("选中"))
            {
                DoFocus();
            }
            EditorGUILayout.EndHorizontal();
            wall.DrawArea(this.gameObject);

            EditorGUILayout.InspectorTitlebar(true, gameObjectEffect);

            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("贴地"))
            {
                ETransform.StickGround(this.gameObjectEffect);
            }
            if (Utils.Button("选中"))
            {
                Node.SetActiveGameObject(this.gameObjectEffect);
            }

            if (Utils.Button("选择特效"))
            {
                string file_path = EditorUtility.OpenFilePanel("选择文件", Utils.ResourcesPath + "Effect", "asset");
                if (file_path == null || file_path.Equals(""))
                {
                    Utils.Log("未选择文件");
                }
                else
                {
                    file_path = file_path.Replace(Utils.ResourcesPath, "").Replace(".prefab", "").Replace(".asset", "");
                    CreateEffect(file_path);
                }

            }
            EditorGUILayout.EndHorizontal();
            effect.DrawEffect(this.gameObjectEffect);
        }

        public override void CreateObject()
        {

            if (this.gameObject == null)
            {
                GameObject parent = null;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.WALL_PARENT_NAME);
                }


                GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
                cube.GetComponent<MeshRenderer>().enabled = false;
                cube.GetComponent<BoxCollider>().enabled = false;
                cube.GetComponent<BoxCollider>().size = wall.size;
                cube.transform.SetParent(parent.transform);
                cube.name = "wall_" + this.id;
                cube.transform.position = wall.position;
                cube.transform.localScale = wall.scale;
                cube.transform.eulerAngles = wall.rotation;
                this.gameObject = cube;
            }

            if (gameObjectEffect == null)
            {
                CreateEffect(this.effectPath);
            }
            AddTransformListener();

        }




        public void CreateEffect(string pfefabPath)
        {
            if (!this.effectPath.Equals(pfefabPath))
            {
                if (gameObjectEffect != null)
                {
                    GameObject.DestroyImmediate(gameObjectEffect);
                    gameObjectEffect = null;
                }
                this.effectPath = pfefabPath;
            }

            if (gameObjectEffect == null)
            {

                gameObjectEffect = Utils.CreateEffect(this.effectPath);
                gameObjectEffect.transform.SetParent(this.gameObject.transform);

/*                EffectControll ctrl = gameObjectEffect.GetComponent<EffectControll>();
                if (ctrl != null)
                {
                    ctrl.Play();
                }*/
                //TODO xlua
                gameObjectEffect.transform.SetParent(this.gameObject.transform);
                gameObjectEffect.name = "effect_" + this.id.Substring(0, 8);
                gameObjectEffect.transform.position = effect.position;
                gameObjectEffect.transform.localScale = effect.scale;
                gameObjectEffect.transform.eulerAngles = effect.rotation;
                CharacterController characterController = gameObjectEffect.AddComponent<CharacterController>();
                characterController.center = new Vector3(0, 0.86f, 0);
                characterController.height = 1.58f;
                characterController.radius = 0.5f;
            }
        }

        public override void Destroy()
        {
            if (gameObjectEffect != null)
            {
                GameObject.DestroyImmediate(gameObjectEffect);
                gameObjectEffect = null;
            }
            base.Destroy();
        }

        protected override void OnTransformChange(Transform transform)
        {
            if (this.gameObject != null && this.gameObject.transform == transform)
            {
                wall.position = this.gameObject.transform.position;
                wall.scale    = this.gameObject.transform.localScale;
                wall.rotation = this.gameObject.transform.eulerAngles;
                var collider  = this.gameObject.GetComponent<BoxCollider>();
                if (collider != null) {
                    wall.size = collider.size;
                }
            }
            if (this.gameObjectEffect != null && this.gameObjectEffect.transform == transform)
            {
                effect.position = gameObjectEffect.transform.position;
                effect.scale    = gameObjectEffect.transform.localScale ;
                effect.rotation = gameObjectEffect.transform.eulerAngles;

            }
        }
    
    }

}