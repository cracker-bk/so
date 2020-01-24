using System.Data;
using DAL;
namespace BLL
{
    public class provinceBLL
    {
        /// <summary>
        /// 查询省级行政单位
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable SelectProvince()
        {
            return provinceDAL.SelectProvince();
        }
    }
}
