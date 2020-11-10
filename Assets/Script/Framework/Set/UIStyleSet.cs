//
// @brief: 资源仓库asset文件对象
// @version: 1.0.0
// @author lanqibo
// @date: 6/8/2019
// @remarks Copyright(c) 2019,Droidelite.
// All rights reserved
//

namespace Framework
{
    using System.Collections.Generic;
    using UnityEngine;
    using UnityEngine.UI;

    [CreateAssetMenu(fileName = "UIStyleSet", menuName = "X-Create UIStyleSet")]
    [System.Serializable]
    public class UIStyleSet : ScriptableObject
    {
        public int fontOrder;

        public int buttonOrder;

        public List<UIFontStyle> fonts = new List<UIFontStyle>();

        public Dictionary<int, UIFontStyle> getFontMap()
        {
            Dictionary<int, UIFontStyle> fontStyles = new Dictionary<int, UIFontStyle>();
            foreach (UIFontStyle s in fonts)
            {
                fontStyles[s.id] = s;
            }
            return fontStyles;
        }

        public List<string> getFontNames()
        {
            List<string> fontNames = new List<string>();
            foreach (UIFontStyle s in fonts)
            {
                fontNames.Add(s.name);
            }
            return fontNames;
        }

        public UIFontStyle getFontStyleById(int id)
        {
            foreach (UIFontStyle s in fonts)
            {
                if (s.id == id)
                    return s;
            }
            return null;
        }

        public List<UIButtonStyle> buttons = new List<UIButtonStyle>();

        public Dictionary<int, UIButtonStyle> getButtonMap()
        {
            Dictionary<int, UIButtonStyle> buttonStyles = new Dictionary<int, UIButtonStyle>();
            foreach (UIButtonStyle s in buttons)
            {
                buttonStyles[s.id] = s;
            }
            return buttonStyles;
        }

        public List<string> getButtonNames()
        {
            List<string> btnNames = new List<string>();
            foreach (UIButtonStyle s in buttons)
            {
                btnNames.Add(s.name);
            }
            return btnNames;
        }

        public UIButtonStyle getButtonStyleById(int id)
        {
            foreach (UIButtonStyle s in buttons)
            {
                if (s.id == id)
                    return s;
            }
            return null;
        }

        public int getIndexOfFontId(int id)
        {
            for (int i = 0; i < fonts.Count; i++)
            {
                if (fonts[i].id == id)
                {
                    return i;
                }
            }
            return -1;
        }

        public int getIndexOfButtonId(int id)
        {
            for (int i = 0; i < buttons.Count; i++)
            {
                if (buttons[i].id == id)
                {
                    return i;
                }
            }
            return -1;
        }
    }

}
