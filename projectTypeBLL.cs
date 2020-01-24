using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DAL;
using Model;
namespace BLL
{
   public class projectTypeBLL
    {
        /// <summary>
        /// 查询所有的项目类型表
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable SelectProjectType()
        {
            return projectTypeDAL.SelectProjectType();
        }
    }
}
