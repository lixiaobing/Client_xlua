using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{

    public class ConsoleModel : IExport
    {
        public int cid;
        public int num;
        public RelationalOperator relationalOperator = RelationalOperator.EQUAL;
        public string ToLuaString(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(ExportUtils.F_CurlyBracesLeft(0, false));
            indent = indent + 1;
            sb.Append(ExportUtils.KV(nameof(cid), cid, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(num), num, indent, newLine));
            sb.Append(ExportUtils.KV(nameof(relationalOperator), relationalOperator, indent, newLine));
            indent = indent - 1;
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, newLine));
            return sb.ToString();
        }
        public void OnDraw(ConsoleCount consoleCount)
        {
            EditorGUILayout.BeginVertical(Utils.Style2);
            cid = Utils.IntField("cid", cid);
            num = Utils.IntField("数量", num);
            relationalOperator = Utils.EnumPopup<RelationalOperator>("关系", relationalOperator);
            if (Utils.Button("删除"))
            {
                consoleCount.PreRemove(this);
            }
            EditorGUILayout.EndVertical();
        }
    }

    [EnumDescription("操作台数量")]
    public class ConsoleCount : TriggerNode {

        public List<ConsoleModel> consoles = new List<ConsoleModel>();
        private ConsoleModel preRemoveObject;
        public override string ToStringEx(int indent, bool newLine)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ExportUtils.KV_LIST<ConsoleModel>(nameof(consoles), consoles, indent, newLine));
            return sb.ToString();
        }



        public override void OnDraw()
        {
            base.OnDraw();

            if (Utils.Button("新增")) {
                consoles.Add(new ConsoleModel());
            }

            for (int i = 0; i < consoles.Count; i++)
            {
                consoles[i].OnDraw(this);
            }
            this.DoRemove();
        }
        public void PreRemove(ConsoleModel consoleModel) 
        {
                this.preRemoveObject = consoleModel;
        }
        private void DoRemove()
        {
            if (this.preRemoveObject!= null) {
                    this.consoles.Remove(this.preRemoveObject);
            }
        }
    }
}