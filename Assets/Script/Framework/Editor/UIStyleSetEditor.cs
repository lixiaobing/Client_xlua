using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Framework
{

    [CustomEditor(typeof(UIStyleSet))]
    public class UIStyleSetEditor : Editor
    {
        UIStyleSet asset;

        ReorderableList fontList;
        SerializedProperty fontProperty;

        ReorderableList buttonList;
        SerializedProperty buttonProperty;

        bool showButtonNormal = false;

        Dictionary<int, bool> buttonElementNormalStatesToggles = new Dictionary<int, bool>();
        Dictionary<int, float> buttonElementHeights = new Dictionary<int, float>();

        void OnEnable()
        {
            asset = target as UIStyleSet;

            fontProperty = serializedObject.FindProperty("fonts");
            fontList = new ReorderableList(asset.fonts, typeof(string));

            fontList.drawElementCallback = (Rect rect, int index, bool selected, bool focused) =>
            {
                fontList.elementHeight = 330;

                rect.x += 5;
                rect.y += 5;
                rect.width -= 5;
                rect.height = 320;

                GUI.Box(rect, "", EditorStyles.helpBox);

                rect.x += 5;
                rect.y += 5;
                rect.width -= 10;
                rect.height = 18;

                UIFontStyle style = asset.fonts[index];
                EditorGUI.LabelField(rect, "Font ID", style.id.ToString());
                rect.y += 22;
                style.name = EditorGUI.TextField(rect, "Font Name", style.name);
                rect.y += 22;
                style.fontFamily = (Font)EditorGUI.ObjectField(rect, "Font Family", style.fontFamily, typeof(Font), false);
                rect.y += 22;
                style.fontSize = EditorGUI.IntField(rect, "Font Size", style.fontSize);
                rect.y += 22;
                style.fontStyle = (FontStyle)EditorGUI.EnumFlagsField(rect, "Font Style", style.fontStyle);
                rect.y += 22;
                style.fontColor = EditorGUI.ColorField(rect, "Font Color", style.fontColor);

                rect.y += 26;
                style.useShadow = EditorGUI.Toggle(rect, "Use Shadow", style.useShadow);
                rect.y += 22;
                style.shadowColor = EditorGUI.ColorField(rect, "Shadow Color", style.shadowColor);
                rect.y += 22;
                style.shadowDistance = EditorGUI.Vector2Field(rect, "Shadow Distance", style.shadowDistance);

                rect.y += 26;
                style.useOutline = EditorGUI.Toggle(rect, "Use Outline", style.useOutline);
                rect.y += 22;
                style.outlineColor = EditorGUI.ColorField(rect, "Outline Color", style.outlineColor);
                rect.y += 22;
                style.outlineDistance = EditorGUI.Vector2Field(rect, "Outline Distance", style.outlineDistance);

                rect.y += 22;
                style.alignByGeometry = EditorGUI.Toggle(rect, "alignByGeometry", style.alignByGeometry);

                rect.y += 22;
                style.raycastTarget = EditorGUI.Toggle(rect, "raycastTarget", style.raycastTarget);
            };
            fontList.elementHeightCallback = (index) =>
            {
                return 330;
            };
            fontList.drawHeaderCallback = (Rect rect) =>
            {
                GUI.Label(rect, "Text Styles");
            };
            fontList.onRemoveCallback = (ReorderableList list) =>
            {
                ReorderableList.defaultBehaviours.DoRemoveButton(list);
            };
            fontList.onAddCallback = (ReorderableList list) =>
            {
                asset.fontOrder += 1;

                UIFontStyle newFont = new UIFontStyle();
                newFont.id = asset.fontOrder;
                asset.fonts.Add(newFont);
            };

            buttonProperty = serializedObject.FindProperty("buttons");
            buttonList = new ReorderableList(asset.buttons, typeof(string));

            buttonList.drawElementCallback = (Rect rect, int index, bool selected, bool focused) =>
            {
                float startY = rect.y;

                UIButtonStyle style = asset.buttons[index];

                if (!buttonElementHeights.ContainsKey(index))
                {
                    buttonElementHeights.Add(index, 0);
                }

                rect.x += 5;
                rect.y += 5;
                rect.width -= 5;
                rect.height = buttonElementHeights[index] - 12;

                GUI.Box(rect, "", EditorStyles.helpBox);

                rect.x += 5;
                rect.width -= 10;
                rect.height = 18;

                rect.y += 5;
                EditorGUI.LabelField(rect, "Button ID", style.id.ToString());

                rect.y += 22;
                style.name = EditorGUI.TextField(rect, "Button Name", style.name);

                rect.y += 22;
                style.spriteNormal = (Sprite)EditorGUI.ObjectField(rect, "Normal Sprite", style.spriteNormal, typeof(Sprite), false);

                rect.x += 12;
                rect.y += 22;
                if (!buttonElementNormalStatesToggles.ContainsKey(index))
                {
                    buttonElementNormalStatesToggles.Add(index, false);
                }
                buttonElementNormalStatesToggles[index] = showButtonNormal = EditorGUI.Foldout(rect, buttonElementNormalStatesToggles[index], "Normal States");
                if (buttonElementNormalStatesToggles[index])
                {
                    rect.x += 20;
                    rect.y += 22;
                    rect.width -= 32;

                    int size = EditorGUI.IntField(rect, "Size", style.normalStates.Count);
                    for (var i = style.normalStates.Count - 1; i >= 0; i--)
                    {
                        if (i >= size)
                        {
                            style.normalStates.RemoveAt(i);
                        }
                    }
                    for (var i = 0; i < size; i++)
                    {
                        if (i >= style.normalStates.Count)
                        {
                            style.normalStates.Add(null);
                        }
                        rect.y += 22;
                        style.normalStates[i] = (Sprite)EditorGUI.ObjectField(rect, "Element " + i, style.normalStates[i], typeof(Sprite), false);
                    }

                    rect.x -= 20;
                    rect.width += 32;
                    rect.y += 5;
                }
                rect.x -= 12;

                rect.y += 22;
                style.spriteDisable = (Sprite)EditorGUI.ObjectField(rect, "Disable Sprite", style.spriteDisable, typeof(Sprite), false);

                rect.y += 22;
                int indexNormal = asset.getIndexOfFontId(style.normalFontStyle);
                indexNormal = EditorGUI.Popup(rect, "Normal Font Style", indexNormal, asset.getFontNames().ToArray());
                UIFontStyle fontNormal = asset.fonts[indexNormal];
                style.normalFontStyle = fontNormal.id;

                rect.y += 22;
                int indexDisable = asset.getIndexOfFontId(style.disabledFontStyle);
                indexDisable = EditorGUI.Popup(rect, "Disable Font Style", indexDisable, asset.getFontNames().ToArray());
                UIFontStyle fontDisable = asset.fonts[indexDisable];
                style.disabledFontStyle = fontDisable.id;

                rect.y += 22;
                style.useClickScale = EditorGUI.Toggle(rect, "Use Click Scale", style.useClickScale);

                rect.y += 24;
                rect.height = 205;
                GUI.Box(rect, "", CustomEditorStyles.box);

                rect.x += 3;
                rect.y += 3;
                rect.height = 19;

                EditorGUI.LabelField(rect, "=> Button Text");
                rect.x += 22;
                rect.width -= 30;

                rect.y += 22;
                style.textLineSpacing = EditorGUI.FloatField(rect, "Text Line Spacing", style.textLineSpacing);

                rect.y += 22;
                style.textBestFit = EditorGUI.Toggle(rect, "Text Best Fit", style.textBestFit);

                rect.y += 22;
                style.textMinSize = EditorGUI.IntField(rect, "Text Min Size", style.textMinSize);

                rect.y += 22;
                style.textMaxSize = EditorGUI.IntField(rect, "Text Max Size", style.textMaxSize);

                rect.y += 22;
                style.textAnchorMin = EditorGUI.Vector2Field(rect, "Text Anchor Min", style.textAnchorMin);

                rect.y += 22;
                style.textAnchorMax = EditorGUI.Vector2Field(rect, "Text Anchor Max", style.textAnchorMax);

                rect.y += 22;
                style.textOffsetMin = EditorGUI.Vector2Field(rect, "Text Offset Min", style.textOffsetMin);

                rect.y += 22;
                style.textOffsetMax = EditorGUI.Vector2Field(rect, "Text Offset Max", style.textOffsetMax);

                rect.y += 22;
                rect.height = 19;

                buttonElementHeights[index] = rect.y - startY + 15;

            };
            buttonList.elementHeightCallback = (int index) =>
            {
                if (!buttonElementHeights.ContainsKey(index))
                {
                    return 0;
                }
                return buttonElementHeights[index];
            };
            buttonList.drawHeaderCallback = (Rect rect) =>
            {
                GUI.Label(rect, "Button Styles");
            };
            buttonList.onRemoveCallback = (ReorderableList list) =>
            {
                ReorderableList.defaultBehaviours.DoRemoveButton(list);
            };
            buttonList.onAddCallback = (ReorderableList list) =>
            {
                asset.buttonOrder += 1;

                UIButtonStyle newButton = new UIButtonStyle();
                newButton.id = asset.buttonOrder;
                asset.buttons.Add(newButton);
            };
        }

        public override void OnInspectorGUI()
        {
            EditorGUILayout.Space();

            serializedObject.Update();
            fontList.DoLayoutList();
            buttonList.DoLayoutList();
            serializedObject.ApplyModifiedProperties();

            EditorGUILayout.Space();
            EditorUtility.SetDirty(asset);
        }
    }
}