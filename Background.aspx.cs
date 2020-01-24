using BLL;
using Model;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Crowdfunding
{
    public partial class Background : System.Web.UI.Page
    {
        protected string pagingHtml;
        private static int total = 1001;//结果总数
        private static int size = 6;//每页显示条数
        private static int current = 1;//当前页码
        private static int totalPageCount;
        protected static string content = "";//项目名称
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        /// <summary>
        /// 绑定repeater控件
        /// </summary>
        /// <param name="e">当前页码</param>
        void rp1Bind(int e)
        {
            common cls = new common();
            cls.TableList = "*";
            cls.TableName = "project";
            cls.SelectWhere = "";
            cls.SelectOrder = "";
            cls.SelectOrderId = "projectID";
            this.rpt_pro.DataSource = commentBLL.SelPage(cls, out totalPageCount, out total, e.ToString(), "6");
            this.rpt_pro.DataBind();
        }
        /// <summary>
        /// 分页代码
        /// </summary>
        /// <param name="totalResult">总的结果条数</param>
        /// <param name="pageSize">每一页的大小</param>
        /// <param name="currentPage">当前页码</param>
        /// <returns>分页的html</returns>
        protected string Paging(double totalResult, int pageSize, int currentPage)
        {
            //在形如“上一页 1 ... 4 5 6 7 8 ... 100 下一页”的分页效果中，
            //leftNum = 4，相应的rightNum = 8; currentPage = 6; step = 2（从4到6间的差叫做step）


            string pageUrl = "";
            int step = 3;


            int leftNum;
            int rightNum;


            //总页数
            totalPageCount = (int)Math.Ceiling(totalResult / pageSize);


            //是否显示上一页
            if (currentPage > 1)
            {
                pageUrl += "<a href='/Background.aspx?page=" + (currentPage - 1) + "'>上一页</a>";
            }


            //此时应该这样显示页码 上一页 1 ...  5 6 7 8 9 ... 100 下一页
            //即当前浏览的页数在中间几页
            if ((currentPage - step) > 2 && (totalPageCount > step * 2 + 2))
            {


                pageUrl += "<a href='/Background.aspx?page=1'" + ">1</a>";


                //标识变量，标识当前页是否是倒数几页，该变量在下面会用到
                bool isLastFiewPages = false;


                //判断是否是倒数后几页
                if (currentPage + (step * 2 + 1 + 1) > totalPageCount)
                {
                    leftNum = totalPageCount - (step * 2 + 1);
                    rightNum = totalPageCount;
                    isLastFiewPages = true;
                }
                else
                {
                    leftNum = currentPage - step;
                    rightNum = currentPage + step;
                }


                if (leftNum - 1 > 1)
                {
                    pageUrl += "<span>...</span>";
                }


                //拼装分页代码
                for (int i = leftNum; i <= rightNum; i++)
                {
                    if (i == currentPage)
                    {
                        pageUrl = pageUrl + "<span class='current'>" + i + "</span>";
                    }
                    else
                    {
                        pageUrl = pageUrl + "<a href='/Background.aspx?page=" + i + "'>" + i + "</a>";
                    }
                }
                if (!isLastFiewPages)
                {
                    pageUrl += "<span>...</span><a href='/Background.aspx?page=" + totalPageCount + "&&projectID" + Request.QueryString["projectID"] + "'>" + totalPageCount + "</a>";
                }


            }
            //此时应该这样显示页码 上一页 1 2 3 4 5 6 ... 100 下一页或者
            //当总页数小于或等于(2 * step + 1 + 1)的时候应该这样显示 上一页 1 2 3 4 5 下一页
            else
            {
                if (currentPage <= 0)
                {
                    currentPage = 1;
                }


                leftNum = 1;
                //rightNum总页数和step * 2 + 1 + 1中较小的那个，
                rightNum = totalPageCount < (step * 2 + 1 + 1) ? totalPageCount : (step * 2 + 2);


                for (int i = leftNum; i <= rightNum; i++)
                {
                    if (i == currentPage)
                    {
                        pageUrl += "<span class='current'>" + currentPage + "</span>";
                    }
                    else
                    {
                        pageUrl += "<a href='/Background.aspx?page=" + i + "'>" + i + "</a>";
                    }
                }


                //如果总条数大于前几页连续显示的条数需要这样显示 上一页 1 2 3 4 5 6 ... 100 下一页
                if (totalPageCount > (step * 2 + 2))
                {
                    if (totalPageCount - 1 > rightNum)
                    {
                        pageUrl += "<span>...</span>";
                    }
                    pageUrl += "<a href='/Background.aspx?page=" + totalPageCount + "'>" + totalPageCount + "</a>";
                }
            }


            if (currentPage < totalPageCount)
            {
                pageUrl += "<a href='/Background.aspx?page=" + (currentPage + 1) +  "'>下一页</a>";
            }
            return pageUrl;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                DataBind_user();
            }
            user.Style.Add("display", "block");
            project.Style.Add("display", "none");
            Comment.Style.Add("display", "none");
        }
        /// <summary>
        /// 用户管理
        /// </summary>
        void DataBind_user()
        {
            this.gv_user.DataSource = commonBLL.SelectHT_YHGL();
            this.gv_user.DataBind();
        }
        /// <summary>
        /// 项目管理
        /// </summary>
        void rpBind_project()
        {
            this.rpt_pro.DataSource = projectBLL.SelectProjectAll1();
            this.rpt_pro.DataBind();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    if (Request.QueryString["page"] != null)
            //    {
            //        current = int.Parse(Request.QueryString["page"]);
            //        rp1Bind(current);
            //    }
            //    else
            //    {
            //        rp1Bind(1);
            //    }
            //    pagingHtml = Paging(total, size, current);
            //}
            if (IsPostBack)
            {
                rpBind_project();
            }
            user.Style.Add("display", "none");
            project.Style.Add("display", "block");
            Comment.Style.Add("display", "none");
        }
        /// <summary>
        /// 评论管理
        /// </summary>
        void DataBind_Comm()
        {
            this.gv_comment.DataSource = commonBLL.SelectComment();
            this.gv_comment.DataBind();
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            DataBind_Comm();
            user.Style.Add("display", "none");
            project.Style.Add("display", "none");
            Comment.Style.Add("display", "block");
        }

        protected void btn_user_Click(object sender, EventArgs e)
        {
            if (this.txt_user.Text.Trim() == "")
            {
                DataBind_user();
            }
            else
            {
                string a = this.ddl_user.SelectedItem.Value;
                string b = this.txt_user.Text.Trim();
                this.gv_user.DataSource = commonBLL.SelectHT_YHGL_MH(a, b);
                this.gv_user.DataBind();
            }
        }

        protected void gv_user_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //用户管理
            this.gv_user.PageIndex = e.NewPageIndex;
            DataBind_user();
        }

        protected void gv_user_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //获取手机号码
            string a = this.gv_user.Rows[e.RowIndex].Cells[0].Text.ToString();
            if (commonBLL.DeleteHT_YHGL(a))
            {
                Response.Write("<script>删除成功</script>");
                DataBind_user();
            }
            else
            {
                Response.Write("<script>删除失败</script>");
            }
        }

        protected void gv_user_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gv_user_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void btn_Pro_Click(object sender, EventArgs e)
        {
            string a = this.ddl_Pro.SelectedItem.Value;
            string b = this.txt_Pro.Text;
            if (b=="")
            {
                rpBind_project();
            }
            else
            {
                this.rpt_pro.DataSource = projectBLL.SelectHTproject(a,b);
                this.rpt_pro.DataBind();
            }
        }

        protected void rpt_pro_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btn_comment_Click(object sender, EventArgs e)
        {
            string a = this.ddl_comment.SelectedItem.Value;
            string b = this.txt_comment.Text;
            if (b=="")
            {
                DataBind_Comm();
            }
            else
            {
                this.gv_comment.DataSource = commonBLL.SelectComment(a,b);
                this.gv_comment.DataBind();
            }
        }

        protected void gv_comment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //评论管理
            this.gv_comment.PageIndex = e.NewPageIndex;
            DataBind_Comm();
        }

        protected void gv_comment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(this.gv_comment.Rows[e.RowIndex].Cells[0].Text);
            //调用删除方法
            commonBLL.DeleteComment(id);
            DataBind_Comm();
        }

        protected void lbtnStop_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            //获取手机号码
            string a = lbtn.CommandArgument;
            string zt = "已停用";
            commonBLL.UpdateZT(zt, a);
            //重新绑定数据源
            DataBind_user();
        }

        protected void lbtnUseing_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            //获取手机号码
            string a = lbtn.CommandArgument;
            string zt = "正常使用";
            commonBLL.UpdateZT(zt, a);
            //重新绑定数据源
            DataBind_user();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            int id = int.Parse(lbtn.CommandArgument);
            if (lbtn.CommandName == "Delete")
            {
                projectBLL.DeleteXM(id);
                //重新绑定
                rpBind_project();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            int id = int.Parse(lbtn.CommandArgument);
            if (lbtn.CommandName == "Update")
            {
                projectBLL.UpdateXM_ZhuangTai("众筹中",id);
                //重新绑定
                rpBind_project();
            }
        }
    }
}