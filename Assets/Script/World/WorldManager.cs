using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace World
{
    public class WorldManager:MonoBehaviour
    {
        public GameObject mainActor;

        public static WorldManager Instance
        {
            get;
            protected set;
        }

        private void Awake()
        {
            Instance = this;
        }

        public void Create(string sName)
        {

        }
    }
}
