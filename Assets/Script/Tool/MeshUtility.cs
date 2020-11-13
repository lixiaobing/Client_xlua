using UnityEngine;

public static class MeshUtility
{
    //画环形
    public static Mesh CreateRing(float radius, float width, int segments)
    {
        int ringVCount = segments * 2 + 2;

        float angle = 360 * Mathf.Deg2Rad;
        float curAngle = angle / 2;
        float deltaAngle = angle / segments;
        float outRadius = radius + width;

        Vector3[] ringVertices = new Vector3[ringVCount];

        for (int i = 0; i < ringVCount; i += 2)
        {
            float cos = Mathf.Cos(curAngle);
            float sin = Mathf.Sin(curAngle);

            var inPoint = new Vector3(cos * radius, 0, sin * radius);
            var outPoint = new Vector3(cos * outRadius, 0, sin * outRadius);

            ringVertices[i] = inPoint;
            ringVertices[i + 1] = outPoint;

            curAngle -= deltaAngle;
        }

        int ringTCount = segments * 6;
        int[] ringTriangles = new int[ringTCount];
        for (int i = 0, j = 0; i < ringTCount; i += 6, j += 2)
        {
            ringTriangles[i] = j;
            ringTriangles[i + 1] = j + 1;
            ringTriangles[i + 2] = j + 3;
            ringTriangles[i + 3] = j + 3;
            ringTriangles[i + 4] = j + 2;
            ringTriangles[i + 5] = j;
        }

        Vector2[] ringUvs = new Vector2[ringVCount];
        for (int i = 0; i < ringVCount; i++)
        {
            ringUvs[i] = new Vector2(ringVertices[i].x / outRadius / 2 + 0.5f, ringVertices[i].z / outRadius / 2 + 0.5f);
        }

        Mesh mesh = new Mesh();
        mesh.Clear();
        mesh.vertices = ringVertices;
        mesh.triangles = ringTriangles;
        mesh.uv = ringUvs;

        return mesh;
    }

    //画圆形
    public static Mesh CreateCircle(float radius, int segments)
    {
        int vertices_count = segments + 1;
        Vector3[] vertices = new Vector3[vertices_count];
        vertices[0] = Vector3.zero;
        float angledegree = 360.0f;
        float angleRad = Mathf.Deg2Rad * angledegree;
        float angleCur = angleRad;
        float angledelta = angleRad / segments;
        for (int i = 1; i < vertices_count; i++)
        {
            float cosa = Mathf.Cos(angleCur);
            float sina = Mathf.Sin(angleCur);

            vertices[i] = new Vector3(radius * cosa, 0, radius * sina);
            angleCur -= angledelta;
        }

        int triangle_count = segments * 3;
        int[] triangles = new int[triangle_count];
        for (int i = 0, vi = 1; i <= triangle_count - 1; i += 3, vi++)
        {
            triangles[i] = 0;
            triangles[i + 1] = vi;
            triangles[i + 2] = vi + 1;
        }
        triangles[triangle_count - 3] = 0;
        triangles[triangle_count - 2] = vertices_count - 1;
        triangles[triangle_count - 1] = 1;

        Vector2[] uvs = new Vector2[vertices_count];
        for (int i = 0; i < vertices_count; i++)
        {
            uvs[i] = new Vector2(vertices[i].x / radius / 2 + 0.5f, vertices[i].z / radius / 2 + 0.5f);
        }

        Mesh mesh = new Mesh();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uvs;

        return mesh;
    }

    //画矩形
    public static Mesh CreateRect(float width, float height, bool center = true)
    {
        float halfWidth = width / 2f;
        float halfHeight = height / 2f;

        Vector3[] vertices = new Vector3[4];
        if (center)
        {
            vertices[0] = new Vector3(-halfWidth, 0, -halfHeight);
            vertices[1] = new Vector3(-halfWidth, 0, halfHeight);
            vertices[2] = new Vector3(halfWidth, 0, halfHeight);
            vertices[3] = new Vector3(halfWidth, 0, -halfHeight);
        }
        else
        {
            vertices[0] = new Vector3(-halfWidth, 0, 0);
            vertices[1] = new Vector3(-halfWidth, 0, height);
            vertices[2] = new Vector3(halfWidth, 0, height);
            vertices[3] = new Vector3(halfWidth, 0, 0);
        }

        int[] triangles = new int[] { 0, 1, 2, 0, 2, 3 };
        Vector2[] uvs = new Vector2[] { new Vector2(0, 0), new Vector2(0, 1), new Vector2(1, 1), new Vector2(1, 0) };

        Mesh mesh = new Mesh();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uvs;

        return mesh;
    }

    //画矩形框
    public static Mesh CreateFrame(float width, float height, float borderWidth, bool center = true)
    {
        float halfWidth = width / 2f;
        float halfHeight = height / 2f;

        float outWidth = width + borderWidth * 2;
        float outHeight = height + borderWidth * 2;
        float halfOutWidth = outWidth / 2f;
        float halfOutHeight = outHeight / 2f;

        Vector3[] vertices = new Vector3[8];
        Vector2[] uvs = new Vector2[8];
        if (center)
        {
            vertices[0] = new Vector3(-halfWidth, 0, -halfHeight);
            vertices[1] = new Vector3(-halfWidth, 0, halfHeight);
            vertices[2] = new Vector3(halfWidth, 0, halfHeight);
            vertices[3] = new Vector3(halfWidth, 0, -halfHeight);

            vertices[4] = new Vector3(-halfOutWidth, 0, -halfOutHeight);
            vertices[5] = new Vector3(-halfOutWidth, 0, halfOutHeight);
            vertices[6] = new Vector3(halfOutWidth, 0, halfOutHeight);
            vertices[7] = new Vector3(halfOutWidth, 0, -halfOutHeight);

            for (var i = 0; i < vertices.Length; i++)
            {
                uvs[i] = new Vector2((vertices[i].x + halfOutWidth) / outWidth, (vertices[i].z + halfOutHeight) / outHeight);
            }
        }
        else
        {
            vertices[0] = new Vector3(-halfWidth, 0, 0);
            vertices[1] = new Vector3(-halfWidth, 0, height);
            vertices[2] = new Vector3(halfWidth, 0, height);
            vertices[3] = new Vector3(halfWidth, 0, 0);

            vertices[4] = new Vector3(-halfOutWidth, 0, -borderWidth);
            vertices[5] = new Vector3(-halfOutWidth, 0, outHeight - borderWidth);
            vertices[6] = new Vector3(halfOutWidth, 0, outHeight - borderWidth);
            vertices[7] = new Vector3(halfOutWidth, 0, -borderWidth);

            for (var i = 0; i < vertices.Length; i++)
            {
                uvs[i] = new Vector2((vertices[i].x + halfOutWidth) / outWidth, vertices[i].z / outHeight);
            }
        }

        int[] triangles = new int[] { 0, 4, 5, 0, 5, 1, 1, 5, 6, 1, 6, 2,
                                    2, 6, 7, 2, 7, 3, 3, 7, 4, 3, 4, 0};

        Mesh mesh = new Mesh();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uvs;

        return mesh;
    }

    //画扇形
    public static Mesh CreateSector(float radius, float angle, int segments)
    {
        Vector3 leftdir = Quaternion.AngleAxis(-angle / 2, Vector3.up) * Vector3.forward;
        Vector3 rightdir = Quaternion.AngleAxis(angle / 2, Vector3.up) * Vector3.forward;

        Vector3[] vertices = new Vector3[segments+2];
        vertices[0] = Vector3.zero;
        vertices[1] = leftdir * radius;

        float perAngle = angle/segments;

        int index = 2;
        for (int i = 1; i <= segments; i++)
        {
            Vector3 dir = Quaternion.AngleAxis(perAngle * i, Vector3.up) * leftdir;
            vertices[index] = dir * radius;
            index++;
        }

        int[] triangles = new int[segments*3];
        int tIndex = 0;
        for (int i = 0; i < segments; i++)
        {
            triangles[tIndex + 0] = 0;
            triangles[tIndex + 1] = i + 1;
            triangles[tIndex + 2] = i + 2;

            tIndex += 3;
        }

        float width = Vector3.Distance(vertices[1], vertices[vertices.Length-1]);
        float height = radius;

        Vector2[] uvs = new Vector2[vertices.Length];
        for (var i = 0; i < uvs.Length; i++)
        {
            uvs[i] = new Vector2((vertices[i].x+width/2)/width, vertices[i].z/height);
        }

        Mesh mesh = new Mesh();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uvs;

        return mesh;
    }

    //画扇形边框
    public static Mesh CreateSectorBorder(float radius, float angle, int segments, float borderWidth)
    {
        float ratio = Mathf.Sin(angle / 2 * Mathf.Deg2Rad);
        float cornerWidth = borderWidth / ratio;
        float outRadius = cornerWidth + radius + borderWidth;
        float perAngle = angle / segments;

        Vector3 leftdir = Quaternion.AngleAxis(-angle / 2, Vector3.up) * Vector3.forward;
        Vector3 rightdir = Quaternion.AngleAxis(angle / 2, Vector3.up) * Vector3.forward;

        Vector3 outCenter = new Vector3(0, 0, -cornerWidth);
        Vector3 inCenter = new Vector3(0, 0, 0);

        Vector3[] vertices = new Vector3[(segments + 2) * 2];

        int outIndex = 0;
        int innerIndex = segments + 2;

        vertices[outIndex] = outCenter;
        vertices[outIndex+1] = outCenter + leftdir * outRadius;
        outIndex += 2;

        vertices[innerIndex] = inCenter;
        vertices[innerIndex+1] = inCenter + leftdir * radius;
        innerIndex += 2;

        for (int i = 1; i <= segments; i++)
        {
            Vector3 dir = Quaternion.AngleAxis(perAngle * i, Vector3.up) * leftdir;

            vertices[outIndex] = outCenter + dir * outRadius;
            outIndex++;

            vertices[innerIndex] = inCenter + dir * radius;
            innerIndex++;
        }

        int[] triangles = new int[vertices.Length * 3];
        int index1 = 0;
        int index2 = segments + 2;
        for (int i = 0; i < vertices.Length; i++)
        {
            if (i < segments+2)
            {
                if (i == segments+1)
                {
                    triangles[i * 3 + 0] = index1;
                    triangles[i * 3 + 1] = 0;
                    triangles[i * 3 + 2] = index2;

                    index2 = -1;
                }
                else
                {
                    triangles[i * 3 + 0] = index1;
                    triangles[i * 3 + 1] = index1 + 1;
                    triangles[i * 3 + 2] = index2;
                }

                index1++;
                index2++;
            }
            else
            {
                if (i == vertices.Length-1)
                {
                    triangles[i * 3 + 0] = index1;
                    triangles[i * 3 + 1] = 0;
                    triangles[i * 3 + 2] = index2 + 1;
                }
                else
                {
                    triangles[i * 3 + 0] = index1;
                    triangles[i * 3 + 1] = index2 + 1;
                    triangles[i * 3 + 2] = index1 + 1;
                }

                index1++;
                index2++;
            }
        }

        float outWidth = Vector3.Distance(vertices[1], vertices[segments + 1]);
        float outHeight = outRadius;

        Vector2[] uvs = new Vector2[vertices.Length];
        for (var i = 0; i < uvs.Length; i++)
        {
            uvs[i] = new Vector2((vertices[i].x + outWidth / 2) / outWidth, (vertices[i].z) / outHeight);
        }

        Mesh mesh = new Mesh();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uvs;

        return mesh;
    }
}
