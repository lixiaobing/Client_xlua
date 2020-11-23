using UnityEngine;

namespace Battle
{
    public interface IViewEntity : IDispose
    {
        EntityType EntityType { get; }
    }
}