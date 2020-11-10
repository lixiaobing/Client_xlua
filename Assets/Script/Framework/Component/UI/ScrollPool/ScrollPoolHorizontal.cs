using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices.WindowsRuntime;

public class ScrollPoolHorizontal : ScrollPool
{
    //配置参数
    [HideInInspector] public float spacing;
    [HideInInspector] public bool variableSize = false;
    private float viewWidth = 0;
    private float listWidth = 0;


    protected override void ResetPadding()
    {
        padding.left = 0;
        padding.right = spacing;
    }

    protected override void SetListPivot()
    {
        scrollList.pivot = new Vector2(0, scrollList.pivot.y);
        scrollList.anchorMin = new Vector2(0, scrollList.anchorMin.y);
        scrollList.anchorMax = new Vector2(0, scrollList.anchorMax.y);
    }

    protected override int GetMaxPoolSize()
    {
        viewWidth = scrollRect.GetComponent<RectTransform>().rect.width;
        float sizeX = viewWidth % (spacing + cardSize.x);
        int maxSize = (int)(viewWidth / (spacing + cardSize.x));
        if (sizeX > spacing)
        {
            maxSize += 2;
        }
        else
        {
            maxSize += 1;
        }
        return maxSize;
    }

    protected override void InitCardName(int index, GameObject card)
    {
        card.name = string.Format("obj[{0}]", index.ToString());
    }

    #region InitListSize
    public override void InitListSize(int num)
    {
        if (variableSize)
        {
            InitListSizeVariable(num);
        }
        else
        {
            InitListSizeFixed(num);
        }
    }

    private void InitListSizeFixed(int num)
    {

        float width = padding.left + cardSize.x + (num - 1) * (spacing + cardSize.x) + padding.right;
        listWidth = num > 0 ? width : 0;

        scrollList.sizeDelta = new Vector2(listWidth, scrollList.sizeDelta.y);
    }

    private void InitListSizeVariable(int num)
    {

        float width = padding.left + GetCardSize(1).x;
        for (int i = 1; i < num; i++)
        {
            width += GetCardSize(i + 1).x + spacing;
        }

        width += padding.right;

        listWidth = num > 0 ? width : 0;

        scrollList.sizeDelta = new Vector2(listWidth, scrollList.sizeDelta.y);
    }
    #endregion

    #region GetStartIndex

    protected override int GetStartIndex()
    {
        int startIndex = 0;
        if (variableSize)
        {
            startIndex = GetStartIndexVarible();
        }
        else
        {
            startIndex = GetStartIndexFixed();
        }

        int limitIdx = GetStartIndexLimit();

        if (startIndex > limitIdx)
        {
            startIndex = limitIdx;
        }
        else if (startIndex < 1)
        {
            startIndex = 1;
        }
        return startIndex;
    }


    private int GetStartIndexFixed()
    {
        float posX = scrollList.anchoredPosition.x;
        float disX;
        int startIndex;
        if (posX > 0)
        {
            posX = 0;
        }
        disX = Mathf.Abs(posX);
        if (disX >= cardSize.x + padding.left)
        {
            startIndex = (int)Mathf.Floor((disX - padding.left - cardSize.x) / (spacing + cardSize.x)) + 2;
        }
        else
        {
            startIndex = 1;
        }
        return startIndex;
    }


    private int GetStartIndexVarible()
    {
        float posX = scrollList.anchoredPosition.x;
        float disX;

        if (posX > 0)
        {
            posX = 0;
        }
        disX = Mathf.Abs(posX);

        int startIndex = 1;
        float sumX = padding.left + GetCardSize(1).x;

        for (int i = 1; i < dataNum; i++)
        {
            if (disX >= sumX)
            {
                sumX += spacing + GetCardSize(i + 1).x;
                startIndex += 1;
            }
            else
            {
                break;
            }
        }

        return startIndex;
    }
    #endregion

    #region GetEndIndex
    protected override int GetEndIndex()
    {
        if (variableSize)
        {
            return GetEndIndexVariable();
        }
        else
        {
            return GetEndIndexFixed();
        }
    }

    private int GetEndIndexFixed()
    {
        if (dataNum > poolSize)
        {
            return GetStartIndex() + poolSize - 1;
        }
        else
        {
            return dataNum;
        }
    }

    private int GetEndIndexVariable()
    {
        int end = 1;

        float posX = scrollList.anchoredPosition.x;
        float disX;
        float sumX = padding.left + GetCardSize(1).x;

        if (posX > 0)
        {
            posX = 0;
        }
        disX = Mathf.Abs(posX);
        for (int i = 1; i < dataNum; i++)
        {
            if (sumX - disX >= viewWidth)
            {
                if (sumX - disX - GetCardSize(i).x >= viewWidth)
                {
                    end--;
                }
                break;
            }
            else
            {
                sumX += GetCardSize(i + 1).x + spacing;
                end++;
            }
        }

        end = Mathf.Min(end, dataNum);

        return end;
    }
    #endregion

    #region GetStartIndexLimit
    protected override int GetStartIndexLimit()
    {
        if (variableSize)
        {
            return GetStartIndexLimitVariable();
        }
        else
        {
            return GetStartIndexLimitFixed();
        }
    }

    private int GetStartIndexLimitFixed()
    {
        return base.GetStartIndexLimit();
    }

    private int GetStartIndexLimitVariable()
    {
        float sumX = GetCardSize(dataNum).x + padding.right + spacing;
        int limitIdx = dataNum;
        for (int i = dataNum; i > 1; i--)
        {
            if (viewWidth > sumX)
            {
                sumX += spacing + GetCardSize(i - 1).x;
                limitIdx -= 1;
            }
            else
            {
                break;
            }
        }

        limitIdx = Mathf.Max(limitIdx, 1);

        return limitIdx;
    }
    #endregion

    #region InitCardPos
    protected override void InitCardPos(int index, GameObject card)
    {
        if (variableSize)
        {
            InitCardPosVariable(index, card);
        }
        else
        {
            InitCardPosFixed(index, card);
        }
    }

    private void InitCardPosFixed(int index, GameObject card)
    {
        float posX = (index - 1) * (cardSize.x + spacing) + padding.left;
        card.GetComponent<RectTransform>().anchoredPosition = new Vector2(posX, -padding.top);
    }

    private void InitCardPosVariable(int index, GameObject card)
    {
        float posX = padding.left;

        for (int i = 1; i < index; i++)
        {
            posX += GetCardSize(i).x + spacing;
        }

        card.GetComponent<RectTransform>().anchoredPosition = new Vector2(posX, -padding.top);
    }
    #endregion

    #region GetTargetPos
    protected override Vector2 GetTargetPos(int index)
    {
        if (variableSize)
        {
            return GetTargetPosVariable(index);
        }
        else
        {
            return GetTargetPosFixed(index);
        }
    }

    private Vector2 GetTargetPosFixed(int index)
    {
        float posX = 0;
        float posY = scrollList.anchoredPosition.y;

        if (listWidth <= viewWidth)
        {
            posX = 0;
        }
        else
        {
            if (index <= 1)
            {
                posX = 0;
            }
            else
            {
                posX = Mathf.Clamp((index - 1) * (cardSize.x + spacing) + padding.left, 0, listWidth - viewWidth);
            }
        }

        return new Vector2(-posX, posY);
    }

    private Vector2 GetTargetPosVariable(int index)
    {
        float posX = 0;
        float posY = scrollList.anchoredPosition.y;

        if (listWidth <= viewWidth)
        {
            posX = 0;
        }
        else
        {
            if (index <= 1)
            {
                posX = 0;
            }
            else
            {
                for (int i = 1; i < index; i++)
                {
                    posX += GetCardSize(i).x + spacing;
                }

                posX += padding.left;
                posX = Mathf.Clamp(posX, 0, listWidth - viewWidth);
            }
        }

        return new Vector2(-posX, posY);
    }
    #endregion

    #region GetNormalizedPos

    protected override float GetNormalizedPos(ScrollPoolObj spObj)
    {
        RectTransform rectTrans = spObj.GetComponent<RectTransform>();
        float posX = scrollList.anchoredPosition.x;
        float distance = Mathf.Abs(rectTrans.anchoredPosition.x) + rectTrans.rect.width / 2 + posX;
        float maxDistance = scrollRect.GetComponent<RectTransform>().rect.width;
        return Mathf.Clamp(distance / maxDistance, 0, 1);
    }

    #endregion

    protected override void RefreshPool()
    {
        if (variableSize)
        {
            if (listWidth > viewWidth)
            {
                DoRefreshPool();
            }
        }
        else
        {
            if (dataNum > poolSize)
            {
                DoRefreshPool();
            }
        }
    }

    protected override void CheckListRePosition()
    {
        if (!isLoop)
        {
            return;
        }
        if (listWidth > viewWidth)
        {
            float posX = scrollList.anchoredPosition.x;
            float disX = 0;
            float offset = 0;
            bool reverse = false;

            for (int i = 1; i <= dataNum; i++)
            {
                viewIdx2DataIdxBuffer[i] = GetDataIdxByViewIdx(i);
            }

            if (posX > 0)
            {
                int endIdx = GetEndIndex();
                for (int i = 1; i <= endIdx; i++)
                {
                    disX += GetCardSize(i).x + spacing;
                }

                offset = -(listWidth - disX - posX);

                for (int i = 1; i <= dataNum - endIdx; i++)
                {
                    viewIdx2DataIdx[i] = GetDataIdxByViewIdx(endIdx + i);
                }

                for (int i = 1; i <= endIdx; i++)
                {
                    viewIdx2DataIdx[dataNum - endIdx + i] = viewIdx2DataIdxBuffer[i];
                }

                reverse = true;
            }
            else if (posX < viewWidth - listWidth)
            {
                int startIdx = GetStartIndex();
                for (int i = startIdx; i <= dataNum; i++)
                {
                    disX += GetCardSize(i).x + spacing;
                }

                offset = -(disX - viewWidth + viewWidth - listWidth - posX);

                for (int i = 1; i < startIdx; i++)
                {
                    viewIdx2DataIdx[dataNum - i + 1] = GetDataIdxByViewIdx(startIdx - i);
                }

                for (int i = 1; i <= dataNum - startIdx + 1; i++)
                {
                    viewIdx2DataIdx[i] = viewIdx2DataIdxBuffer[startIdx + i - 1];
                }

                reverse = false;
            }

            if (offset != 0)
            {
                listAnchoredPosBuffer.x = offset;
                listAnchoredPosBuffer.y = scrollList.anchoredPosition.y;
                DoListReposition(reverse);
            }
        }
    }


    public override void OnObjSizeChanged(int idx)
    {
        if (!variableSize)
        {
            return;
        }

        int dataIdx = GetDataIdxByViewIdx(idx);

        Vector2 newSize = curCards[dataIdx].GetComponent<RectTransform>().sizeDelta;

        float deltaX = newSize.x - GetCardSize(idx).x;
        float deltaY = newSize.y - GetCardSize(idx).y;

        if (newSize.x == cardSize.x && newSize.y == cardSize.y)
        {
            if (curSize.ContainsKey(dataIdx))
            {

                curSize.Remove(dataIdx);
            }
        }
        else
        {
            curSize[dataIdx] = newSize;
        }

        InitListSize(dataNum);

        for (int i = curStartIndex; i <= curEndIndex; i++)
        {
            if (i > idx)
            {
                RectTransform cardRt = curCards[GetDataIdxByViewIdx(i)].GetComponent<RectTransform>();
                Vector2 prePos = cardRt.anchoredPosition;
                cardRt.anchoredPosition = new Vector2(prePos.x + deltaX, prePos.y - deltaY);
            }
        }

        base.OnObjSizeChanged(idx);
    }
}
