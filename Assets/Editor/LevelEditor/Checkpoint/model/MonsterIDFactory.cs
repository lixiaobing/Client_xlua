using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.CheckPoint
{
    public class MonsterIDFactory : ScriptableObject
    {
        public int monsterIndex = 1;
        private static MonsterIDFactory instance;
        public static MonsterIDFactory Instance
        {
            get
            {
                if (instance == null)
                {
                    if (Utils.FileExists(CheckPointConfig.MonsterIDFactoryFile))
                    {
                        instance = Utils.AssetDeserialize<MonsterIDFactory>(CheckPointConfig.MonsterIDFactoryFile);
                    }
                    else
                    {
                        instance = ScriptableObject.CreateInstance<MonsterIDFactory>();
                        Utils.AssetSerialize(CheckPointConfig.MonsterIDFactoryFile, instance);
                    }
                }

                return instance;
            }
        }
        public long NextMonsterID() {

            return monsterIndex++;
        }
/*        public static string GenerateMonsterID(int levelID, int triggerID) 
        {
            //return string.Format("{0}{1}{2}", levelID, triggerID, Instance.NextMonsterID());
            return string.Format("{0:D5}{1}", levelID, Instance.NextMonsterID());
        }*/
        public static string GenerateMonsterID()
        {
            return "" + Instance.NextMonsterID();
        }
    }
}