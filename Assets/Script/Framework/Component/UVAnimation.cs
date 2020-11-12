using UnityEngine;

public class UVAnimation : MonoBehaviour
{
    public float uSpeed;
    public float vSpeed;
    public string property = "_MainTex";

    float startTime;
    Renderer rend;
    Material mat;

    void Start()
    {
        rend = GetComponent<Renderer>();
        mat = rend.material;
    }

    void OnEnable()
    {
        startTime = Time.time;
    }

    public void ReSet()
    {
        rend = GetComponent<Renderer>();
        mat = rend.material;
        startTime = Time.time;
    }

    // Update is called once per frame
    void Update()
    {
        if (rend != null)
        {
            float delta = Time.time - startTime;
            mat.SetTextureOffset(property, new Vector2(uSpeed * delta, vSpeed * delta));
        }
    }
}
