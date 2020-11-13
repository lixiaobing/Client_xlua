
using UnityEngine;

namespace Battle
{
    public class BattleManager : MonoBehaviour
    {
        private static BattleManager _instance;
        private GameObjectFactory _gameObjectFactory = new GameObjectFactory();

        private void Awake()
        {
            if (_instance != null)
            {
                Debug.LogError("多个{BattleManager}");
                return;
            }
            _instance = this;
        }

        private void OnDestroy()
        {
            _gameObjectFactory.Dispose();
            _gameObjectFactory = null;
            _instance = null;
        }
        
        public static void AddGameObjectPool(string key, GameObject prefab, Transform activeParent=null, Transform inactiveParent=null)
        {
            _instance._gameObjectFactory.AddPool(key, prefab, activeParent, inactiveParent);
        }

        public static void RemoveGameObjectPool(string key)
        {
            _instance._gameObjectFactory.RemovePool(key);
        }

        private static GameObject NewGameObject(string key)
        {
            return _instance._gameObjectFactory.New(key);
        }
        
        private static void DeleteGameObject(string key, GameObject obj)
        {
            _instance._gameObjectFactory.Delete(key, obj);
        }
    }
}