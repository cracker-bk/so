using DAL;
using System.Data;
namespace BLL
{
    public class commonBLL
    {
        public static DataTable SelectMyZcmanInfo(string pid, string uid)
        {
            return commonDAL.SelectMyZcmanInfo(pid,uid);
        }
            public static DataTable SelectPID_UID(int uid)
        {
            return commonDAL.SelectPID_UID(uid);
        }
            /// <summary>
            /// 根据项目id来查评论
            /// </summary>
            /// <param name="id"></param>
            /// <returns></returns>
            public static DataTable SelectProjectAndComment(int id)
        {
            return commonDAL.SelectProjectAndComment(id);
        }
        /// <summary>
        /// 后台用来查看用户管理
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectHT_YHGL()
        {
            return commonDAL.SelectHT_YHGL();
        }
        /// <summary>
        /// 后台用来查看用户管理,模糊查询,状态
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectHT_YHGL_MH(string ziduan, string txtB)
        {
            return commonDAL.SelectHT_YHGL_MH(ziduan, txtB);
        }
        /// <summary>
        /// 根据手机号码删除用户信息
        /// </summary>
        /// <param name="phoneNum"></param>
        /// <returns></returns>
        public static bool DeleteHT_YHGL(string phoneNum)
        {
            return commonDAL.DeleteHT_YHGL(phoneNum);
        }
        /// <summary>
        /// 根据手机号码停用账号
        /// </summary>
        /// <param name="phoneNum"></param>
        /// <returns></returns>
        public static bool UpdateZT(string ZT, string phoneNum)
        {
            return commonDAL.UpdateZT(ZT, phoneNum);
        }
        /// <summary>
        /// 后台评论管理
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectComment()
        {
            return commonDAL.SelectComment();
        }
        public static DataTable SelectComment(string a, string b)
        {
            return commonDAL.SelectComment(a,b);
        }
        /// <summary>
        /// 评论管理--删除
        /// </summary>
        /// <param name="ctnID"></param>
        /// <returns></returns>
        public static bool DeleteComment(int ctnID)
        {
            return commonDAL.DeleteComment(ctnID);
        }
    }
}
