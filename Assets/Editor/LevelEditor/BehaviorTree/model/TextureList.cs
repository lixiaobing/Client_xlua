using hjcd.level;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEditor;
using UnityEngine;
namespace hjcd.level
{

    //[System.Serializable]
    [CreateAssetMenu(fileName = "LevelEditorTextures", menuName = "Create LevelEditorTextures")]
    public class TextureList : ScriptableObject
    {
        public Texture2D textureRoot;
        public Texture2D textureAction;
        public Texture2D textureSelector;
        public Texture2D textureSequence;
        public Texture2D textureRandom;
        public Texture2D textureCondition;
        public Texture2D textureDecorators;
        public void SaveAssets()
        {
            EditorUtility.SetDirty(this);
            AssetDatabase.SaveAssets();
        }
    }
}