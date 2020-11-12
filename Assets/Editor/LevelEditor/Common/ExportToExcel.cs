using UnityEngine;
using Excel;
using System.Data;
using System.IO;
using System.Collections.Generic;
using OfficeOpenXml;
using hjcd.level;
using hjcd.level.CheckPoint;
namespace hjcd.level.CheckPoint
{
    public class ExportToExcel
    {

        public class RowData
        {
            public static string[] TagDes   = { "编号",  "唯一ID" , "怪物ID" ,     "关卡脚本ID" };
            public static string[] TagNames = { "id",  "uid" , "monster_id" , "script_id", };
            public static string[] Types    = { "int", "long" , "int",         "int"};

            public long id;
            public long uid;
            public long monster_id;
            public long script_id;

        }


        public static void WriteExcel(List<RowData> datas,long scriptID = 0)
        {
            string sheetName = "data";
            string excelName = "MonsterTag.xlsx";
            Dictionary<long, RowData> rowDatas = new Dictionary<long, RowData>();
            //自定义excel的路径
            string path = Application.dataPath + "/Editor/LevelEditor/_project/" + excelName;
            FileInfo newFile = new FileInfo(path);

            if (newFile.Exists)
            {
                //加载旧数据
                if (scriptID > 0)
                {
                    using (ExcelPackage package = new ExcelPackage(newFile))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[1];
                        //Debug.Log("worksheet.Cells  Rows:" + worksheet.Cells.Rows + " Columns:" + +worksheet.Cells.Columns);
                        int rowIndex = 6;
                        while (true)
                        {
                            object value1 = worksheet.Cells[rowIndex, 1].Value;
                            object value2 = worksheet.Cells[rowIndex, 2].Value;
                            object value3 = worksheet.Cells[rowIndex, 3].Value;
                            object value4 = worksheet.Cells[rowIndex, 4].Value;
                            if (value1 == null) break;

                            RowData rowData = new RowData();
                            rowData.id = long.Parse(value1.ToString());
                            rowData.uid = long.Parse(value2.ToString());
                            rowData.monster_id = long.Parse(value3.ToString());
                            rowData.script_id = long.Parse(value4.ToString());

                            if (rowData.script_id != scriptID)
                            { //过滤掉当前关卡的旧数据
                                rowDatas.Add(rowData.uid, rowData);
                            }
                            rowIndex++;
                        }

                    }
                }


                //创建一个新的excel文件
                newFile.Delete();
                newFile = new FileInfo(path);
            }

            //添加关卡新数据
            foreach (var item in datas)
            {
                rowDatas[item.uid] = item;

                //rowDatas.Add(item.id, item);
            }

            //通过ExcelPackage打开文件
            using (ExcelPackage package = new ExcelPackage(newFile))
            {
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add(sheetName);
                //第一行
                for (int i = 0; i < RowData.TagDes.Length; i++)
                {
                    worksheet.Cells[1, i + 1].Value = RowData.TagDes[i];
                }
                //第二行
                for (int i = 0; i < RowData.TagNames.Length; i++)
                {
                    worksheet.Cells[2, i + 1].Value = RowData.TagNames[i];
                }
                //第三行
                for (int i = 0; i < RowData.Types.Length; i++)
                {
                    worksheet.Cells[3, i + 1].Value = RowData.Types[i];
                }
                //四行

                //五行
                int rowIndex = 6;
               

                List<RowData> tempDatas = new List<RowData>();

                foreach (var rowData in rowDatas)    
                {
                    tempDatas.Add(rowData.Value);
                }
                tempDatas.Sort((a, b) => {
                    if (a.script_id == b.script_id)
                    {
                        return a.uid.CompareTo(b.uid);
                    }
                    else
                    {
                        return a.script_id.CompareTo(b.script_id);
                    }
                });

                foreach (var rowData in tempDatas)
                {
                    worksheet.Cells[rowIndex, 1].Value = rowIndex-5;
                    worksheet.Cells[rowIndex, 2].Value = rowData.uid.ToString();
                    worksheet.Cells[rowIndex, 3].Value = rowData.monster_id.ToString();
                    worksheet.Cells[rowIndex, 4].Value = rowData.script_id;
                    rowIndex++;
                }
                package.Save();
            }






        }

        public static void MonsterExportAll(List<Model> aIModels) {

            List<RowData> rowDatas = new List<RowData>();
            foreach (Model model in aIModels)
            {
                ObjectLevelInfo data = ObjectLevelInfo.Load_(model.id,false);
                foreach (var trigger in data.triggers)
                {
                    foreach (var node in trigger.executeNodes)
                    {
                        if (node.Type.Equals("CreateMonsters"))
                        {
                            CreateMonsters createMonsters = (CreateMonsters)node;
                            foreach (var monster in createMonsters.monsters)
                            {
                                RowData rowData = new RowData();
                                rowData.uid = long.Parse(monster.uid);
                                rowData.script_id = data.id;
                                rowData.monster_id = monster.cid;
                                rowDatas.Add(rowData);
                            }
        
                        }
                    }
                }
            }
            WriteExcel(rowDatas,0);
            Debug.Log("MonsterList 写入所有完成");

        }

        //怪物数据导出
        public static void MonsterExport(ObjectLevelInfo levelInfo)
        {

            List<RowData> rowDatas = new List<RowData>();

            foreach (var trigger in levelInfo.triggers)
            {
                foreach (var node in trigger.executeNodes)
                {
                    if (node.Type.Equals("CreateMonsters"))
                    {
                        CreateMonsters createMonsters = (CreateMonsters)node;
                        foreach (var monster in createMonsters.monsters)
                        {
                            RowData rowData = new RowData();
                            rowData.id     = 0;
                            rowData.uid        =long.Parse(monster.uid); 
                            rowData.monster_id = monster.cid;
                            rowData.script_id = levelInfo.id;
                            rowDatas.Add(rowData);

                        }
                    }
                }
            }
            WriteExcel(rowDatas, levelInfo.id);
            Debug.Log("MonsterList 写入完成");
        }
    }
}
 