using UnityEditor;
using UnityEngine;

[ExecuteInEditMode]
public class BulletScreenSetBall:MonoBehaviour
{
    Vector3 direction;
    float allLength;
    float speed;
    public bool isEnd = false;

    private void Awake()
    {

    }

    public void Shoot(Vector3 direc, float length, float sp)
    {
        this.transform.localPosition = Vector3.zero;
        direction = direc;
        allLength = length;
        speed = sp;
    }

    void Update()
    {
        if (isEnd) return;

        var delta = direction * Time.deltaTime * speed;
        var len = Vector3.Distance(delta, Vector3.zero);

        this.transform.Translate(delta);

        allLength -= len;

        if (allLength<=0)
        {
            isEnd = true;
            this.gameObject.SetActive(false);
        }
    }
}