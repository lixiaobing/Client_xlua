#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;
using System;
using hjcd.level.BehaviorTree;

namespace hjcd.level
{


    static class EnumExport
    {

        [MenuItem("Tools/Level/EnumExport")]
        public static void Export() {
            string content = ToLuaString();
            string name    = "LevelDefine";
            string savePath = EditorUtility.SaveFilePanelInProject("保存文件", name, "lua", "请填写文件名");
            if (Utils.IsVaildPath(savePath))
            {
                System.IO.File.WriteAllText(savePath, content);
                Utils.Log("导出成功:", savePath);
            }
        }

        public static string ToLuaString()
        {
            int indent = 0;
            StringBuilder sb = new StringBuilder();
            //导出信息
            string exportNotes = "export time:" + DateTime.Now.ToString();
            ExportUtils.AddNote(sb, exportNotes, 0,false);
            sb.Append(ExportUtils.NewLine);
            sb.Append(ExportUtils.Return);
            sb.Append(ExportUtils.F_CurlyBracesLeft(indent, true));
            sb.Append(ExportUtils.K(nameof(NodeType), indent + 1, true));
            sb.Append(ExportUtils.EqualSign);
            sb.Append(ExportUtils.CurlyBracesLeft);
          
            //节点类型
            foreach (Type t in NodeType.actions)
            {
                ExportUtils.AddNote(sb, Utils.GetDescription(t), indent + 2, true); //添加注释
                sb.Append(ExportUtils.KV(t.Name, t.Name, indent + 2, true));
            }
            foreach (Type t in NodeType.conditionals)
            {
                ExportUtils.AddNote(sb, Utils.GetDescription(t), indent + 2, true); //添加注释
                sb.Append(ExportUtils.KV(t.Name, t.Name, indent + 2, true));
            }
            foreach (Type t in NodeType.composites)
            {
                ExportUtils.AddNote(sb, Utils.GetDescription(t), indent + 2, true); //添加注释
                sb.Append(ExportUtils.KV(t.Name, t.Name, indent + 2, true));
            }
            foreach (Type t in NodeType.decorators)
            {
                ExportUtils.AddNote(sb, Utils.GetDescription(t), indent + 2, true); //添加注释
                sb.Append(ExportUtils.KV(t.Name, t.Name, indent + 2, true));
            }
            sb.Append(ExportUtils.F_CurlyBracesRight(indent+1, true));
            sb.Append(ExportUtils.Comma);
            //各种枚举

            sb.Append(ExportUtils.KV_ENUM<RelationalOperator>(indent + 1, true));


            sb.Append(ExportUtils.KV_ENUM<ArithmeticOperator>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<SimpleArithmeticOperator>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<TargetOperator>(indent + 1, true));
            //角色状态
            sb.Append(ExportUtils.KV_ENUM<RoleState>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<Attr>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<AttrPercent>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<LogicalOperator>(indent + 1, true));
            //寻敌类型(触发器用)
            sb.Append(ExportUtils.KV_ENUM<SelectTargetType>(indent + 1, true));
            //行为树用
            sb.Append(ExportUtils.KV_ENUM<SelectTargetType2>(indent + 1, true));

            //关卡分组类型
            sb.Append(ExportUtils.KV_ENUM<LevelGroupType>(indent + 1, true));

            //触发器执行类型
            sb.Append(ExportUtils.KV_ENUM<TriggerExecutType>(indent + 1, true));

            //战斗结果
            sb.Append(ExportUtils.KV_ENUM<BattleResultType>(indent + 1, true));

            //触发区域类型
            sb.Append(ExportUtils.KV_ENUM<AreaType>(indent + 1, true));
            //单位攻击类型
            sb.Append(ExportUtils.KV_ENUM<AttackType>(indent + 1, true));
            //开关类型
            sb.Append(ExportUtils.KV_ENUM<SwitchType>(indent + 1, true));

            //摄像机类型
            sb.Append(ExportUtils.KV_ENUM<CameraMode>(indent + 1, true));

            //移動朝向
            sb.Append(ExportUtils.KV_ENUM<Dir>(indent + 1, true));
            //阵营
            sb.Append(ExportUtils.KV_ENUM<Camp>(indent + 1, true));
            //目标状态 
            sb.Append(ExportUtils.KV_ENUM<TargetState>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<MoveType>(indent + 1, true));

            sb.Append(ExportUtils.KV_ENUM<RoleFightState>(indent + 1, true));

            sb.Append(ExportUtils.KV_ENUM<TaskStatus>(indent + 1, true));

            sb.Append(ExportUtils.KV_ENUM<ShaderType>(indent + 1, true));

            sb.Append(ExportUtils.KV_ENUM<AudioType>(indent + 1, true));
            sb.Append(ExportUtils.KV_ENUM<VariableChangeType>(indent + 1, true));
            sb.Append(ExportUtils.F_CurlyBracesRight(indent, true));

            return sb.ToString();
        }
       
    }
}
#endif