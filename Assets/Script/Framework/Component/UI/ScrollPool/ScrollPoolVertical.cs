using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ScrollPoolVertical : ScrollPool
{

    [HideInInspector] public float spacing;
    [HideInInspector] public bool variableSize = false;
    private float viewHeight = 0;
    private float listHeight = 0;

    protected override void ResetPadding()
    {
        padding.top = 0;
        padding.bottom = spacing;
    }

    protected override void SetListPivot()
    {
        scrollList.pivot = new Vector2(scrollList.pivot.x, 1);
        scrollList.anchorMin = new Vector2(scrollList.anchorMin.x, 1);
        scrollList.anchorMax = new Vector2(scrollList.anchorMax.x, 1);
    }

    protected override int GetMaxPoolSize()
    {
        viewHeight = scrollRect.GetComponent<RectTransform>().rect.height;
        float sizeY = viewHeight % (spacing + cardSize.y);
        int maxSize = (int)(viewHeight / (spacing + cardSize.y));
        if (sizeY > spacing)
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

        float height = padding.top + cardSize.y + (num - 1) * (spacing + cardSize.y) + padding.bottom;

        listHeight = num > 0 ? height : 0;
        scrollList.sizeDelta = new Vector2(scrollList.sizeDelta.x, listHeight);
    }

    private void InitListSizeVariable(int num)
    {

        float height = padding.top + GetCardSize(1).y;
        for (int i = 1; i < num; i++)
        {
            height += GetCardSize(i + 1).y + spacing;
        }

        height += padding.bottom;

        listHeight = num > 0 ? height : 0;

        scrollList.sizeDelta = new Vector2(scrollList.sizeDelta.x, listHeight);
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
        float posY = scrollList.anchoredPosition.y;
        float disY;
        int startIndex;
        if (posY < 0)
        {
            posY = 0;
        }
        disY = Mathf.Abs(posY);
        if (disY >= cardSize.y + padding.top)
        {
            startIndex = (int)Mathf.Floor((disY - padding.top - cardSize.y) / (spacing + cardSize.y)) + 2;
        }
        else
        {
            startIndex = 1;
        }
        return startIndex;
    }


    private int GetStartIndexVarible()
    {
        float posY = scrollList.anchoredPosition.y;
        float disY;

        if (posY < 0)
        {
            posY = 0;
        }
        disY = Mathf.Abs(posY);

        int startIndex = 1;
        float sumY = padding.top + GetCardSize(1).y;

        for (int i = 1; i < dataNum; i++)
        {
            if (disY >= sumY)
            {
                sumY += spacing + GetCardSize(i + 1).y;
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

        float posY = scrollList.anchoredPosition.y;
        float disY;
        float sumY = padding.top + GetCardSize(1).y;

        if (posY < 0)
        {
            posY = 0;
        }
        disY = Mathf.Abs(posY);
        for (int i = 1; i < dataNum; i++)
        {
            if (sumY - disY >= viewHeight)
            {
                if (sumY - disY - GetCardSize(i).y >= viewHeight)
                {
                    end--;
                }
                break;
            }
            else
            {
                sumY += GetCardSize(i + 1).y + spacing;
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
        float sumY = GetCardSize(dataNum).y + padding.bottom + spacing;
        int limitIdx = dataNum;
        for (int i = dataNum; i > 1; i--)
        {
            if (viewHeight > sumY)
            {
                sumY += spacing + GetCardSize(i - 1).y;
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
        float posY = (index - 1) * (cardSize.y + spacing) + padding.top;
        card.GetComponent<RectTransform>().anchoredPosition = new Vector2(padding.left, -posY);
    }

    private void InitCardPosVariable(int index, GameObject card)
    {
        float posY = padding.top;

        for (int i = 1; i < index; i++)
        {
            posY += GetCardSize(i).y + spacing;
        }

        card.GetComponent<RectTransform>().anchoredPosition = new Vector2(padding.left, -posY);
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
        float posX = scrollList.anchoredPosition.x;
        float posY = 0;

        if (listHeight <= viewHeight)
        {
            posY = 0;
        }
        else
        {
            if (index <= 1)
            {
                posY = 0;
            }
            else
            {
                posY = Mathf.Clamp((index - 1) * (cardSize.y + spacing) + padding.top, 0, listHeight - viewHeight);
            }
        }

        return new Vector2(posX, posY);
    }

    private Vector2 GetTargetPosVariable(int index)
    {
        float posX = scrollList.anchoredPosition.x;
        float posY = 0;

        if (listHeight <= viewHeight)
        {
            posY = 0;
        }
        else
        {
            if (index <= 1)
            {
                posY = 0;
            }
            else
            {
                for (int i = 1; i < index; i++)
                {
                    posY += GetCardSize(i).y + spacing;
                }

                posY += padding.top;
                posY = Mathf.Clamp(posY, 0, listHeight - viewHeight);
            }
        }

        return new Vector2(posX, posY);
    }

    #endregion

    #region GetNormalizedPos

    protected override float GetNormalizedPos(ScrollPoolObj spObj)
    {
        RectTransform rectTrans = spObj.GetComponent<RectTransform>();
        float posY = scrollList.anchoredPosition.y;
        float distance = Mathf.Abs(rectTrans.anchoredPosition.y) + rectTrans.rect.height / 2 - posY;
        float maxDistance = scrollRect.GetComponent<RectTransform>().rect.height;
        return Mathf.Clamp(distance / maxDistance, 0, 1);
    }

    #endregion

    protected override void RefreshPool()
    {
        if (variableSize)
        {
            if (listHeight > viewHeight)
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
        if (listHeight > viewHeight)
        {
            float posY = scrollList.anchoredPosition.y;
            float disY = 0;
            float offset = 0;
            bool reverse = false;

            for (int i = 1; i <= dataNum; i++)
            {
                viewIdx2DataIdxBuffer[i] = GetDataIdxByViewIdx(i);
            }

            if (posY < 0)
            {
                int endIdx = GetEndIndex();
                for (int i = 1; i <= endIdx; i++)
                {
                    disY += GetCardSize(i).y + spacing;
                }

                offset = listHeight - disY + posY;

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
            else if (posY > listHeight - viewHeight)
            {
                int startIdx = GetStartIndex();
                for (int i = startIdx; i <= dataNum; i++)
                {
                    disY += GetCardSize(i).y + spacing;
                }

                offset = disY - viewHeight + posY - (listHeight - viewHeight);

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
                listAnchoredPosBuffer.x = scrollList.anchoredPosition.x;
                listAnchoredPosBuffer.y = offset;
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

        if (!curCards.ContainsKey(dataIdx))
        {
            return;
        }

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
