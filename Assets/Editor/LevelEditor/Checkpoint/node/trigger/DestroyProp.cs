using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{

    public class PropModel : IExport
    {
        public int cid;
        public int num;
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(num), num, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
        public void OnDraw(DestroyProp destoryProp)
        {
            EditorGUILayout.BeginVertical(LGUISkin.Style2);
            cid = Utils.IntField("cid", cid);
            num = Utils.IntField("数量", num);
            if (Utils.Button("删除"))
            {
                destoryProp.PreRemove(this);
            }
            EditorGUILayout.EndVertical();
        }
    }

    [EnumDescription("击毁障碍物")]
    public class DestroyProp : TriggerNode {

        public List<PropModel> props = new List<PropModel>();
        private PropModel preRemoveObject;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV_LIST<PropModel>(nameof(props), props, indent, newLine));
            return sb.ToString();
        }



        public override void OnDraw()
        {
            base.OnDraw();

            if (Utils.Button("新增")) {
                props.Add(new PropModel());
            }

            for (int i = 0; i < props.Count; i++)
            {
                props[i].OnDraw(this);
            }
            this.DoRemove();
        }
        public void PreRemove(PropModel model) 
        {
                this.preRemoveObject = model;
        }
        private void DoRemove()
        {
            if (this.preRemoveObject!= null) {
                this.props.Remove(this.preRemoveObject);
            }
        }
    }
}