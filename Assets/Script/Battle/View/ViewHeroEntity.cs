namespace Battle
{
    public class ViewHeroEntity : IViewEntity
    {
        public EntityType EntityType => EntityType.Hero;

        public void Dispose()
        {
            throw new System.NotImplementedException();
        }
    }
}