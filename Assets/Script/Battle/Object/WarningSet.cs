
using System;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "WarningSet Name", menuName = "X-Create WarningSet")]
[System.Serializable]
public class WarningSet:ScriptableObject
{
    public WarningSetType type;

    public Material surfaceMaterial;
    public Material borderMaterial;
    public float borderWidth = 0.1f;

    public Vector3 position;

    public Vector3 size;

    public float radius;

    public float angle;

    public float rotateAngle;

    public int segments = 20;

    private GameObject meshObject;
    private GameObject borderObject;

    public void DrawTransform(Transform parent)
    {
        var pos = new Vector3(position.x, position.y + 0.02f, position.z);
        var direc = Quaternion.AngleAxis(rotateAngle, Vector3.up);

        Draw(parent, pos, direc);
    }

    public void DrawGlobal (Vector3 position)
    {
        Draw(null, position, Quaternion.Euler(Vector3.zero));
    }

    private void Draw(Transform parent, Vector3 pos, Quaternion direc)
    {
        meshObject = new GameObject();
        meshObject.name = "WarningSurface";
        if (parent)
        {
            meshObject.transform.parent = parent;
        }
        meshObject.transform.localPosition = pos;
        meshObject.transform.localRotation = direc;

        borderObject = new GameObject();
        borderObject.name = "WarningBorder";
        if (parent)
        {
            borderObject.transform.parent = parent;
        }
        borderObject.transform.localPosition = pos;
        borderObject.transform.localRotation = direc;

        var surfaceMeshFilter = meshObject.AddComponent<MeshFilter>();
        var surfaceMeshRenderer = meshObject.AddComponent<MeshRenderer>();
        surfaceMeshRenderer.material = surfaceMaterial;

        var borderMeshFilter = borderObject.AddComponent<MeshFilter>();
        var borderMeshRenderer = borderObject.AddComponent<MeshRenderer>();
        borderMeshRenderer.material = borderMaterial;

        if (type == WarningSetType.Range)
        {
            surfaceMeshFilter.sharedMesh = MeshUtility.CreateCircle(radius, segments);
            borderMeshFilter.sharedMesh = MeshUtility.CreateRing(radius, borderWidth, segments);
        }
        else if (type == WarningSetType.Rect)
        {
            surfaceMeshFilter.sharedMesh = MeshUtility.CreateRect(size.x, size.z, false);
            borderMeshFilter.sharedMesh = MeshUtility.CreateFrame(size.x, size.z, borderWidth, false);
        }
        else if (type == WarningSetType.Sector)
        {
            surfaceMeshFilter.sharedMesh = MeshUtility.CreateSector(radius, angle, segments);
            borderMeshFilter.sharedMesh = MeshUtility.CreateSectorBorder(radius, angle, segments, borderWidth);
        }
    }

    public void SetProgress(float progress)
    {
        surfaceMaterial.SetFloat("_Range", progress);
        borderMaterial.SetFloat("_Range", progress);
    }

    public void Clear()
    {
        if (meshObject)
        {
            GameObject.Destroy(meshObject);
            meshObject = null;
            GameObject.Destroy(borderObject);
            borderObject = null;
        }
    }
}

public enum WarningSetType
{
    None = 0,
    Range = 1,
    Rect = 2,
    Sector = 3
}