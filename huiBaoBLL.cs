using DAL;
using Model;
using System.Data;
namespace BLL
{
    public class huiBaoBLL
    {
        /// <summary>
        /// 根据用户id查回报
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataTable SelectHuiBao_Project_wTouGByUid(int id)
        {
            return huiBaoDAL.SelectHuiBao_Project_wTouGByUid(id);
        }
        /// <summary>
        /// 往回报表中添加数据
        /// </summary>
        /// <param name="hb"></param>
        /// <returns>bool</returns>
        public static bool InsertHuiBao(huiBao hb)
        {
            return huiBaoDAL.InsertHuiBao(hb);
        }
        /// <summary>
        /// 根据回报id来删除回报
        /// </summary>
        /// <param name="id"></param>
        /// <returns>bool</returns>
        public static bool DeleteHuiBao(int id)
        {
            return huiBaoDAL.DeleteHuiBao(id);
        }
    }
}
