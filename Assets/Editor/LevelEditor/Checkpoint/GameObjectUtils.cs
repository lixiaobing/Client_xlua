using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
namespace hjcd.level.CheckPoint
{

    public static class GameObjectUtils
    {
        //创建CUBE
        public static GameObject CreateCube() {
            return GameObject.CreatePrimitive(PrimitiveType.Cube);
        }
        //创建球体
        public static GameObject CreateSphere(){
            return GameObject.CreatePrimitive(PrimitiveType.Sphere);
        }

    }
}