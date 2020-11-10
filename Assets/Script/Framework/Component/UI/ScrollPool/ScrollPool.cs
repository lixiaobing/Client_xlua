using System;
using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;

public class ScrollPool : MonoBehaviour
{
	[Serializable]
	public struct Padding
	{
		public float left;
		public float right;
		public float top;
		public float bottom;
	}

	//配置参数
	public ScrollRect scrollRect;
	public RectTransform scrollList;
	public GameObject prefab;

	public Padding padding;

	[NonSerialized] public Vector2 cardSize;

	[HideInInspector] [SerializeField] public bool cellAnimEnable = false;
	[HideInInspector] [SerializeField] public string cellAnimTarget = "";

	[HideInInspector] public bool keepPrefab = true;
	[HideInInspector] public bool isLoop;

	//内部参数
	protected List<ScrollPoolObj> pool = new List<ScrollPoolObj>();
	protected Dictionary<int, ScrollPoolObj> curCards = new Dictionary<int, ScrollPoolObj>();
	protected Dictionary<int, Vector2> curSize = new Dictionary<int, Vector2>();
	protected Dictionary<int, int> viewIdx2DataIdx = new Dictionary<int, int>();
	protected Dictionary<int, int> viewIdx2DataIdxBuffer = new Dictionary<int, int>();
	protected Vector2 listAnchoredPosBuffer;
	protected List<int> buffer = new List<int>();
	protected ScrollRectHelper srHelper;

	protected int curStartIndex = 1;
	protected int curEndIndex = 1;

	protected int userTargetIndex;
	protected int dataNum;

	protected int poolSize;

	private bool readyBase = false;
	private bool readyStart = false;
	private bool readyData = false;

	protected System.Action<int, GameObject> userInitFunc;
	protected System.Action userInitFinishCb;
	protected System.Action<int> userSizeChangeCb;

	void OnEnable()
	{
		if (!readyBase)
		{
			StartCoroutine(InitBase());
		}
	}

	void OnDisable()
	{
		if (readyBase && !readyStart)
		{
			readyBase = false;
		}
	}

	public void OnInitFinish(System.Action callback)
	{
		userInitFinishCb = callback;
	}

	public void OnSizeChanged(System.Action<int> callback)
	{
		userSizeChangeCb = callback;
	}

	public void InitPool(int objNum, System.Action<int, GameObject> initFunc)
	{
		InitPool(objNum, initFunc, 0);
	}

	public void InitPool(int objNum, System.Action<int, GameObject> initFunc, int targetIndex)
	{
		ReleaseAllCard();
		dataNum = objNum;
		userInitFunc = initFunc;
		userTargetIndex = targetIndex;

		readyData = true;
		if (!readyBase)
		{
			if (gameObject.activeInHierarchy)
			{
				StartCoroutine(InitBase());
			}
		}
		else
		{
			DoInit();
		}
	}

	public void ReloadConfig()
	{
		readyBase = false;

		if (scrollRect)
		{
			scrollRect.onValueChanged.RemoveListener(OnScrollHandler);
		}
	}

	private void DoInit()
	{
		if (!CheckReady())
		{
			return;
		}

		if (isLoop)
		{
			ResetPadding();
		}

		poolSize = GetMaxPoolSize();
		InitListSize(dataNum);
		SetListAtIndex(userTargetIndex);
		InitRangeIndex();

		for (int i = curStartIndex; i <= curEndIndex; i++)
		{
			InitCard(i);
		}

		if (scrollRect)
		{
			scrollRect.onValueChanged.RemoveListener(OnScrollHandler);
			scrollRect.onValueChanged.AddListener(OnScrollHandler);
		}
		else
		{
			Debug.LogError("Can not find componenet <ScrollRect> in gameObject 'scrollRect'");
		}

		if (userInitFinishCb != null)
		{
			userInitFinishCb();
		}
	}

	private bool CheckReady()
	{
		return readyBase && readyStart && readyData;
	}

	protected virtual void SetListPivot()
	{
	}

	protected virtual void ResetPadding()
	{
	}

	public void SetListAtIndex(int index)
	{
		if (index == 0)
		{
			return;
		}

		Vector2 targetPos = GetTargetPos(index);

		scrollList.anchoredPosition = targetPos;
	}

	protected virtual Vector2 GetTargetPos(int index)
	{
		return new Vector2(0, 0);
	}

	public virtual void InitListSize(int num)
	{
	}

	protected void InitRangeIndex()
	{
		curStartIndex = GetStartIndex();
		curEndIndex = GetEndIndex();
	}

	ScrollPoolObj GetCard()
	{
		if (pool.Count > 0)
		{
			// Debug.LogError("get from pool");
			ScrollPoolObj cacheCard = pool[0];
			pool.RemoveAt(0);
			return cacheCard;
		}
		else
		{
			// Debug.LogWarningFormat("new instance");
			GameObject newCard = GameObject.Instantiate(prefab);
			if (!newCard.gameObject.activeSelf)
			{
				newCard.SetActive(true);
			}

			newCard.transform.SetParent(scrollList, false);
			ScrollPoolObj scrollPoolObj = newCard.GetComponent<ScrollPoolObj>();
			scrollPoolObj.BindScrollPool(this);
			return scrollPoolObj;
		}
	}

	void ReleaseCard(int dataIdx)
	{
		// Debug.LogError("release card dataIdx:" + dataIdx);
		if (curCards.ContainsKey(dataIdx))
		{
			curCards[dataIdx].canvasGroup.alpha = .0f;
			curCards[dataIdx].canvasGroup.blocksRaycasts = false;
			curCards[dataIdx].name = "objCached";
			curCards[dataIdx].ResetIdx(-1);

			if (cellAnimEnable)
			{
				curCards[dataIdx].ResetAnimtor(cellAnimTarget);
			}

			// Debug.LogError("retrun to pool");
			pool.Add(curCards[dataIdx]);
			curCards.Remove(dataIdx);
		}
	}

	void ReleaseAllCard()
	{
		buffer.Clear();
		foreach (var key in curCards.Keys)
		{
			buffer.Add(key);
		}

		buffer.Sort();
		for (int i = 0; i < buffer.Count; i++)
		{
			ReleaseCard(buffer[i]);
		}
	}

	protected virtual int GetStartIndex()
	{
		return 1;
	}

	protected virtual int GetEndIndex()
	{
		return dataNum;
	}

	protected virtual int GetStartIndexLimit()
	{
		if (dataNum > poolSize)
		{
			return dataNum - poolSize + 1;
		}
		else
		{
			return 1;
		}
	}

	public void GetCurViewRange(out int start, out int end)
	{
		start = GetStartIndex();
		end = GetEndIndex();
	}

	void OnScrollHandler(Vector2 vec)
	{
		RefreshPool();
		CheckListRePosition();
		RefreshAnim();
	}

	protected virtual void CheckListRePosition()
	{
	}

	protected void DoListReposition(bool reverse)
	{
		int preStartIdx = GetStartIndex();
		int preEndIdx = GetEndIndex();

		// Debug.LogError("viewidx2DataidxStart:"+viewIdx2DataIdx[1]);
		// Debug.LogError("viewidx2DataidxEnd:"+viewIdx2DataIdx[10]);
		// Debug.LogError("preStartIdx:"+preStartIdx);
		// Debug.LogError("preEndIdx:"+preEndIdx);

		scrollList.anchoredPosition = listAnchoredPosBuffer;
		PointerEventData pData = srHelper.pDataOnDrag;
		pData.position = Input.mousePosition;
		Vector2 velocity = scrollRect.velocity;
		scrollRect.OnBeginDrag(pData);
		if (!Input.GetMouseButton(0))
		{
			scrollRect.OnEndDrag(pData);
		}

		scrollRect.velocity = velocity;

		if (reverse)
		{
			curStartIndex = dataNum - (preEndIdx - preStartIdx);
			curEndIndex = dataNum;
		}
		else
		{
			curStartIndex = 1;
			curEndIndex = 1 + preEndIdx - preStartIdx;
		}

		for (int i = curStartIndex; i <= curEndIndex; i++)
		{
			InitCard(i);
		}

		DoRefreshPool();
		RefreshAnim();
	}

	protected virtual void RefreshPool()
	{
		if (dataNum > poolSize)
		{
			DoRefreshPool();
		}
	}

	void RefreshAnim()
	{
		if (!cellAnimEnable)
		{
			return;
		}
		int startIndex = GetStartIndex();
		int endIndex = GetEndIndex();

		for (int i = startIndex; i <= endIndex; i++)
		{
			int dataIdx = GetDataIdxByViewIdx(i);
			if (curCards.ContainsKey(dataIdx))
			{
				InitCardAnim(curCards[dataIdx]);
			}
		}
	}

	protected void DoRefreshPool()
	{
		int startIndex = GetStartIndex();
		int endIndex = GetEndIndex();
		// Debug.LogErrorFormat("startIndex->{0}, endIndex->{1}", startIndex, endIndex);

		int maxDeltaAdd = endIndex - startIndex + 1;
		int maxDeltaDel = curEndIndex - curStartIndex + 1;

		if (startIndex < curStartIndex)
		{
			int deltaAdd = curStartIndex - startIndex;
			int deltaDel = curEndIndex - endIndex;

			for (int i = 0; i < deltaDel; i++)
			{
				if (i < maxDeltaDel)
				{
					ReleaseCard(GetDataIdxByViewIdx(curEndIndex));
				}

				curEndIndex--;
			}

			for (int i = 0; i < deltaAdd; i++)
			{
				curStartIndex--;

				if (curStartIndex - startIndex < maxDeltaAdd)
				{
					InitCard(curStartIndex);
					curCards[GetDataIdxByViewIdx(curStartIndex)].transform.SetAsFirstSibling();
				}
			}
		}
		else if (startIndex > curStartIndex)
		{
			int deltaAdd = endIndex - curEndIndex;
			int deltaDel = startIndex - curStartIndex;

			for (int i = 0; i < deltaDel; i++)
			{
				if (i < maxDeltaDel)
				{
					ReleaseCard(GetDataIdxByViewIdx(curStartIndex));
				}

				curStartIndex++;
			}

			for (int i = 0; i < Mathf.Min(deltaAdd, maxDeltaAdd); i++)
			{
				curEndIndex++;

				if (endIndex - curEndIndex < maxDeltaAdd)
				{
					InitCard(curEndIndex);
					curCards[GetDataIdxByViewIdx(curEndIndex)].transform.SetAsLastSibling();
				}
			}
		}
		else
		{
			if (endIndex > curEndIndex)
			{
				int deltaAdd = endIndex - curEndIndex;
				for (int i = 0; i < deltaAdd; i++)
				{
					curEndIndex++;

					InitCard(curEndIndex);
					curCards[GetDataIdxByViewIdx(curEndIndex)].transform.SetAsLastSibling();
				}
			}
			else if (endIndex < curEndIndex)
			{
				int deltaDel = curEndIndex - endIndex;
				for (int i = 0; i < deltaDel; i++)
				{
					ReleaseCard(GetDataIdxByViewIdx(curEndIndex));
					curEndIndex--;
				}
			}
		}
	}

	protected void InitCard(int index)
	{
		int dataIdx = GetDataIdxByViewIdx(index);
		// Debug.LogError("init card idx:" + index);
		// Debug.LogError("init card dataIdx:" + dataIdx);
		if (!curCards.ContainsKey(dataIdx))
		{
			curCards[dataIdx] = GetCard();
		}

		ScrollPoolObj scrollPoolObj = curCards[dataIdx].GetComponent<ScrollPoolObj>();
		scrollPoolObj.ResetIdx(index);

		InitCardName(dataIdx, curCards[dataIdx].gameObject);
		InitCardPos(index, curCards[dataIdx].gameObject);
		InitCardAnim(scrollPoolObj);

		userInitFunc(dataIdx, curCards[dataIdx].gameObject);

		curCards[dataIdx].canvasGroup.alpha = 1.0f;
		curCards[dataIdx].canvasGroup.blocksRaycasts = true;
	}

	protected int GetDataIdxByViewIdx(int viewIdx)
	{
		if (viewIdx2DataIdx.ContainsKey(viewIdx))
		{
			return viewIdx2DataIdx[viewIdx];
		}

		return viewIdx;
	}

	protected virtual void InitCardName(int index, GameObject card)
	{
	}

	protected virtual void InitCardPos(int index, GameObject card)
	{
	}

	private void InitCardAnim(ScrollPoolObj spObj)
	{
		if (!cellAnimEnable)
		{
			return;
		}

		float progress = GetNormalizedPos(spObj);
		spObj.SetAnimationProgress(cellAnimTarget, progress);
	}

	protected virtual float GetNormalizedPos(ScrollPoolObj spObj)
	{
		return 1;
	}

	protected virtual int GetMaxPoolSize()
	{
		return 1;
	}

	protected Vector2 GetCardSize(int idx)
	{
		int dataIdx = GetDataIdxByViewIdx(idx);
		if (curSize.ContainsKey(dataIdx))
		{
			return curSize[dataIdx];
		}
		else
		{
			return cardSize;
		}
	}

	public virtual void OnObjSizeChanged(int idx)
	{
		RefreshAnim();
		if (userSizeChangeCb != null)
		{
			userSizeChangeCb(GetDataIdxByViewIdx(idx));
		}
	}

	public void SetPadding(int left, int right, int top, int bottom)
	{
		padding.left = left;
		padding.right = right;
		padding.top = top;
		padding.bottom = bottom;
	}

	IEnumerator InitBase()
	{
		if (scrollRect == null || scrollList == null || prefab == null)
		{
			yield break;
		}

		readyBase = true;
		SetListPivot();
		InitListSize(0);
		SetListAtIndex(1);
		yield return new WaitForEndOfFrame();

		RectTransform rect = prefab.GetComponent<RectTransform>();

		prefab.SetActive(true);
		CanvasGroup group = prefab.GetComponent<CanvasGroup>();
		if (group == null)
			group = prefab.AddComponent<CanvasGroup>();
		group.alpha = .0f;
		group.blocksRaycasts = false;

		ScrollRectHelper srHelper = scrollRect.GetComponent<ScrollRectHelper>();
		if (srHelper == null)
		{
			srHelper = scrollRect.gameObject.AddComponent<ScrollRectHelper>();
		}

		this.srHelper = srHelper;


		ScrollPoolObj sobj = prefab.GetComponent<ScrollPoolObj>();
		if (sobj == null)
		{
			sobj = prefab.AddComponent<ScrollPoolObj>();
		}


		cardSize = new Vector2(rect.rect.width, rect.rect.height);
		rect.anchorMin = new Vector2(0, 1);
		rect.anchorMax = new Vector2(0, 1);

		rect.sizeDelta = cardSize;

		rect.pivot = new Vector2(0, 1);

		if (!keepPrefab && !readyStart)
		{
			pool.Add(sobj);
			prefab.transform.SetParent(scrollList, false);
		}

		readyStart = true;

		sobj.BindScrollPool(this);
		DoInit();
	}

    public void ReloadCurCards()
    {
        foreach (KeyValuePair<int, ScrollPoolObj> kv in curCards)
        {
            userInitFunc(kv.Key, kv.Value.gameObject);
        }
    }
}