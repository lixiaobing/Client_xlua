//
// @brief: 按钮控制组件
// @version: 1.0.0
// @author lanqibo
// @date: 6/8/2019
// @remarks Copyright(c) 2019,Droidelite.
// All rights reserved
//

using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Framework
{
    public class UIButtonScale : MonoBehaviour, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler
    {
        Vector3 baseScale;

        Button button;
        RectTransform rectTrans;
        Vector2 pos;
        //AkAmbient m_btnAkEvent;

        void Awake()
        {
            baseScale = this.transform.localScale;
            rectTrans = this.GetComponent<RectTransform>();
            button = this.GetComponent<Button>();
            //m_btnAkEvent = this.GetComponent<AkAmbient>();
        }

        void Start()
        {

        }

        public delegate void VoidDelegate(PointerEventData go);
        public VoidDelegate onPointerDown;
        public VoidDelegate onPointerUp;
        public VoidDelegate onPointerClick;

        public XTween tweenDown;
        public XTween tweenUp;

        private bool checkDown = false;
        private bool checkUp = false;

        public void OnPointerDown(PointerEventData eventData)
        {
            // Debug.LogError ("Down");

            checkDown = RectTransformUtility.RectangleContainsScreenPoint(rectTrans, eventData.position, eventData.pressEventCamera);
            if (button != null && button.interactable)
            {
                pos = eventData.position;
                tweenDown = GameTween.DOScaleV(this.transform, baseScale * 0.95f, 0.05f);
            }
        }

        public void OnPointerUp(PointerEventData eventData)
        {
            // Debug.LogError ("UP");

            checkUp = RectTransformUtility.RectangleContainsScreenPoint(rectTrans, eventData.position, eventData.pressEventCamera);
            if (checkDown && !checkUp && pos == eventData.position)
            {
                if (button != null && button.onClick != null && button.interactable)
                {
                    button.onClick.Invoke();
                }
            }

            if (button != null && button.interactable)
            {
                tweenUp = GameTween.DOScaleV(this.transform, baseScale, 0.05f);
            }
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            // Debug.LogError ("Click");
            //if (m_btnAkEvent != null)
            //    m_btnAkEvent.HandleEvent(m_btnAkEvent.gameObject);
            //m_btnAkEvent.data.Post(m_btnAkEvent.gameObject);
        }

        void test()
        {
            // Debug.LogError ("!!!!!");
        }

        void OnDestroy()
        {
            if (tweenDown != null)
                tweenDown.Kill(false);

            if (tweenUp != null)
                tweenUp.Kill(true);
        }

    }
}