using System;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

[CustomEditor(typeof(CameraEffectPack), true)]
public class CameraShakePackEditor : Editor
{
    CameraEffectPack pack;

    ReorderableList list;

    void OnEnable()
    {
        pack = target as CameraEffectPack;

        list = new ReorderableList(pack.templates, typeof(CameraEffectTemplate));

        list.drawElementCallback = (Rect rect, int index, bool selected, bool focused) =>
        {
            CameraEffectTemplate template = pack.templates[index];

            list.elementHeight = 192;

            rect.x += 5;
            rect.y += 5;
            rect.width -= 5;
            rect.height = 182;

            GUI.Box(rect, "", EditorStyles.helpBox);

            rect.x += 5;
            rect.y += 5;
            rect.width -= 10;
            rect.height = 18;

            template.name = EditorGUI.TextField(rect, "模 板 名", template.name);
            rect.y += 22;
            template.id = EditorGUI.IntField(rect, "模板ID", template.id);
            rect.y += 22;
            template.type = (CameraEffectType)EditorGUI.EnumPopup(rect, "效果类型", template.type);
            rect.y += 22;
            template.time = EditorGUI.FloatField(rect, "持续时长", template.time);

            if (template.type == CameraEffectType.Zoom || template.type == CameraEffectType.Horizontal ||
            template.type == CameraEffectType.Vertical || template.type == CameraEffectType.AllRound)
            {
                rect.y += 22;
                template.range = EditorGUI.FloatField(rect, "偏移范围", template.range);
                rect.y += 22;
                template.count = EditorGUI.IntField(rect, "执行次数", template.count);
                rect.y += 22;
                template.random = EditorGUI.Toggle(rect, "随机偏移", template.random);
            }
            else if(template.type == CameraEffectType.RadialBlur)
            {
                if (string.IsNullOrEmpty(template.mode))
                {
                    template.mode = RadialBlurMode.Normal.ToString();
                }
                RadialBlurMode mode = (RadialBlurMode)Enum.Parse(typeof(RadialBlurMode), template.mode);
                rect.y += 22;
                template.mode = EditorGUI.EnumPopup(rect, "模糊模式", mode).ToString();
                rect.y += 22;
                template.offset = EditorGUI.Slider(rect, "模糊偏移", template.offset, 0, 1);
                rect.y += 22;
                template.intensity = EditorGUI.FloatField(rect, "模糊强度", template.intensity);
                rect.y += 22;
                template.filter = EditorGUI.FloatField(rect, "模糊滤值", template.filter);
            }

        };
        //绘制表头
        list.drawHeaderCallback = (Rect rect) =>
        {
            GUI.Label(rect, "Camera Effect Templates");
        };
        //当移除元素时回调
        list.onRemoveCallback = (ReorderableList list) =>
        {
            ReorderableList.defaultBehaviours.DoRemoveButton(list);
        };
        //添加按钮回调
        list.onAddCallback = (ReorderableList list) =>
        {
            var newObj = new CameraEffectTemplate();
            pack.templates.Add(newObj);
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