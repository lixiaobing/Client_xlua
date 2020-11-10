using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public enum Axis
{
    Horizontal = 1,
    Vertical = 2,
}

public class ScrollPoolGrid : ScrollPool
{
    [HideInInspector] public Vector2 spacing;
    [HideInInspector] public Axis startAxis = Axis.Horizontal;

    private int column;
    private int row;

    private float listWidth;
    private float listHeight;
    private float viewWidth;
    private float viewHeight;

    protected override void ResetPadding()
    {
        if (startAxis == Axis.Horizontal)
        {
            padding.top = 0;
            padding.bottom = spacing.y;
        }
        else if (startAxis == Axis.Vertical)
        {
            padding.left = 0;
            padding.right = spacing.x;
        }
    }

    protected override void SetListPivot()
    {
        if (startAxis == Axis.Horizontal)
        {
            scrollList.pivot = new Vector2(scrollList.pivot.x, 1);
            scrollList.anchorMin = new Vector2(scrollList.anchorMin.x, 1);
            scrollList.anchorMax = new Vector2(scrollList.anchorMax.x, 1);
        }
        else if (startAxis == Axis.Vertical)
        {
            scrollList.pivot = new Vector2(0, scrollList.pivot.y);
            scrollList.anchorMin = new Vector2(0, scrollList.anchorMin.y);
            scrollList.anchorMax = new Vector2(0, scrollList.anchorMax.y);
        }
    }

    protected override int GetMaxPoolSize()
    {
        int poolSize = 0;
        Rect scrollRectArea = scrollRect.GetComponent<RectTransform>().rect;

        if (startAxis == Axis.Horizontal)
        {
            viewWidth = scrollList.rect.width;
            viewHeight = scrollRectArea.height;

            column = Mathf.FloorToInt((viewWidth - padding.left - padding.right - cardSize.x) / (cardSize.x + spacing.x)) + 1;
            float remaindHeight = viewHeight % (spacing.y + cardSize.y);
            int maxViewRow = (int)(viewHeight / (spacing.y + cardSize.y));
            if (remaindHeight > spacing.y)
            {
                maxViewRow += 2;
            }
            else
            {
                maxViewRow += 1;
            }

            row = maxViewRow;
        }
        else if (startAxis == Axis.Vertical)
        {
            viewWidth = scrollRectArea.width;
            viewHeight = scrollList.rect.height;

            row = Mathf.FloorToInt((viewHeight - padding.top - padding.bottom - cardSize.y) / (cardSize.y + spacing.y)) + 1;
            float remaindWidth = viewWidth % (spacing.x + cardSize.x);
            int maxViewColumn = (int)(viewWidth / (spacing.x + cardSize.x));
            if (remaindWidth > spacing.x)
            {
                maxViewColumn += 2;
            }
            else
            {
                maxViewColumn += 1;
            }

            column = maxViewColumn;
        }

        poolSize = column * row;

        return poolSize;
    }

    public override void InitListSize(int num)
    {
        if (startAxis == Axis.Horizontal)
        {
            row = Mathf.CeilToInt((float)num / column);
            float height = padding.top + row * cardSize.y + (row - 1) * spacing.y + padding.bottom;
            listHeight = num > 0 ? height : 0;
            listWidth = scrollList.rect.width;
            scrollList.sizeDelta = new Vector2(scrollList.sizeDelta.x, listHeight);
        }
        else if (startAxis == Axis.Vertical)
        {
            column = Mathf.CeilToInt((float)num / row);
            float width = padding.left + column * cardSize.x + (column - 1) * spacing.x + padding.right;
            listWidth = num > 0 ? width : 0;
            listHeight = scrollList.rect.height;
            scrollList.sizeDelta = new Vector2(listWidth, scrollList.sizeDelta.y);
        }
    }

    protected override int GetStartIndex()
    {
        int startIndex = 1;
        if (startAxis == Axis.Horizontal)
        {
            float posY = scrollList.anchoredPosition.y;
            float disY;
            if (posY < 0)
            {
                posY = 0;
            }
            disY = Mathf.Abs(posY);
            if (disY >= cardSize.y + padding.top)
            {
                int target_row = Mathf.FloorToInt((disY - padding.top - cardSize.y) / (cardSize.y + spacing.y)) + 1;
                startIndex = target_row * column + 1;
            }
            else
            {
                startIndex = 1;
            }
        }
        else if (startAxis == Axis.Vertical)
        {
            float posX = scrollList.anchoredPosition.x;
            float disX;
            if (posX > 0)
            {
                posX = 0;
            }
            disX = Mathf.Abs(posX);
            if (disX >= cardSize.x + padding.left)
            {
                int target_column = Mathf.FloorToInt((disX - padding.left - cardSize.x) / (cardSize.x + spacing.x)) + 1;
                startIndex = target_column * row + 1;
            }
            else
            {
                startIndex = 1;
            }
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

    protected override int GetEndIndex()
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

    protected override void InitCardName(int index, GameObject card)
    {
        int targetRow = 1;
        int targetColumn = 1;

        if (startAxis == Axis.Horizontal)
        {
            targetRow = Mathf.CeilToInt((float)index / column);
            targetColumn = index - (targetRow - 1) * column;
            card.name = string.Format("obj[{0}][{1}]", targetRow.ToString(), targetColumn.ToString());
        }
        else if (startAxis == Axis.Vertical)
        {
            targetColumn = Mathf.CeilToInt((float)index / row);
            targetRow = index - (targetColumn - 1) * row;
            card.name = string.Format("obj[{0}][{1}]", targetColumn.ToString(), targetRow.ToString());
        }
    }

    protected override void InitCardPos(int index, GameObject card)
    {
        int targetRow = 1;
        int targetColumn = 1;

        if (startAxis == Axis.Horizontal)
        {
            targetRow = Mathf.CeilToInt((float)index / column);
            targetColumn = index - (targetRow - 1) * column;
        }
        else if (startAxis == Axis.Vertical)
        {
            targetColumn = Mathf.CeilToInt((float)index / row);
            targetRow = index - (targetColumn - 1) * row;
        }

        float posX = padding.left + (targetColumn - 1) * (spacing.x + cardSize.x);
        float posY = padding.top + (targetRow - 1) * (spacing.y + cardSize.y);

        card.GetComponent<RectTransform>().anchoredPosition = new Vector2(posX, -posY);
    }

    protected override Vector2 GetTargetPos(int index)
    {
        float posX = 0;
        float posY = 0;

        if (startAxis == Axis.Horizontal)
        {
            posX = scrollList.anchoredPosition.x;

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
                    int targetRow = Mathf.CeilToInt((float)index / column);
                    posY = Mathf.Clamp(padding.top + (targetRow - 1) * (spacing.y + cardSize.y), 0, listHeight - viewHeight);
                }
            }
        }
        else if (startAxis == Axis.Vertical)
        {
            posY = scrollList.anchoredPosition.y;

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
                    int targetColumn = Mathf.CeilToInt((float)index / row);
                    posX = -(Mathf.Clamp(padding.left + (targetColumn - 1) * (spacing.x + cardSize.x), 0, listWidth - viewWidth));
                }
            }
        }

        return new Vector2(posX, posY);
    }

    #region GetNormalizedPos

    protected override float GetNormalizedPos(ScrollPoolObj spObj)
    {
        RectTransform rectTrans = spObj.GetComponent<RectTransform>();
        float distance = 1;
        float maxDistance = 1;
        if (startAxis == Axis.Horizontal)
        {
            float posY = scrollList.anchoredPosition.y;
            distance = Mathf.Abs(rectTrans.anchoredPosition.y) + rectTrans.rect.height / 2 - posY;
            maxDistance = viewHeight;
        }
        else if (startAxis == Axis.Vertical)
        {
            float posX = scrollList.anchoredPosition.x;
            distance = Mathf.Abs(rectTrans.anchoredPosition.x) + rectTrans.rect.width / 2 + posX;
            maxDistance = viewWidth;
        }

        return Mathf.Clamp(distance / maxDistance, 0, 1);
    }

    #endregion

    protected override void CheckListRePosition()
    {
        if (!isLoop)
        {
            return;
        }
        if (startAxis == Axis.Horizontal)
        {
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
                    int endRow = Mathf.CeilToInt((float)endIdx / column);
                    for (int i = 1; i <= endRow; i++)
                    {
                        disY += cardSize.y + spacing.y;
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
                    int startRow = Mathf.CeilToInt((float)startIdx / column);
                    for (int i = startRow; i <= row; i++)
                    {
                        disY += cardSize.y + spacing.y;
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
        else if (startAxis == Axis.Vertical)
        {
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
                    int endColumn = Mathf.CeilToInt((float)endIdx / row);
                    for (int i = 1; i <= endColumn; i++)
                    {
                        disX += cardSize.x + spacing.x;
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
                    int startColumn = Mathf.CeilToInt((float)startIdx / row);
                    for (int i = startColumn; i <= column; i++)
                    {
                        disX += cardSize.x + spacing.x;
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
    }

}
