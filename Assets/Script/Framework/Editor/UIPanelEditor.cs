using System.Collections.Generic;
using UnityEditor;
using UnityEditor.UI;
using UnityEditorInternal;
using UnityEngine;

namespace Framework
{

    [CustomEditor(typeof(UIPanel))]
    public class UIPanelEditor : Editor
    {
        UIPanel _target;

        ReorderableList nodeList;

        void OnEnable()
        {
            _target = target as UIPanel;

            SerializedProperty nodesProperty = serializedObject.FindProperty("nodes");
            nodeList = new ReorderableList(_target.nodes, typeof(string));

            nodeList.drawElementCallback = (Rect rect, int index, bool selected, bool focused) =>
            {
                rect.y += 3;

                GUI.Box(new Rect(rect.x, rect.y, rect.width, 24), "", EditorStyles.helpBox);

                UINodeInfo node = _target.nodes[index];

                string tag = EditorGUI.TextField(new Rect(rect.x+3,rect.y+3,rect.width*0.3f, EditorGUIUtility.singleLineHeight), node.tag).Trim();
                if (tag != node.tag)
                {
                    node.tag = tag;
                    EditorUtility.SetDirty(_target);
                }

                Transform transform = (Transform)EditorGUI.ObjectField(new Rect(rect.x + rect.width * 0.3f + 5, rect.y+3, rect.width * 0.35f, EditorGUIUtility.singleLineHeight), node.transform, typeof(Transform), true);
                if (transform != node.transform)
                {
                    node.transform = transform;
                    string tagName = node.tag;
                    if ((string.IsNullOrEmpty(tagName) || tagName.Equals("Node Name")) && transform != null)
                    {
                        tagName = transform.gameObject.name;
                        if (char.IsUpper(tagName[0]))
                        {
                            if (tagName.Length > 1)
                                tagName = char.ToLower(tagName[0]) + tagName.Substring(1);
                            else
                                tagName = char.ToLower(tagName[0]).ToString();
                        }
                        node.tag = tagName;
                    }
                    EditorUtility.SetDirty(_target);
                }
                if (node.transform)
                {
                    Component[] cpns = node.transform.GetComponents<Component>();

                    List<string> names = new List<string>();

                    foreach (var cpn in cpns)
                    {
                        var name = cpn.GetType().FullName;
                        if (name != "UnityEngine.CanvasRenderer")
                        {
                            names.Add(name);
                        }
                    }
                    names.Add("UnityEngine.GameObject");

                    int select = names.IndexOf(node.type);
                    int newselect = EditorGUI.Popup(new Rect(rect.x + rect.width * 0.65f + 7, rect.y + 3, rect.width * 0.35f - 10, EditorGUIUtility.singleLineHeight), select, names.ToArray());

                    if (newselect == -1)
                    {
                        newselect = 0;
                    }

                    if (newselect != select)
                    {
                        node.type = names[newselect];
                        EditorUtility.SetDirty(_target);
                    }
                }
            };
            nodeList.elementHeightCallback = (index) =>
            {
                return EditorGUIUtility.singleLineHeight+12;
            };
            nodeList.drawHeaderCallback = (Rect rect) =>
            {
                GUI.Label(rect, "UI Node List");
            };
            nodeList.onRemoveCallback = (ReorderableList list) =>
            {
                ReorderableList.defaultBehaviours.DoRemoveButton(list);
                EditorUtility.SetDirty(_target);
            };
            nodeList.onAddCallback = (ReorderableList list) =>
            {
                UINodeInfo newNode = new UINodeInfo();
                _target.nodes.Add(newNode);
                EditorUtility.SetDirty(_target);
            };
        }

        private Vector2 scrollView;
        public override void OnInspectorGUI()
        {
            scrollView = GUILayout.BeginScrollView(scrollView);

            if (GUILayout.Button("打开UIPanel窗口"))
            {
                var window = UnityEditor.EditorWindow.GetWindow(typeof(UIPanelWindow), true);

                window.BeginWindows();
            }

            //FindBack();

            EditorGUILayout.Space();

            serializedObject.Update();
            nodeList.DoLayoutList();
            serializedObject.ApplyModifiedProperties();
            GUILayout.EndScrollView();
        }

        public string strIpt = "";

        /// <summary>
        /// nodes节点名字 锁定节点Obj
        /// </summary>
        public void FindBack()
        {
            try
            {
                strIpt = GUILayout.TextField(strIpt);
                if (!string.IsNullOrEmpty(strIpt))
                {
                    foreach (var item in _target.nodes)
                    {
                        if (item.tag == strIpt && item.transform != null)
                        {
                            Selection.activeGameObject = item.transform.gameObject;
                        }
                    }
                    strIpt = "";
                }
            }
            catch
            {
                Debug.Log("又来了,但不影响");
            }

        }
    }

}