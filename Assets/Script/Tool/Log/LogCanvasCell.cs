using UnityEngine;
using UnityEngine.UI;

public class LogCanvasCell : MonoBehaviour
{
    Button button;
    Image background;

    LogCanvasData data;
    int sort;

    RectTransform parent;
    RectTransform box;

    private void Start()
    {
        parent = this.transform.parent.GetComponent<RectTransform>();
        box = this.GetComponent<RectTransform>();

        background = this.GetComponent<Image>();

        button = this.GetComponent<Button>();
        button.onClick.AddListener(OnButtonClick);
    }

    public void Refresh(LogCanvasData d, int i)
    {
        data = d;
        sort = i;

        background = this.GetComponent<Image>();
        background.color = sort%2==0 ? new Color32(62, 62, 62, 0) : new Color32(62, 62, 62, 200);

        Color txtColor;

        switch (data.type)
        {
            case LogType.Error:
                txtColor = Color.red;
                break;
            case LogType.Exception:
                txtColor = Color.blue;
                break;
            case LogType.Warning:
                txtColor = Color.yellow;
                break;
            case LogType.Assert:
                txtColor = Color.green;
                break;
            default:
                txtColor = Color.white;
                break;
        }

        Text content = this.transform.Find("Content").GetComponent<Text>();
        content.text = string.Format("[{0}] {1}", data.time, data.message);
        content.color = txtColor;
    }

    public void OnButtonClick()
    {
        LogCanvas.Instance.ShowDetail(data);
    }
}

public struct LogCanvasData
{
    public string time;
    public string message;
    public string stackTrace;
    public LogType type;
}