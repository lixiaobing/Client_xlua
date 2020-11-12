using System.Text;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("改变摄像机")]
    public class FixCamera : ExecuteNode
    {
        public ETransform position = new ETransform();
        public CameraMode cameraMode = CameraMode.NORMAL;
        public float topHeight  = 10; //顶部高度
        public float sideLength = 10; //侧面距离
        public Vector3 sideForward = Vector3.forward;//侧面朝向向量
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(topHeight), topHeight, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(cameraMode), cameraMode, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(sideLength), sideLength, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(sideForward), sideForward, indent, newLine));
            return sb.ToString();
        }
        public override void OnDraw()
        {
            base.OnDraw();
            delayTime = Utils.FloatField("延迟时间", delayTime);
            cameraMode = Utils.EnumPopup<CameraMode>("相机模式", cameraMode);
            if (cameraMode == CameraMode.TOP) {
                topHeight = Utils.UFloatField("高度", topHeight);
            }
            else if (cameraMode == CameraMode.SIDE) 
            {
                sideLength = Utils.UFloatField("距离", sideLength);
                sideForward = Utils.Vector3Field("朝向", sideForward);
            }



            /*          this.CreateObject();
                        Utils.LabelField("相机名称", gameObject.name);
                        if (Utils.Button("选中")) {
                            this.DoFocus();
                        }
                        position.OnDraw(gameObject, null, false);*/

        }
/*        public override void CreateObject()
        {
            if (gameObject == null)
            {
                gameObject = Camera.main.transform.gameObject;
            }
        }

        //避免摄像机被销毁
        public override void Destory()
        {
        }*/
    }
}