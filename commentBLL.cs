using DAL;
using Model;
using System.Data;

namespace BLL
{
    public class commentBLL
    {
        /// <summary>
        /// 根据用户id和项目id来查评论
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataTable SelectCommentAllByID(int uid, int pid)
        {
            return commentDAL.SelectCommentAllByID(uid, pid);
        }
        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="cls"></param>
        /// <param name="intPC">总页数</param>
        /// <param name="intRC">总记录数</param>
        /// <param name="pageNow">当前页码</param>
        /// <param name="rows">一页几行</param>
        /// <returns></returns>
        public static DataTable SelPage(common cls, out int intPC, out int intRC, string pageNow, string rows)
        {
            return commentDAL.SelPage(cls, out intPC, out intRC, pageNow, rows);
        }
        /// <summary>
        /// 添加评论
        /// </summary>
        /// <param name="com"></param>
        /// <returns></returns>
        public static bool InsertTbcommentAll(comment com)
        {
            return commentDAL.InsertTbcommentAll(com);
        }
    }
}
