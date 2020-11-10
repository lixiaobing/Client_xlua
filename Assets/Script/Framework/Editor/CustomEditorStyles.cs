

using UnityEditor;
using UnityEngine;

public static class CustomEditorStyles
{
    public static Font font;

    public static GUIStyle warnLabel;

    public static GUIStyle titleLabel;

    public static GUIStyle subTitleLabel;

    public static GUIStyle contentLabel;

    public static GUIStyle textField;

    public static GUIStyle box;

    public static GUIStyle selectionGridLeft;

    public static GUIStyle helpBox;

    public static GUIStyle editBtn;

    static CustomEditorStyles()
    {
        GUIStyle s0 = new GUIStyle(EditorStyles.label);
        s0.fontSize = 18;
        s0.fontStyle = FontStyle.Italic;
        s0.normal.textColor = Color.red;

        warnLabel = s0;

        GUIStyle s = new GUIStyle(EditorStyles.label);
        s.fontSize = 14;
        s.fontStyle = FontStyle.Italic;
        s.normal.textColor = Color.green;

        titleLabel = s;

        s = new GUIStyle(EditorStyles.label);
        s.fontSize = 10;
        s.normal.textColor = Color.grey;

        subTitleLabel = s;


        s = new GUIStyle(EditorStyles.label);
        s.fontSize = 10;
        s.normal.textColor = Color.yellow;

        contentLabel = s;

        GUIStyle s1 = new GUIStyle(EditorStyles.textField);
        s1.fontSize = 12;

        textField = s1;

        GUIStyle s2 = new GUIStyle(GUI.skin.box);
        s2.padding.top = 4;
        s2.padding.bottom = 4;
        s2.margin.top = 2;
        s2.margin.bottom = 2;
        box = s2;

        GUIStyle s3 = new GUIStyle(GUI.skin.button);
        s3.alignment = TextAnchor.MiddleLeft;

        selectionGridLeft = s3;

        GUIStyle s4 = new GUIStyle(EditorStyles.miniButton);
        editBtn = s4;
    }


}
