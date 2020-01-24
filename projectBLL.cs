using DAL;
using Model;
using System.Collections.Generic;
using System.Data;

namespace BLL
{
    public class projectBLL
    {
        public static bool UpdatePeopleNum(int pID)
        {
            return projectDAL.UpdatePeopleNum(pID);
        }
            /// <summary>
            /// 查询整张表，并添加到泛型集合
            /// </summary>
            /// <returns>泛型集合</returns>
            public static List<project> SelectProjectAll()
        {
            return projectDAL.SelectProjectAll();
        }
        public static List<project> SelectProjectAll1()
        {
            return projectDAL.SelectProjectAll1();
        }
        /// <summary>
        /// 查询整张表
        /// </summary>
        /// <returns>数据表</returns>
        public static DataTable SelectAll()
        {
            return projectDAL.SelectAll();
        }
        /// <summary>
        /// 点赞数+1
        /// </summary>
        /// <returns>布尔值</returns>
        public static bool UpdateProject_heart(int id)
        {
            return projectDAL.UpdateProject_heart(id);
        }
        /// <summary>
        /// 根据id查project表的信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns>泛型集合</returns>
        public static List<project> SelectProjectBYuID(int id)
        {
            return projectDAL.SelectProjectBYuID(id);
        }
        /// <summary>
        /// 查询整张表，并添加到泛型集合
        /// </summary>
        /// <returns>泛型集合</returns>
        public static List<project> SelectProjectAll(int num)
        {
            return projectDAL.SelectProjectAll(num);
        }
        /// <summary>
        /// 向project表中添加数据
        /// </summary>
        /// <param name="p">实体类project的一个对象名</param>
        /// <returns>bool</returns>
        public static bool InsertProject(project p)
        {
            return projectDAL.InsertProject(p);
        }
        /// <summary>
        /// 查询项目id
        /// </summary>
        /// <param name="ctnName">项目名称</param>
        /// <returns>int</returns>
        public static int SelectProjectID(string ctnName)
        {
            return projectDAL.SelectProjectID(ctnName);
        }
        /// <summary>
        /// 查找我发起的项目
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataTable SelectWfaQ_Project(int id)
        {
            return projectDAL.SelectWfaQ_Project(id);
        }
        public static DataTable SelectProjectMH(string abcd)
        {
            return projectDAL.SelectProjectMH(abcd);
        }
        /// <summary>
        /// 根据项目id查询整张表，并添加到泛型集合
        /// </summary>
        /// <returns>泛型集合</returns>
        public static List<project> SelectProjectAllByProjectID(int id)
        {
            return projectDAL.SelectProjectAllByProjectID(id);
        }
        public static DataTable SelectProjectByID(int id)
        {
            return projectDAL.SelectProjectByID(id);
        }
        /// <summary>
        /// 更改项目的筹集资金
        /// </summary>
        /// <returns></returns>
        public static bool UpdateGetedMoney(double money, int id)
        {
            return projectDAL.UpdateGetedMoney(money, id);
        }
        /// <summary>
        /// 根据类型名称查项目
        /// </summary>
        /// <param name="typeName">类型名称</param>
        /// <returns></returns>
        public static DataTable SelectProjectAndProjectType(string typeName)
        {
            return projectDAL.SelectProjectAndProjectType(typeName);
        }
        /// <summary>
        /// 根据项目状态查询项目
        /// </summary>
        /// <param name="state"></param>
        /// <returns></returns>
        public static DataTable SelectProjectByState(string state)
        {
            return projectDAL.SelectProjectByState(state);
        }
        /// <summary>
        /// 根据项目id删除项目
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool DeleteXM(int id)
        {
            return projectDAL.DeleteXM(id);
        }
        /// <summary>
        /// 更改项目状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool UpdateXM_ZhuangTai(string a, int id)
        {
            return projectDAL.UpdateXM_ZhuangTai(a, id);
        }
        /// <summary>
        ///后台的模糊查询
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static DataTable SelectHTproject(string a, string b)
        {
            return projectDAL.SelectHTproject(a, b);
        }
        /// <summary>
        /// 查找我投过的项目
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataTable SelectWTG_Project(int id)
        {
            return projectDAL.SelectWTG_Project(id);
        }
        }
}
