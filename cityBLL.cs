using DAL;
using Model;
using System.Collections.Generic;
using System.Data;

namespace BLL
{
    public class cityBLL
    {
        /// <summary>
        /// 根据省份id来查城市
        /// </summary>
        /// <param name="id"></param>
        /// <returns>DataTable</returns>
        public static DataTable SelectCityNameByID(int id)
        {
            return cityDAL.SelectCityNameByID(id);
        }
    }
}
