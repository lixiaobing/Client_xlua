using System.Collections.Generic;
using System.IO;
using System.Reflection;
using UnityEditor;
using UnityEditor.Rendering;
using UnityEngine;
using UnityEngine.Rendering;

namespace Framework
{


    [CustomEditor(typeof(PackagerSet))]
    public class PackagerSetEditor : Editor
    {
        PackagerSet asset;

        void OnEnable()
        {
            asset = target as PackagerSet;
        }

        public override void OnInspectorGUI()
        {
            GUI.skin.font = CustomEditorStyles.font;

            GUILayout.Space(10);

            EditShaderVariant();

            GUILayout.Space(10);

            EditorUtility.SetDirty(asset);
        }

        void EditShaderVariant()
        {
            GUILayout.Label("Package Setting", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            asset.version = EditorGUILayout.TextField("Version", asset.version);

            GUILayout.Space(15);
            GUILayout.Label("Shader Variant List", CustomEditorStyles.titleLabel);
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(EditorStyles.helpBox);
            GUILayout.Space(5);
            foreach (ShaderVariantLink link in asset.setList)
            {
                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("—", GUILayout.Width(30), GUILayout.Height(32)))
                {
                    asset.setList.Remove(link);
                    SetPreloadShaders();
                    break;
                }
                EditorGUILayout.BeginVertical();
                link.shaderFile = (Shader)EditorGUILayout.ObjectField("Shader", link.shaderFile, typeof(Shader), false);
                link.variantFile = (ShaderVariantCollection)EditorGUILayout.ObjectField("Variants", link.variantFile, typeof(ShaderVariantCollection), false);
                EditorGUILayout.EndVertical();
                if (link.shaderFile && link.variantFile == null)
                {
                    if (GUILayout.Button("Create", GUILayout.Width(58), GUILayout.Height(32)))
                    {
                        string[] splits = link.shaderFile.name.Split('/');
                        string tureName = splits[splits.Length - 1];
                        string fileName = tureName + "Variants";
                        string assetPath = EditorUtility.SaveFilePanelInProject("Save " + link.shaderFile.name + " Variant Collection", fileName, "shadervariants", "Create NewShaderVariants");

                        if (!string.IsNullOrEmpty(assetPath))
                        {
                            MethodInfo saveFile = typeof(ShaderUtil).GetMethod("SaveCurrentShaderVariantCollection", BindingFlags.NonPublic | BindingFlags.Static);
                            object[] args = new object[] { assetPath };
                            saveFile.Invoke(null, args);

                            link.variantFile = AssetDatabase.LoadAssetAtPath<ShaderVariantCollection>(assetPath);
                            SetPreloadShaders();
                        }
                    }
                }

                EditorGUILayout.EndHorizontal();
            }
            GUILayout.Space(5);
            EditorGUILayout.EndVertical();
            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button("Add"))
            {
                asset.setList.Add(new ShaderVariantLink());
                SetPreloadShaders();
            }
            if (GUILayout.Button("Generate"))
            {
                GenerateShaderVariants();
                SetPreloadShaders();
            }
            EditorGUILayout.EndHorizontal();

            GUILayout.Space(10);
        }

        void SetPreloadShaders()
        {
            SerializedObject graphicsSettings = new SerializedObject(AssetDatabase.LoadAllAssetsAtPath("ProjectSettings/GraphicsSettings.asset")[0]);
            SerializedProperty m_PreloadedShaders = graphicsSettings.FindProperty("m_PreloadedShaders");
            m_PreloadedShaders.isExpanded = true;
            m_PreloadedShaders.ClearArray();

            for (var i = 0; i < asset.setList.Count; i++)
            {
                ShaderVariantLink link = asset.setList[i];
                if (link.variantFile)
                {
                    m_PreloadedShaders.InsertArrayElementAtIndex(i);
                    SerializedProperty data = m_PreloadedShaders.GetArrayElementAtIndex(i);
                    data.objectReferenceValue = asset.setList[i].variantFile;
                }
            }

            //Debug.LogError(m_PreloadedShaders.arraySize);

            graphicsSettings.ApplyModifiedProperties();
        }

        public static void GenerateShaderVariants()
        {
            PackagerSet pgs = Resources.Load<PackagerSet>("PackagerSet");

            foreach (var svl in pgs.setList)
            {
                svl.variantFile.Clear();
            }

            List<string> matPaths = new List<string>();
            List<Material> matList = new List<Material>();

            matPaths.AddRange(Directory.GetFiles("Assets/ResourcesWork", "*.mat", SearchOption.AllDirectories));
            for (int i = 0; i < matPaths.Count; i++)
            {
                Material mat = AssetDatabase.LoadAssetAtPath<Material>(matPaths[i]);
                EditorUtility.DisplayProgressBar("Generate Shader Variants", mat.name, i / matPaths.Count);
                //Debug.Log(matPaths[i]);
                for (int j = 0; j < pgs.setList.Count; j++)
                {
                    ShaderVariantLink link = pgs.setList[j];
                    if (link.shaderFile == mat.shader)
                    {
                        ShaderVariantCollection.ShaderVariant sv = new ShaderVariantCollection.ShaderVariant
                        {
                            shader = link.shaderFile,
                            keywords = mat.shaderKeywords,
                            passType = PassType.Normal
                        };
                        if (!link.variantFile.Contains(sv))
                            link.variantFile.Add(sv);
                    }
                }
            }

            EditorUtility.ClearProgressBar();

            EditorUtility.SetDirty(pgs);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }
    }
}