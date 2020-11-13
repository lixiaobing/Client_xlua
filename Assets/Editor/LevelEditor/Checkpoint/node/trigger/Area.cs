using UnityEngine;
using UnityEditor;
using System.Text;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("进入区域")]
    public class Area : TriggerNode
    {

        //触发区域信息
        public ETransform position = new ETransform();
        public AreaType areaType = AreaType.CUBE;
        //目标选择
        public SelectTarget selectTarget = new SelectTarget();
        public Area() {

        }
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(selectTarget.ToLuaString(indent,newLine));
            //区域类型
            sb.Append(ExportUtils.KV(nameof(areaType), areaType, indent, newLine));
            sb.Append(ExportUtils.K(nameof(position), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(position.ToLuaString(indent, newLine));

            return sb.ToString();
        }


        public override void OnDraw()
        {
            base.OnDraw();
            AreaType _areaType = Utils.EnumPopup<AreaType>("触发区域",areaType);
            ChangeAreaType(_areaType);
            //目标选择可以封装成公用模块
   /*         selectTarget.OnDraw("触发对象");*/
            Utils.DrawSelectTarget("触发对象", selectTarget);
            string name = gameObject != null ? gameObject.name : "";
            Utils.LabelField("物体名称", name);
            position.DrawArea(gameObject,true);
        }
        public void ChangeAreaType(AreaType areaType)
        {
            if (this.areaType != areaType)
            {
                if (gameObject != null) {
                    Object.DestroyImmediate(gameObject);
                    gameObject = null;
                }
                this.areaType = areaType;
            }
            if (gameObject == null) {
                if (areaType == AreaType.CUBE)
                {
                    GameObject parent = null;
                    if (this.Parent != null)
                    {
                        parent = this.Parent.GetGameObject();
                    }
                    else
                    {
                        parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.AREA_PARENT_NAME);
                    }



                    gameObject = GameObject.CreatePrimitive(PrimitiveType.Cube);
                    gameObject.transform.SetParent(parent.transform);


                    gameObject.name = "cube_"+this.id.Substring(0, 8);//前8位ID
                    gameObject.transform.position = position.position;
                    gameObject.transform.localScale = position.scale;
                    gameObject.transform.eulerAngles = position.rotation;
                    BoxCollider boxCollider = gameObject.GetComponent<BoxCollider>();
                    if (boxCollider != null)
                    {
                        boxCollider.enabled = false;
                    }
                }
                else if (areaType == AreaType.SPHERE)
                {
                    GameObject parent = null;
                    if (this.Parent != null)
                    {
                        parent = this.Parent.GetGameObject();
                    }
                    else
                    {
                        parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.AREA_PARENT_NAME);
                    }


                    gameObject = GameObject.CreatePrimitive(PrimitiveType.Sphere);
                    gameObject.transform.SetParent(parent.transform);
                    gameObject.name = "sphere_"+this.id.Substring(0, 8);//前8位ID
                    gameObject.transform.position = position.position;
                    gameObject.transform.localScale = position.scale;
                    gameObject.transform.eulerAngles = position.rotation;

                    SphereCollider sphereCollider = gameObject.GetComponent<SphereCollider>();
                    if (sphereCollider != null)
                    {
                        sphereCollider.enabled = false;
                    }
                }
                gameObject.GetComponent<MeshRenderer>().enabled = false;
  


            }
        }
        public override void CreateObject()
        {
            base.CreateObject();
            ChangeAreaType(this.areaType);
    
        }

        protected override void OnChange(Transform transform)
        {
            this.position.position = this.gameObject.transform.position;
            this.position.scale    = this.gameObject.transform.localScale;
            this.position.rotation = this.gameObject.transform.eulerAngles;
            if (areaType == AreaType.CUBE)
            {
                BoxCollider collider = gameObject.transform.GetComponent<BoxCollider>();
                if (collider != null)
                {
                    this.position.size = collider.size;
                }
            }
            else if (areaType == AreaType.SPHERE) {
                SphereCollider collider = gameObject.transform.GetComponent<SphereCollider>();

                if (collider != null)
                {
                    this.position.size = new Vector3(collider.radius, collider.radius, collider.radius);
                }
            }
        }
    }
}
