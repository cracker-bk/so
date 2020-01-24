using DAL;
using Model;
using System.Collections.Generic;
using System.Data;

namespace BLL
{
    public class districtBLL
    {
        /// <summary>
        /// 根据城市id来查县级行政单位
        /// </summary>
        /// <param name="id"></param>
        /// <returns>DataTable</returns>
        public static DataTable SelectDistrictNameByCityID(int id)
        {
            return districtDAL.SelectDistrictNameByCityID(id);
        }
    }
}
