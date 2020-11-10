using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class ScrollRectHelper : MonoBehaviour, IBeginDragHandler
{
    private PointerEventData pData;

    public PointerEventData pDataOnDrag
    {
        get { return pData; }
    }
    
    public void OnBeginDrag(PointerEventData eventData)
    {
        pData = eventData;
    }
}
