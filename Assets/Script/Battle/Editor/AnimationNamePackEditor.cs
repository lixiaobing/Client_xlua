using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Battle
{
    [CustomEditor(typeof(AnimationNamePack), true)]
    public class AnimationNamePackEditor : Editor
    {
        AnimationNamePack pack;

        ReorderableList list;

        void OnEnable()
        {
            pack = target as AnimationNamePack;

            list = new ReorderableList(pack.names, typeof(string));

            list.drawElementCallback = (Rect rect, int index, bool selected, bool focused) =>
            {
                rect.y += 2;
                rect.height = EditorGUIUtility.singleLineHeight;
                pack.names[index] = EditorGUI.TextField(rect, "", pack.names[index]);
            };
            //绘制表头
            list.drawHeaderCallback = (Rect rect) =>
            {
                GUI.Label(rect, "Animation Names");
            };
            //当移除元素时回调
            list.onRemoveCallback = (ReorderableList list) =>
            {
                ReorderableList.defaultBehaviours.DoRemoveButton(list);
            };
            //添加按钮回调
            list.onAddCallback = (ReorderableList list) =>
            {
                pack.names.Add("New Animation");
            };
        }

        public override void OnInspectorGUI()
        {
            EditorGUILayout.Space();
            serializedObject.Update();
            list.DoLayoutList();
            serializedObject.ApplyModifiedProperties();

            EditorUtility.SetDirty(pack);
        }
    }
}
