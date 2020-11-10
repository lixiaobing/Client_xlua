using UnityEngine;
using UnityEngine.UI;

public class UIBoot:MonoBehaviour
{
    Image bar1 = null;
    Image bar2 = null;
    RectTransform barRect = null;
    Text label = null;
    Text value = null;

    float barWidth;

    public static UIBoot Instance
    {
        get;
        set;
    }

    void Awake()
    {
        Instance = this;

        bar1 = this.transform.Find("Progress1/Bar1").GetComponent<Image>();
        bar2 = this.transform.Find("Progress2/Bar2").GetComponent<Image>();
        barRect = this.transform.Find("Progress1/Bar1").GetComponent<RectTransform>();
        label = this.transform.Find("Progress1/Label").GetComponent<Text>();
        value = this.transform.Find("Progress2/Value").GetComponent<Text>();

        barWidth = barRect.rect.width;
    }

    public void SetLabel(string content)
    {
        label.text = content;

    }

    public void SetProgress(float progress)
    {
        if (progress > 1)
        {
            progress = 1;
        }
        //GameLog.Log(progress);
        //value.text = string.Format("{0:F2}", progress*100)+"%";
        //Debug.Log(progress);

        value.text = Mathf.RoundToInt(progress * 100) + "%";

        bar1.fillAmount = progress;
        bar2.fillAmount = progress;
        GameTween.DOFillAmount(bar1, progress, 0.1f);
        GameTween.DOFillAmount(bar2, progress, 0.1f);
        //barRect.offsetMin = new Vector2(22, barRect.offsetMin.y);
        //barRect.offsetMax = new Vector2(-(barWidth - progress * barWidth)-22, -barRect.offsetMax.y);

        //GameLog.Log(progress);
    }

    void OnDestroy()
    {
        Instance = null;
    }
}