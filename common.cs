using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
   public class common
    {
        //private @TableList Varchar(200)='*',--搜索表的字段,比如：’StuID,StuName,Gender‘，用逗号隔开

        //@TableName Varchar(30), --搜索的表名
        //@SelectWhere Varchar(500)='',--搜索条件，这里不用写where，比如：Gender=’女'
        //@SelectOrderId Varchar(20),--表主键字段名。比如：StuID
        //@SelectOrder Varchar(200)='', --排序，可以使用多字段排序但主键字段必需在最前面.也可以不写，比如：order by StuID asc
        //@intPageNo int=1, --页号
        //@intPageSize int=10 ,--每页显示数
        //@RecordCount int OUTPUT,  --总记录数(存储过程输出参数)
        //@pagecount int output

        /// <summary>
        /// 搜索表的字段,比如：’StuID,StuName,Gender‘，用逗号隔开
        /// </summary>
        public string TableList { get; set; }

        /// <summary>
        /// 搜索的表名
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 搜索条件，这里不用写where，比如：Gender=’女'
        /// </summary>
        public string SelectWhere { get; set; }

        /// <summary>
        /// 表主键字段名。比如：StuID
        /// </summary>
        public string SelectOrderId { get; set; }

        /// <summary>
        /// 排序，可以使用多字段排序但主键字段必需在最前面.也可以不写，比如：order by StuID asc
        /// </summary>
        public string SelectOrder { get; set; }

        /// <summary>
        /// 页号
        /// </summary>
        public int IntPageNo { get; set; }

        /// <summary>
        /// 每页显示数
        /// </summary>
        public int IntPageSize { get; set; }

        /// <summary>
        /// 总记录数(存储过程输出参数)
        /// </summary>
        public int RecordCount { get; set; }

        /// <summary>
        /// 页数
        /// </summary>
        public int Pagecount { get; set; }
    }
}
