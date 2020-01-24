using Model;
using DAL;
namespace BLL
{
    public class wFaQBLL
    {
        /// <summary>
        /// 保存用户发起的项目
        /// </summary>
        /// <param name="wfq"></param>
        /// <returns>bool</returns>
        public static bool InsertWFaQ(wFaQ wfq)
        {
            return wFaQDAL.InsertWFaQ(wfq);
        }
    }
}
