//
// @brief: 资源仓库Mono
// @version: 1.0.0
// @author lanqibo
// @date: 6/8/2019
// @remarks Copyright(c) 2019,Droidelite.
// All rights reserved
//

using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;
using XLua;
using static UnityEngine.UI.Selectable;

namespace Framework
{
    [System.Serializable]
    public class UIStyle : MonoBehaviour
    {
        public int fontStyle = 0;

        private UIFontStyle fontStyleSource = null;

        public string languageKey = string.Empty;

        public static UIStyleSet libSet = null;

        public static Dictionary<int, UIFontStyle> fontStyles;

        public int buttonStyle = 0;

        private UIButtonStyle buttonStyleSource = null;

        public int normalSelect = -1;

        public Text buttonText = null;

        public static Dictionary<int, UIButtonStyle> buttonStyles;

        public static LuaFunction langFunc;

        public static void init()
        {
            if (libSet == null)
            {
                libSet = AssetManager.Instance.GetSetting<UIStyleSet>();

                fontStyles = libSet.getFontMap();
                buttonStyles = libSet.getButtonMap();
            }
        }

        private void Awake()
        {
            init();
        }

        private void Start()
        {
            SetLang(languageKey);

            Reset();
        }

        public void Reset()
        {
            ApplyFontStyle();

            button = this.GetComponent<Button>();
            if (button)
            {
                buttonInteractable = button.interactable;
                ApplyButtonStyle();
                ChangeNormalState(normalSelect);
            }
        }

        public void SetLang(int intkey)
        {
            string key = intkey.ToString();
            SetLang(key);
        }

        public void SetLang(string key)
        {
            Text text = this.GetComponent<Text>();
            if (text && !string.IsNullOrEmpty(key))
            {
                languageKey = key;
                languageKey = languageKey.Replace(" ", "");

                if (langFunc == null)
                    langFunc = LuaManager.Instance.GetFunction("Lang");

                if (langFunc != null)
                    text.text = langFunc.Func<string, string>(languageKey);
            }
        }


        private Button button = null;
        private bool buttonInteractable = false;

        private void Update()
        {
            if (button)
            {
                if (buttonInteractable != button.interactable)
                {
                    buttonInteractable = button.interactable;

                    ApplyButtonStyle();
                    ChangeNormalState(normalSelect);
                }
            }
        }

        public void ApplyFontStyle(int id)
        {
            if (fontStyles.TryGetValue(id, out UIFontStyle style))
            {
                fontStyle = id;
                ApplyFontStyle(style);
            }
        }

        public void ApplyFontStyle()
        {
            Text text = this.GetComponent<Text>();
            if (text)
            {
                if (fontStyles.TryGetValue(fontStyle, out UIFontStyle style))
                {
                    ApplyFontStyle(style);
                }
            }
        }

        public void ApplyFontStyle(UIFontStyle style)
        {
            fontStyleSource = style;

            Text text = this.GetComponent<Text>();
            if (text)
            {
                text.font = style.fontFamily;
                text.fontStyle = style.fontStyle;
                text.fontSize = style.fontSize;
                text.color = style.fontColor;

                text.alignByGeometry = style.alignByGeometry;
                text.raycastTarget = style.raycastTarget;

                Shadow s = this.GetComponent<Shadow>();
                if (style.useShadow)
                {
                    if (s == null)
                        s = this.gameObject.AddComponent<Shadow>();
                    s.effectColor = style.shadowColor;
                    s.effectDistance = style.shadowDistance;
                }
                else
                {
                    if (s != null)
                        Object.DestroyImmediate(s);
                }

                Outline o = this.GetComponent<Outline>();
                if (style.useOutline)
                {
                    if (o == null)
                        o = this.gameObject.AddComponent<Outline>();
                    o.effectColor = style.outlineColor;
                    o.effectDistance = style.outlineDistance;
                }
                else
                {
                    if (o != null)
                        Object.DestroyImmediate(o);
                }
            }
        }


        public void ChangeNormalState(int state)
        {
            if (state == -1) return;

            if (buttonStyles.TryGetValue(buttonStyle, out UIButtonStyle style))
            {
                if (state >= style.normalStates.Count) return;

                Sprite sp = style.normalStates[state];
                if (sp == null) return;

                Image btnImg = this.GetComponent<Image>();
                btnImg.sprite = sp;
            }
        }

        public void ChangeNormalState(UIButtonStyle style, int state)
        {
            if (state == -1) return;

            if (state >= style.normalStates.Count) return;

            Sprite sp = style.normalStates[state];
            if (sp == null) return;

            Image btnImg = this.GetComponent<Image>();
            btnImg.sprite = sp;
        }

        public void ApplyButtonStyle()
        {
            Button btn = this.GetComponent<Button>();
            if (btn)
            {
                if (buttonStyles.TryGetValue(buttonStyle, out UIButtonStyle style))
                {
                    ApplyButtonStyle(style);
                }
            }
        }

        public void ApplyButtonStyle(int id)
        {
            if (buttonStyles.TryGetValue(id, out UIButtonStyle style))
            {
                buttonStyle = id;
                ApplyButtonStyle(style);
            }
        }

        public void ApplyButtonStyle(UIButtonStyle style)
        {
            buttonStyleSource = style;

            Button button = this.GetComponent<Button>();
            if (button)
            {
                Image btnImg = this.GetComponent<Image>();
                btnImg.sprite = style.spriteNormal;
                btnImg.type = Image.Type.Simple;
                btnImg.SetNativeSize();

                button.transition = Transition.SpriteSwap;
                SpriteState state = new SpriteState();
                state.disabledSprite = style.spriteDisable;
                button.spriteState = state;

                UIButtonScale o = this.GetComponent<UIButtonScale>();
                if (style.useClickScale)
                {
                    if (o == null)
                        o = this.gameObject.AddComponent<UIButtonScale>();
                    else
                        o.enabled = true;
                }
                else
                {
                    if (o != null)
                        o.enabled = false;
                }

                ChangeNormalState(style, normalSelect);

                if (buttonText != null)
                {
                    UIStyle resText = buttonText.transform.GetComponent<UIStyle>();
                    if (resText == null)
                    {
                        resText = buttonText.gameObject.AddComponent<UIStyle>();
                    }

                    if (button.interactable)
                        resText.fontStyle = style.normalFontStyle;
                    else
                        resText.fontStyle = style.disabledFontStyle;

                    resText.ApplyFontStyle();

                    buttonText.lineSpacing = style.textLineSpacing;
                    buttonText.resizeTextForBestFit = style.textBestFit;
                    buttonText.resizeTextMinSize = style.textMinSize;
                    buttonText.resizeTextMaxSize = style.textMaxSize;

                    RectTransform rect = buttonText.transform.GetComponent<RectTransform>();
                    rect.anchorMin = style.textAnchorMin;
                    rect.anchorMax = style.textAnchorMax;

                    rect.offsetMin = style.textOffsetMin;
                    rect.offsetMax = style.textOffsetMax;
                }
            }
        }

    }

    [System.Serializable]
    public class UIFontStyle
    {
        public int id = 0;

        public string name = string.Empty;
        public Font fontFamily = null;
        public FontStyle fontStyle = FontStyle.Normal;
        public int fontSize = 14;
        public Color fontColor = Color.white;

        public bool useShadow = false;
        public Color shadowColor = Color.white;
        public Vector2 shadowDistance = new Vector2(1, -1);

        public bool useOutline = false;
        public Color outlineColor = Color.white;
        public Vector2 outlineDistance = new Vector2(1, -1);

        public bool alignByGeometry = true;
        public bool raycastTarget = false;
    }

    [System.Serializable]
    public class UIButtonStyle
    {
        public int id = 0;

        public string name = string.Empty;
        public bool useClickScale = true;
        public Sprite spriteNormal = null;
        public Sprite spriteDisable = null;

        public List<Sprite> normalStates = new List<Sprite>();
        public int normalSelect = -1;

        public float textLineSpacing = 1;

        public bool textBestFit = false;

        public int textMinSize = 0;
        public int textMaxSize = 0;

        public Vector2 textAnchorMin = Vector2.zero;
        public Vector2 textAnchorMax = Vector2.one;

        public Vector2 textOffsetMin = Vector2.zero;
        public Vector2 textOffsetMax = Vector2.zero;

        public int normalFontStyle = 0;
        public int disabledFontStyle = 0;
    }

}
