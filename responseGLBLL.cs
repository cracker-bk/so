using DAL;
using Model;
using System.Collections.Generic;
using System.Data;

namespace BLL
{
    public class responseGLBLL
    {
        /// <summary>
        /// 根据用户id查询收货地址管理表
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns>DataTable</returns>
        public static List<responseGL> SelectResponseGLByUid(int id)
        {
            return responseGLDAL.SelectResponseGLByUid(id);
        }
            /// <summary>
            /// 往收获地址管理表中添加数据
            /// </summary>
            /// <param name="rgl">实体类responseGL的对象名</param>
            /// <returns>bool</returns>
            public static bool InsertResponseGL(responseGL rgl)
        {
            return responseGLDAL.InsertResponseGL(rgl);
        }
    }
}
