//
// @brief: 资源仓库编辑器
// @version: 1.0.0
// @author lanqibo
// @date: 6/8/2019
// @remarks Copyright(c) 2019,Droidelite.
// All rights reserved
//

using System.Collections.Generic;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using UnityEngine.UI;

namespace Framework
{

    [CustomEditor(typeof(UIStyle))]
    [CanEditMultipleObjects]
    public class UIStyleEditor : Editor
    {
        public static UIStyleSet asset;

        UIStyle _target;

        void OnEnable()
        {
            _target = target as UIStyle;

            if (asset == null)
            {
                asset = AssetDatabase.LoadAssetAtPath<UIStyleSet>("Assets/ResourcesAsset/Setting/UIStyleSet.asset");
                if (!Application.isPlaying)
                {
                    UIStyle.libSet = asset;
                    UIStyle.fontStyles = asset.getFontMap();
                    UIStyle.buttonStyles = asset.getButtonMap();
                }
            }
        }

        public override void OnInspectorGUI()
        {
            Text text = _target.gameObject.GetComponent<Text>();
            Button button = _target.gameObject.GetComponent<Button>();

            GUILayout.Space(10);


            if (asset != null && text != null)
            {
                string newLang = EditorGUILayout.TextField("Language Key", _target.languageKey);
                if (newLang != _target.languageKey)
                {
                    _target.languageKey = newLang;
                    EditorUtility.SetDirty(_target);
                }

                GUILayout.Space(10);

                if (_target.enabled)
                {
                    UIFontStyle style = asset.getFontStyleById(_target.fontStyle);

                    int selectIndex = asset.getIndexOfFontId(style.id);
                    selectIndex = EditorGUILayout.Popup("Select FontType", selectIndex, asset.getFontNames().ToArray());

                    style = asset.fonts[selectIndex];

                    if (style.id != _target.fontStyle)
                    {
                        _target.fontStyle = style.id;
                        _target.ApplyFontStyle(style);

                        EditorUtility.SetDirty(_target);
                    }

                    if (style != null)
                    {
                        EditorGUILayout.LabelField("Font", style.fontFamily.name);
                        EditorGUILayout.LabelField("Font Style", style.fontStyle.ToString());
                        EditorGUILayout.LabelField("Font Size", style.fontSize.ToString());
                        EditorGUILayout.LabelField("Font Color", "#" + ColorUtility.ToHtmlStringRGBA(style.fontColor));
                    }

                }

            }

            if (asset != null && button != null)
            {
                UIButtonStyle style = asset.getButtonStyleById(_target.buttonStyle);

                int selectIndex = asset.getIndexOfButtonId(style.id);
                selectIndex = EditorGUILayout.Popup("Select Button Style", selectIndex, asset.getButtonNames().ToArray());

                style = asset.buttons[selectIndex];

                if (style.id != _target.buttonStyle)
                {
                    _target.normalSelect = -1;
                    _target.buttonStyle = style.id;
                    _target.ApplyButtonStyle(style);

                    EditorUtility.SetDirty(_target);
                }

                if (_target.buttonText == null)
                {
                    Transform inText = _target.transform.Find("Text");
                    if (inText != null)
                    {
                        _target.buttonText = inText.GetComponent<Text>();
                        _target.ApplyButtonStyle(style);
                        EditorUtility.SetDirty(_target);
                    }
                }

                Text text1 = (Text)EditorGUILayout.ObjectField("button Text", _target.buttonText, typeof(Text), true);

                if (text1 != _target.buttonText)
                {
                    _target.buttonText = text1;
                    EditorUtility.SetDirty(_target);
                }

                if (style != null && style.normalStates.Count > 0)
                {
                    if (_target.normalSelect == -1)
                        _target.normalSelect = style.normalSelect;

                    int select = EditorGUILayout.IntSlider("Normal Select", _target.normalSelect, -1, style.normalStates.Count - 1);

                    if (select != _target.normalSelect)
                    {
                        _target.normalSelect = select;
                        _target.ChangeNormalState(style, _target.normalSelect);
                        EditorUtility.SetDirty(_target);
                    }
                }
            }

            GUI.skin.font = CustomEditorStyles.font;

            GUILayout.Space(15);

            base.serializedObject.ApplyModifiedProperties();

            EditorGUILayout.BeginHorizontal();


            GUILayout.Space(5);

            if (GUILayout.Button("查看库文件", GUILayout.Width(100)))
            {
                Selection.activeObject = asset;
            }

            EditorGUILayout.EndHorizontal();

            GUILayout.Space(5);
        }
    }
}