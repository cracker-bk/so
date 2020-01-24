using Model;

namespace BLL
{
    public class wTouGBLL
    {
        /// <summary>
        /// 保存用户投过的项目
        /// </summary>
        /// <param name="wfq"></param>
        /// <returns>bool</returns>
        public static bool InsertWTG(wTouG wtg)
        {
            return DAL.wTouGDAL.InsertWTG(wtg);
        }
    }
}
