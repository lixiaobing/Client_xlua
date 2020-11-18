using System;
using System.Reflection;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
namespace hjcd.level.BehaviorTree
{

    public class Tasks : View
    {
        bool actionsFoldout = true;
        bool compositesFoldout = true;
        bool conditionalsFoldout = true;
        bool decoratorsFoldout = true;
        Vector2 scrollPosition;
        public override void OnDraw()
        {

            scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);
            EditorGUILayout.BeginVertical(LGUISkin.Style1);
            actionsFoldout = EditorGUILayout.Foldout(actionsFoldout, "Action");
            if (actionsFoldout)
            {
                EditorGUILayout.LabelField("战斗事件");
                foreach (Type e in NodeType.actions_1)
                {
                    if (Utils.Button(level.Utils.GetDescription(e)))
                    {
                        OnClick(e);
                    }
                }
                EditorGUILayout.LabelField("非战斗事件");
                foreach (Type e in NodeType.actions_2)
                {
                    if (Utils.Button(level.Utils.GetDescription(e)))
                    {
                        OnClick(e);
                    }
                }
                EditorGUILayout.LabelField("通用事件");
                foreach (Type e in NodeType.actions_3)
                {
                    if (Utils.Button(level.Utils.GetDescription(e)))
                    {
                        OnClick(e);
                    }
                }


            }

            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(LGUISkin.Style1);

            compositesFoldout = EditorGUILayout.Foldout(compositesFoldout, "Composites");
            if (compositesFoldout)
            {
                foreach (Type e in NodeType.composites)
                {
                    if (Utils.Button(level.Utils.GetDescription(e)))
                    {
                        OnClick(e);
                    }
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(LGUISkin.Style1);
            conditionalsFoldout = EditorGUILayout.Foldout(conditionalsFoldout, "Conditionals");
            if (conditionalsFoldout)
            {
                foreach (Type e in NodeType.conditionals)
                {
                    if (Utils.Button(level.Utils.GetDescription(e)))
                    {
                        OnClick(e);
                    }
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(LGUISkin.Style1);
            decoratorsFoldout = EditorGUILayout.Foldout(decoratorsFoldout, "Decorators");
            if (decoratorsFoldout)
            {
                foreach (Type e in NodeType.decorators)
                {
                    if (Utils.Button(level.Utils.GetDescription(e)))
                    {
                        OnClick(e);
                    }
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.EndScrollView();
        }
        public void OnClick(Type type)
        {
            if (BehaviorTree.Instance.IsActive())
            {
                Node node = Utils.CreateInstance<Node>(type.FullName);
                if (node == null) {

                    level.Utils.Log("创建失败", type.Name);
                    return;
                }
                BehaviorTree.Instance.AddNode(node);
            }
        }




    }
}