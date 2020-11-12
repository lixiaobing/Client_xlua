using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建顶点动画")]
    public class CreateVertexAnimation : ExecuteNode
    {

        public ETransform position = new ETransform();
        public string modelPath = "Effect/Common/Level_gate_001";
        public ShaderType shaderType  = ShaderType.WallFlow;
        public UVAnimaitonState state = UVAnimaitonState.Start;  //初始状态
    
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(modelPath), modelPath, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(shaderType), shaderType, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(state), state, indent, newLine));
            sb.Append(ExportUtils.K(nameof(position), indent, newLine));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(position.ToLuaString(indent, newLine));
            sb.Append(ExportUtils.Comma);
            return sb.ToString();
        }

        public override void OnDraw()
        {

            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);
            CreateObject();
            
            //Utils.TextField("ShaderType", Utils.GetDescription(this.shaderType));
            Utils.EnumPopup("ShaderType", this.shaderType);
            this.state      = Utils.EnumPopup("AnimaitonState", this.state);
            Utils.TextField("文件", this.modelPath);
     
            EditorGUILayout.BeginHorizontal();
            if (Utils.Button("贴地"))
            {
                ETransform.StickGround(this.gameObject);
            }
            if (Utils.Button("选中"))
            {
                DoFocus();
            }
            if (Utils.Button("选择文件"))
            {
                this.SelectFile();
            }
            EditorGUILayout.EndHorizontal();
 
            
            position.OnDraw(this.gameObject, null, false);

            if (this.shaderType == ShaderType.Unkonw) {
                Utils.LabelTip("错误的顶点动画类型",UnityEditor.MessageType.Warning);
            }
            this.OnUpdate(Time.deltaTime);
        }

        public void SelectFile()
        {

            string file_path = EditorUtility.OpenFilePanel("选择文件", Utils.ResourcesPath + "Effect", "prefab");
            if (string.IsNullOrEmpty(file_path))
            {
                Utils.Log("未选择文件");
            }
            else
            {
                file_path = file_path.Replace(Utils.ResourcesPath, "").Replace(".prefab", "");
                if(!file_path.Equals(this.modelPath)){
                    this.modelPath = file_path;
                    if (this.gameObject!= null) {
                        GameObject.DestroyImmediate(this.gameObject);
                        this.gameObject = null;
                    }
                    CreateObject();
                }
            }

        }

        public override void OnUpdate(float deltaTime)
        {
            if (gameObject != null)
            {
                AnimationPlay player = gameObject.GetComponent<AnimationPlay>();
                if (player != null)
                {
                    player.Simulate();
                }
            }

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
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.VA_PARENT_NAME);
                }


                this.gameObject = Utils.CreateGameObject(this.modelPath);
                this.gameObject.transform.SetParent(parent.transform);
                this.gameObject.name = "VA_" + this.id;
                this.gameObject.transform.position = position.position;
                //this.gameObject.transform.localScale = position.scale;
                this.gameObject.transform.eulerAngles = position.rotation;
                //主要方便用于贴地
                CharacterController characterController = this.gameObject.GetComponent<CharacterController>();
                if (characterController == null)
                {
                    characterController = this.gameObject.AddComponent<CharacterController>();
                    characterController.center = new Vector3(0, 0.86f, 0);
                    characterController.height = 1.58f;
                    characterController.radius = 0.5f;
                }
                this.shaderType = Utils.GetShadeType(this.gameObject);
            }
        }


        public override void Destroy()
        {
            base.Destroy();
        }
    }
}