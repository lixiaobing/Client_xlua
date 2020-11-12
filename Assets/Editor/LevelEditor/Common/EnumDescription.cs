#if UNITY_EDITOR
namespace hjcd.level
{
    public class EnumDescription : System.Attribute
    {
        private string m_strDescription;
        public EnumDescription(string strPrinterName)
        {
            m_strDescription = strPrinterName;
        }
        public string Description
        {
            get { return m_strDescription; }
        }
    }

}
#endif