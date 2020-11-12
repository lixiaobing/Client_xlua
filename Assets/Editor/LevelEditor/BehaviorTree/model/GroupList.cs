using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{

    //[System.Serializable]
    [CreateAssetMenu]
    public class GroupList : ScriptableObject
    {
        public int globalGroupId = 1;     //分组ID
        public int globalBehaviorTreeId = 1000001; //行为树ID

        public List<Group> groups     = new List<Group>();
        public List<AIModel> aIModels = new List<AIModel>();

        public int NextGlobalGroupID() {
            return globalGroupId++;
        }
        public int NextGlobalBehaviorTreeID()
        {
            return globalBehaviorTreeId++;
        }
        //把不存在的分组 放到未分组
        public void Check() {

            foreach (AIModel model in aIModels)
            {
                bool flag = false;
                foreach (Group group in groups)
                {
                    if (model.groupId == group.id) {

                        flag = true;
                    }
                }
                if (!flag) {
                    model.groupId = 0;
                }
            }
       
        }

        public void AddGroup(Group group)
        {
            groups.Add(group);
            this.SaveAssets();
        }

        public void RemoveGroup(Group group)
        {
            groups.Remove(group);
            this.Check();

            this.SaveAssets();
        }


        public void AddAIModel(AIModel model)
        {
            aIModels.Add(model);

            this.SaveAssets();
        }

        public void RemoveAIModel(AIModel model)
        {
            aIModels.Remove(model);
            this.SaveAssets();
        }

        public void SaveAssets()
        {
            EditorUtility.SetDirty(this);
            AssetDatabase.SaveAssets();
        }
    }
}