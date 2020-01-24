using DAL;
using Model;

namespace BLL
{
    public class userBLL
    {

        /// <summary>
        /// 判断是否登录成功
        /// </summary>
        /// <param name="u">users实体类对象</param>
        /// <returns>布尔值</returns>
        public static bool IsLogin(users u)
        {
            if (usersDAL.SelectUsersIs(u).Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        ///是否添加成功
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static bool InsertUsers(users u)
        {
            return usersDAL.InsertUsers(u);
        }
        /// <summary>
        /// 判断用户是否已存在
        /// </summary>
        /// <param name="mobileNum">手机号码</param>
        /// <returns>布尔值</returns>
        public static bool SelectUsersMobileNumIs(string mobileNum)
        {
            if (usersDAL.SelectUsersMobileNumIs(mobileNum).Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 通过手机号码修改密码
        /// </summary>
        /// <returns>布尔值</returns>
        public static bool UpdatePwdByNum(users u)
        {
            return usersDAL.UpdatePwdByNum(u);
        }
        /// <summary>
        /// 通过手机号码和旧密码，修改密码
        /// </summary>
        /// <returns>布尔值</returns>
        public static bool UpdatePwdByNumAndPwd(users u, string oldNum)
        {
            return usersDAL.UpdatePwdByNumAndPwd(u, oldNum);
        }
        /// <summary>
        /// 通过手机号码来查找用户id
        /// </summary>
        /// <param name="id">形参，表示用户id</param>
        /// <returns>int id</returns>
        public static int SelectUidByNum(string id)
        {
            return usersDAL.SelectUidByNum(id);
        }
        /// <summary>
        /// 查询用户状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static string SelectIsHave(string id)
        {
            return usersDAL.SelectIsHave(id);
        }
        public static string SelectIsManager(string id)
        {
            return usersDAL.SelectIsManager(id);
        }
    }
}
