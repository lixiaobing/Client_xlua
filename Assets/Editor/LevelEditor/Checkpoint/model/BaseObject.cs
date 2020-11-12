using System.Text;
using UnityEditor;
using UnityEngine;

namespace hjcd.level.CheckPoint
{
    public class BaseObject {

        [System.Xml.Serialization.XmlIgnore]
        public GameObject gameObject;
        [System.Xml.Serialization.XmlIgnore]
        private BaseObject parent;
        public GameObject GetGameObject()
        {
            return this.gameObject;
        }

        [System.Xml.Serialization.XmlIgnore]
        public BaseObject Parent
        {
            get { return parent; }
            set { parent = value; }
        }



    }
}