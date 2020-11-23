using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{

    /// <summary>
    /// AIEditor 定义
    /// </summary>
    public enum LinkType
    {
        NONE = 1,  //不能连接
        SINGLE = 2,  //单个
        MULTIPLE = 3,  //多个
    }


    [Serializable]
    public class Link : DrawObject
    {
/*        private static Color focusColor = new Color(0x64/0xFF, 0x95/0xFF, 0xED/0xFF);*/
        public string child;
        //权重
        public int weight = 10; 
        //点击区域
        private Rect[] rects     = new Rect[] { new Rect(), new Rect() , new Rect() };
        private Vector3[] points = new Vector3[] { new Vector3(), new Vector3(), new Vector3(), new Vector3() };
        public override string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            sb.Append(ExportUtils.KV(nameof(child), child, indent+1, newLine));
            sb.Append(ExportUtils.KV(nameof(weight), weight,indent+1, newLine));
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
        public override void OnDraw(Vector2 offset)
        {
            Handles.color = Focused() ? Color.green : Color.white;
            Handles.DrawPolyLine(points);
        }



     
        public override bool TryFocus(Vector2 position)
        {
            foreach (Rect rect in rects) {
                if (rect.Contains(position)) {
                    SetFocus();
                    return true;
                }
            }
            return false;
        }

        public float DoLayout(Vector2 startPostion, float offset) {
            //计算线的位置
            Node node = BehaviorTree.Instance.GetNode(child);
            Vector2 endPostion= node.GetLinkInPosition();

            if (offset < 5)
            {
                offset = (endPostion.y - startPostion.y) * 0.7f;
                offset = Mathf.Max(offset, 5);
            }

            points[0].Set(startPostion.x, startPostion.y,0);
            points[1].Set(startPostion.x, startPostion.y + offset, 0);
            points[2].Set(endPostion.x, startPostion.y + offset, 0);
            points[3].Set(endPostion.x, endPostion.y, 0);

            //生成碰撞区域
            rects[0] = GenerateRect(rects[0], points[0], points[1], true);
            rects[1] = GenerateRect(rects[1], points[1], points[2], false);
            rects[2] = GenerateRect(rects[2], points[2], points[3], true);



            return offset;
        }


        public static Rect GenerateRect(Rect rect ,Vector3 p1, Vector3 p2, bool vertical) {
            int size = 3; 
            if (vertical)
            {
                float x = p1.x - size;
                float y = p1.y < p2.y ? p1.y : p2.y;
                float w = size * 2 + 1;
                float h = Mathf.Abs(p2.y - p1.y);
                rect.Set(x,y , w, h);

            }
            else //水平
            {
                float x = p1.x < p2.x ? p1.x : p2.x;
                float y = p1.y - size;
                float w = Mathf.Abs(p1.x - p2.x);
                float h = size * 2 + 1;
                rect.Set(x, y, w, h);
            }
            return rect;
        }

        public override void RemoveSelf(bool containChild)
        {
            BehaviorTree.Instance.RemoveLink(child);
        }



        public override void OnInspectorDraw()
        {
            EditorGUILayout.Space();
            EditorGUILayout.LabelField("我只是一条连接线!");
        }
    }
}