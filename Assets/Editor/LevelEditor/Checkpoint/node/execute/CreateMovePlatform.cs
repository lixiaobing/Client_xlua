using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    [EnumDescription("创建移动平台")]
    public class CreateMovePlatform : ExecuteNode
    {


        public class MovePlatform_Point : EObject, IExport
        {
            //停留时间
            public float stayTime;
            public float moveSpeed;
            protected override void OnChange(Transform transform)
            {
                this.position.position = transform.position;
                this.position.rotation = transform.eulerAngles;
                this.position.scale = transform.localScale;
            }
            public string ToLuaString(int indent, bool newLine)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
                indent += 1;
                sb.Append(ExportUtils.KV(nameof(uid), uid, indent, newLine));
                indent = indent - 1;
                sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
                return sb.ToString();
            }



            public MovePlatform_Point Clone() {
                MovePlatform_Point p = new MovePlatform_Point();
                p.position = this.position.Clone();
                p.stayTime = this.stayTime;
                p.moveSpeed = this.moveSpeed;
                return p;
            
            }


            public override void CreateObject()
            {
                base.CreateObject();
                if (gameObject == null)
                {
                   

                    GameObject parent;
                    if (this.Parent != null)
                    {
                        parent = this.Parent.GetGameObject();
                    }
                    else
                    {
                        parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.PLATFORM_PARENT_NAME);
                    }
                    gameObject = GameObjectUtils.CreateSphere();

                    gameObject.transform.SetParent(parent.transform);
                    gameObject.name = this.Name;
                    gameObject.transform.position = position.position;
                    gameObject.transform.localScale = position.scale;
                    gameObject.transform.eulerAngles = position.rotation;

                }
            }
        }
        //
        public int cid = 1;
        //位置
        public ETransform position = new ETransform();
        //移动次数
        public int moveTimes;

        //恢复时间 秒
        public float recoveryTime = 0;
        //移动完成是否删除
        public bool moveCompleteDelete = false;
        //移动类型
        public PlatformMoveType moveType = PlatformMoveType.Fixed;
        //移动路径

        public List<MovePlatform_Point> points = new List<MovePlatform_Point>();
        public override void NewUUID()
        {
            base.NewUUID();
        }
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV(nameof(delayTime), delayTime, indent, newLine));
            sb.Append(ExportUtils.KV_LIST(nameof(points), points, indent, newLine));
            return sb.ToString();
        }

        public void AddPoint() {
            MovePlatform_Point p = new MovePlatform_Point();

            p.Name = p.GetDefaultName();//"特效" + effect.uid.Substring(0, 8);
            p.Parent = this.Parent;
            p.CreateObject();
            Node.SetActiveGameObject(p.gameObject);
            points.Add(p);
        }


        Vector2 scrollPosition;
        public override void OnDraw()
        {
            base.OnDraw();
            this.delayTime = Utils.FloatField("延迟时间(毫秒)", this.delayTime);


            DrawPlatformList();
            this.moveTimes          = Utils.UIntField("移动次数", this.moveTimes);
            this.moveCompleteDelete = Utils.Toggle("移动完成是否删除", this.moveCompleteDelete);
            this.recoveryTime       = Utils.UFloatField("恢复时间(秒)", this.recoveryTime);
            this.moveType           = Utils.EnumPopup("移动类型",this.moveType);

            //位置
            EditorGUILayout.BeginHorizontal(Utils.Style1);
            position.DrawPlatform(this.gameObject);
            EditorGUILayout.EndHorizontal();
            if (Utils.Button("新增路径点")) {
                this.AddPoint();
            }
            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

            for (int i = points.Count -1; i > -1; i--)
            {
                var p = points[i];
                EditorGUILayout.BeginVertical(Utils.Style2);
                Utils.LabelField(string.Format("第{0}个移动坐标",i+1),"");
                EditorGUILayout.BeginHorizontal();
                if (Utils.Button("复制"))
                {
                    this.Copy(p);
                }
                if (Utils.Button("删除"))
                {
                    points.RemoveAt(i);
                    p.Destroy();
                }
                EditorGUILayout.EndHorizontal();
                p.position.DrawPlatformPoint(p.gameObject);
                p.stayTime = Utils.UFloatField("停留时间(秒)", p.stayTime);
                p.moveSpeed = Utils.UFloatField("移动速度", p.moveSpeed);
                EditorGUILayout.EndVertical();
                // effect.OnDraw(this);
            }
            EditorGUILayout.EndScrollView();

            this.CreateObject();



            OnUpdate(Time.deltaTime);
        }
        public override void OnUpdate(float deltaTime)
        {
            base.OnUpdate(deltaTime);
            if (this.gameObject!= null)
            {
                var lineRenderer = gameObject.GetComponent<LineRenderer>();
                if (lineRenderer)
                {

                    lineRenderer.positionCount = this.points.Count;//设置顶点数   
                    for (int i = 0; i < this.points.Count; i++)
                    {
                        lineRenderer.SetPosition(i, this.points[i].position.position);
                    }
                }
            }


        }

        public MovePlatform_Point Copy(MovePlatform_Point p) {
            MovePlatform_Point _p = p.Clone();
            _p.Parent = p.Parent;
            _p.CreateObject();
            this.points.Add(_p);
            return _p;
        }

        public void DrawPlatformList()
        {

            Hashtable paltforms = LuaUtils.GetPlatforms();
            string[] options = new string[paltforms.Keys.Count];
            int[] values = new int[paltforms.Keys.Count];
            int index = 0;



            foreach (var key in paltforms.Keys)
            {
                values[index] = int.Parse(key.ToString());
                index++;
            }

            Array.Sort(values, (int a, int b) => { return a.CompareTo(b); });

            for (int i = 0; i < values.Length; i++)
            {
                options[i] = paltforms[values[i].ToString()].ToString();
            }

            //默认一个怪
            if (cid == 0)
            {
                cid = values[0];
            }
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("平台CID");
            int _cid = EditorGUILayout.IntPopup("", (int)cid, options, values);
            EditorGUILayout.EndHorizontal();
            //long _cid = EditorGUILayout.LongField("怪物CID", this.cid);
            if (this.cid != _cid)
            {
                this.cid = _cid;
                this.Destroy();
            }
            //Utils.Log("cid:" + cid);
        }

        public override void CreateObject()
        {
            base.CreateObject();

            if(gameObject == null)
            {
                string path = LuaUtils.GetPlatform((int)this.cid);
                if (path == null)
                {

                    name = this.id.ToString();
                    path = ObjectLevelInfo.BORN_PREFAB_NAME;
                }

                GameObject parent;
                if (this.Parent != null)
                {
                    parent = this.Parent.GetGameObject();
                }
                else
                {
                    parent = ObjectLevelInfo.FindParent(ObjectLevelInfo.PLATFORM_PARENT_NAME);
                }
                gameObject = Utils.CreateGameObject(path);
                gameObject.transform.SetParent(parent.transform);
                gameObject.name = this.Name;
                gameObject.transform.position = position.position;
                gameObject.transform.localScale = position.scale;
                gameObject.transform.eulerAngles = position.rotation;

                var lineRenderer = gameObject.AddComponent<LineRenderer>();
                lineRenderer.startWidth = 0.1f;
                lineRenderer.endWidth   = 0.1f;
                lineRenderer.loop = true;
                lineRenderer.startColor = Color.blue;
                lineRenderer.endColor = Color.red;

            }





            foreach (var p in points)
            {
                p.Parent = this.Parent;
                p.CreateObject();
            }

        }

        public override void Destroy()
        {
            base.Destroy();
            foreach (var p in points)
            {
                p.Destroy();
            }
        }
    }
}