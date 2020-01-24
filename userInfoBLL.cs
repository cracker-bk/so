using DAL;
using Model;
using System.Collections.Generic;
using System.Data;
namespace BLL
{
    public class userInfoBLL
    {
        /// <summary>
        /// 通过id来查用户信息是否存在
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectUserInfoByUid(int id)
        {
            return userInfoDAL.SelectUserInfoByUid(id);
        }
        /// <summary>
        /// 通过id来查用户信息
        /// </summary>
        /// <returns></returns>
        public static List<userInfo> SelectUserInfoAll(int id)
        {
            return userInfoDAL.SelectUserInfoAll(id);
        }
        public static DataTable SelectImgByID(string id)
        {
            return userInfoDAL.SelectImgByID(id);
        }
        /// <summary>
        /// 向数据库userInfo表中添加数据
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public static bool InsertUserInfo(userInfo info)
        {
            return userInfoDAL.InsertUserInfo(info);
        }
        /// <summary>
        /// 根据id修改头像
        /// </summary>
        /// <param name="id"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public static bool UpdateUserImgByID(int id, string img)
        {
            return userInfoDAL.UpdateUserImgByID(id, img);
        }
        /// <summary>
        /// 根据id修改部分用户信息
        /// </summary>
        /// <param name="u"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool UpdateBFInfoByUid(userInfo u, int id)
        {
            return userInfoDAL.UpdateBFInfoByUid(u, id);
        }
        /// <summary>
        /// 实名认证界面，往userinfo表中添加数据
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static bool InsertUserInfo__RealName(userInfo u)
        {
            return userInfoDAL.InsertUserInfo__RealName(u);
        }
    }
}
