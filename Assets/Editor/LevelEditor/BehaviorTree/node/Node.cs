using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using hjcd.level;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using System.Xml.Serialization;
using System.Text;
using System.Reflection;

namespace hjcd.level.BehaviorTree
{
    [EnumDescription("Node")]
    [Serializable]
    public class Node : DrawObject
    {
        private static Vector2 defaultSize = new Vector2(120, 75);
        private Rect windowRect = new Rect(200, 200, 120, 75);
        private static Vector2 linkSize = new Vector2(40, 10);
        private Rect linkInRect = new Rect(0, 0, linkSize.x, linkSize.y);
        private Rect linkOutRect = new Rect(0, 0, linkSize.x, linkSize.y);

        //连接线
        public List<Link> links = new List<Link>();
        //窗体的位置
        public Vector2 windowPosition = new Vector2(200, 200);
        //策划备注
        public string mark = "";

        public static float staticScale = 1f;
        public float scale = staticScale;
        public Rect GetWinRect() {
            if (scale != staticScale) {
                windowPosition = windowPosition / scale * staticScale;
                scale = staticScale;

                windowRect.width = defaultSize.x * scale;
                windowRect.height = defaultSize.y * scale;

                this.linkInRect.width = linkSize.x * scale;
                this.linkInRect.height = linkSize.y * scale;
                this.linkOutRect.width = this.linkInRect.width;
                this.linkOutRect.height = this.linkInRect.height;

            }

            windowRect.position = windowPosition;

            return windowRect;
        }

        public void SetPosition(Vector2 position) {
            SetPosition(position, false);
        }

        public void MovePosition(Vector2 offset) {
            windowPosition += offset;
            foreach (Link link in links)
            {
                Node node = BehaviorTree.Instance.GetNode(link.child);
                node.MovePosition(offset);
            }
        }
        public void SetPosition(Vector2 position, bool calculationOffset)
        {
            if (calculationOffset) //计算子节点偏移
            {
                position -= windowPosition;
                if (position.x != 0 || position.y != 0)
                {
                    MovePosition(position);
                }

            }
            else {
                windowPosition = position;
            }
        }
        //绘制前排序
        private void SortLinks()
        {
            links.Sort((Link link1, Link link2) =>
            {
                Node n1 = BehaviorTree.Instance.GetNode(link1.child);
                Node n2 = BehaviorTree.Instance.GetNode(link2.child);
                return n1.GetLinkInPosition().y.CompareTo(n2.GetLinkInPosition().y);
            });
        }

        public virtual LinkType LinkOutType() {

            return LinkType.MULTIPLE;
        }
        public virtual LinkType LinkInType()
        {
            return LinkType.SINGLE;

        }

        public bool HaveChild(Node node) {
            foreach (Link link in links) {
                if (link.child == node.uuid) {
                    return true;
                }
                Node _node = BehaviorTree.Instance.GetNode(link.child);
                if (_node.HaveChild(node)) {
                    return true;
                }
            }
            return false;
        }
        public void DoLink(Node node) {
            if (node == this) {
                return; //不能自己连自己
            }
            //node 下的子节点不能包含自己
            if (node.HaveChild(this)) {
                return;
            }


            if (LinkOutType() == LinkType.NONE) {
                return;
            }
            BehaviorTree.Instance.RemoveLink(node.uuid);
            if (LinkOutType() == LinkType.SINGLE) {
                links.Clear();  //只支持单个
            }
            Link link = new Link(); //ScriptableObject.CreateInstance<Link>();
            link.child = node.uuid;
            links.Add(link);
        }

        public void RemoveLink(string uuid)
        {
            foreach (Link link in links) {
                if (link.child.Equals(uuid))   //   link.child == uuid 
                {
                    links.Remove(link);
                    break;
                }
            }
        }
        public GUIStyle GetStyleLabel() {
            /*            if (this.Focused()) { 

                            return LGUISkin.Skin.GetStyle("FocusedlNodeLabel");  
                        }*/
            return LGUISkin.Skin.GetStyle("NodeLabel");
        }

        public virtual Texture2D GetTexture2D() 
        {
            return LGUISkin.Textures.textureRoot;
        }
        public override void OnDraw(Vector2 offset) {
;
            GUILayout.Space(8 * scale);
            GUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            GUILayout.Box(GetTexture2D(), LGUISkin.GetStyle("Icon"), GUILayout.Width(60 * scale), GUILayout.Height(35 * scale));
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();


            GUIStyle style = this.GetStyleLabel();
            int fontSize = style.fontSize;
            style.fontSize = (int)Math.Ceiling(10 * scale);
            //GUILayout.Label("[" + this.uuid.Substring(0, 5) + "]"+ Type, style);

            GUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            GUILayout.Label(Type, style);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();

            //GUILayout.Label(Description, style);
            GUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            GUILayout.Label(mark.Length>0? mark : this.uuid.Substring(0, 5), style);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();

            style.fontSize = fontSize;
        }
        public Vector2 GetLinkInPosition() 
        {
            return GetLinkInRect().center;
        }

        public Vector2 GetLinkOutPosition()
        {
            return GetLinkOutRect().center;
        }

        public Rect GetLinkInRect()
        {
            Rect rect = GetWinRect();

            this.linkInRect.x = rect.x + rect.width / 2 - this.linkInRect.width / 2;
            this.linkInRect.y = rect.y - this.linkInRect.height + 1;
    
            return this.linkInRect;

        }
        public Rect GetLinkOutRect()
        {
            Rect rect = GetWinRect();
    
            this.linkOutRect.x = rect.x + rect.width / 2 - this.linkOutRect.width / 2;
            this.linkOutRect.y = rect.y + rect.height - 1;

            return this.linkOutRect;
        }
        public bool CanLinkIn() {
            return true;
        }
        public bool CanLinkOut()
        {
            return true;
        }

        public void DrawLinkJoin()
        {

            GUIStyle style = GetStyle();//   LGUISkin.Skin.GetStyle("Link"); //this.GetStyle();
            if (LinkInType() != LinkType.NONE)
            {
                GUI.Box(GetLinkInRect(),"", style);
            }
            if (LinkOutType() != LinkType.NONE)
            {
                GUI.Box(GetLinkOutRect(), "", style);
            }

        }


        //绘制连接线
        public void DrawLink(Vector2 offset) {
            SortLinks();
            float broke = 0;
            Vector2 starPositon = GetLinkOutPosition();
            foreach (Link link in links) {
                broke = link.DoLayout(starPositon, broke);
                link.OnDraw(offset);
            }
        }

        public override bool TryFocus(Vector2 position)
        {
            foreach (Link link in links) {
                if (link.TryFocus(position)) {
                    return true;  //线获得焦点
                }
            }
            bool result = this.GetWinRect().Contains(position);
            if (result) {
                SetFocus();
            }
            return result;
        }

        public override void RemoveSelf(bool containChild = false)
        {
            BehaviorTree.Instance.RemoveNode(this, containChild);
        }


        public override void OnInspector()
        {
            
        }

        public override void OnInspectorDraw()
        {
          
/*            EditorGUILayout.BeginVertical(GUI.skin.box,GUILayout.ExpandHeight(true));*/
            EditorGUILayout.BeginVertical();
            Utils.LabelField("UUID", uuid);
            Utils.LabelField("名称", Description);
            Utils.LabelField("类型", Type);

            OnInspector();

            mark=  Utils.TextField("备注", mark);
            //EditorGUILayout.LabelField("备注");
        //   mark = EditorGUILayout.TextArea(mark, GUILayout.MinHeight(60));
            mark = mark.Replace("\r", ""); //空行容错处理
            mark = mark.Replace("\n", "");  
            //mark = GUILayout.TextArea("AAA",GUILayout.MinHeight(60));
         

            EditorGUILayout.EndVertical();
        }

        public Node Clone(bool containChild = false)
        {
            string temp = Application.temporaryCachePath + "/" + IDFactory.GetUUID() + ".xml";
            Utils.XmlSerialize(temp, this); //序列化到临时文件
            Node obj = (Node)Utils.XmlDeserialize(temp, this.GetType());
            Utils.DeleteFile(temp);

            obj.MovePosition(new Vector2(20, 20));
            obj.uuid = IDFactory.GetUUID();
            BehaviorTree.Instance.AddNode(obj);
            if (containChild)
            {
                foreach (var link in obj.links)
                {
                    Node node = BehaviorTree.Instance.GetNode(link.child).Clone(containChild);
                    link.child = node.uuid;
                    link.uuid  = IDFactory.GetUUID();
                }
            }
            else {  
                obj.links.Clear();
            }
 
            return obj;
        }




        public virtual GUIStyle GetStyle() {
            if (this.Focused())
            {
                return LGUISkin.Skin.GetStyle("FocusedNode");
            }
            else {
     
                return LGUISkin.Skin.GetStyle("CommonNode");
            }
           
        }







        public  ScriptableObject ToScriptableObject()
        {
            System.Type type = this.GetType();
            ScriptableObject nodeConfig = ScriptableObject.CreateInstance(type.Name + "Config");
            if (nodeConfig == null)
            {
                Debug.LogError("Class " + type.Name + "Config" + " not found");
                // return null;
            }
            System.Type configType = nodeConfig.GetType();
            var Fields = configType.GetFields(BindingFlags.Public | BindingFlags.Instance);
            foreach (var field in Fields)
            {
                if (field.Name.Equals("links"))
                {
                    continue;
                }
                //Debug.Log(field.Name);
                FieldInfo f = type.GetField(field.Name);
                if (f != null)
                {
                    //Debug.LogError("Class " + type.Name + "." + field.Name);
                    field.SetValue(nodeConfig, f.GetValue(this));
                }
                else
                {
                    Debug.LogError("Class " + type.Name + "." + field.Name + " not found");
                }
            }

            FieldInfo ff = configType.GetField("links");
            if (ff != null)
            {
                List<Link> links = (List<Link>)type.GetField("links").GetValue(this);
                List<LinkConfig> linkConfigs = new List<LinkConfig>();
                foreach (var link in links)
                {
                    var linkConfig = ScriptableObject.CreateInstance<LinkConfig>();
                    linkConfig.child = link.child;
                    linkConfig.weight = link.weight;
                }
                ff.SetValue(nodeConfig, linkConfigs);
            }
            return nodeConfig;
        }
        

    }
}