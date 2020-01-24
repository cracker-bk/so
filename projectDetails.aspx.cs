using System;
using System.Data;
using System.Linq;
using BLL;
using Model;
namespace WebUI
{
    public partial class projectDetails : System.Web.UI.Page
    {
        protected string pagingHtml;
        private static int total = 1001;//结果总数
        private static int size = 2;//每页显示条数
        private static int current = 1;//当前页码
        private static int totalPageCount;
        protected static string content = "";//项目名称
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    Response.Write("<script>window.onload=function(){$('.register_li_display,.login_li_display').hide();$('.diy_select').css('display','block');}</script>");
                }               
                if (Request.QueryString["projectID"] != null)
                {
                    int projectID = int.Parse(Request.QueryString["projectID"]);
                    content = projectBLL.SelectProjectAllByProjectID(projectID).First().content;
                    this.Repeater2.DataSource = projectBLL.SelectProjectByID(projectID);
                    this.Repeater2.DataBind();
                    //int uID = int.Parse(Session["id"].ToString());
                }
                if (Request.QueryString["page"] != null)
                {
                    current = int.Parse(Request.QueryString["page"]);
                    rp1Bind(current);
                }
                else
                {
                    rp1Bind(1);
                }
                pagingHtml = Paging(total, size, current);
            }
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
                pageUrl += "<a href='/projectDetails.aspx?page=" + (currentPage - 1) + "&&projectID=" + Request.QueryString["projectID"] + "'>上一页</a>";
            }


            //此时应该这样显示页码 上一页 1 ...  5 6 7 8 9 ... 100 下一页
            //即当前浏览的页数在中间几页
            if ((currentPage - step) > 2 && (totalPageCount > step * 2 + 2))
            {


                pageUrl += "<a href='/projectDetails.aspx?page=1'" + "&&projectID=" + Request.QueryString["projectID"] + ">1</a>";


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
                        pageUrl = pageUrl + "<a href='/projectDetails.aspx?page=" + i + "&&projectID=" + Request.QueryString["projectID"] + "'>" + i + "</a>";
                    }
                }
                if (!isLastFiewPages)
                {
                    pageUrl += "<span>...</span><a href='/projectDetails.aspx?page=" + totalPageCount + "&&projectID" + Request.QueryString["projectID"] + "'>" + totalPageCount + "</a>";
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
                        pageUrl += "<a href='/projectDetails.aspx?page=" + i + "&&projectID=" + Request.QueryString["projectID"] + "'>" + i + "</a>";
                    }
                }


                //如果总条数大于前几页连续显示的条数需要这样显示 上一页 1 2 3 4 5 6 ... 100 下一页
                if (totalPageCount > (step * 2 + 2))
                {
                    if (totalPageCount - 1 > rightNum)
                    {
                        pageUrl += "<span>...</span>";
                    }
                    pageUrl += "<a href='/projectDetails.aspx?page=" + totalPageCount + "&&projectID=" + Request.QueryString["projectID"] + "'>" + totalPageCount + "</a>";
                }
            }


            if (currentPage < totalPageCount)
            {
                pageUrl += "<a href='/projectDetails.aspx?page=" + (currentPage + 1) + "&&projectID=" + Request.QueryString["projectID"] + "'>下一页</a>";
            }
            return pageUrl;
        }
        /// <summary>
        /// 绑定repeater控件
        /// </summary>
        /// <param name="e">当前页码</param>
        void rp1Bind(int e)
        {
            common cls = new common();
            cls.TableList = "*";
            cls.TableName = "comment c,userInfo u,users us";
            cls.SelectWhere = "u.uID=c.uID and us.uID=u.uID and c.projectID=" + int.Parse(Request.QueryString["projectID"]);
            cls.SelectOrder = "order by c.commentID desc";
            cls.SelectOrderId = "c.commentID";
            this.Repeater1.DataSource = commentBLL.SelPage(cls, out totalPageCount, out total, e.ToString(), "2");
            this.Repeater1.DataBind();
        }

        protected void btn_ZhiC_Click(object sender, EventArgs e)
        {
            if (Session["id"]==null)
            {
                Response.Write("<script>alert('您还没有登录呢！！！将为您跳转到登录界面');window.location.href='Login.aspx'</script>");
            }
            else
            {
                if (Request.QueryString["projectID"] != null)
                {
                    int projectID = int.Parse(Request.QueryString["projectID"].ToString());
                    Response.Redirect("zhiFu.aspx?projectID=" + projectID);
                }
            }
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null&& Request.QueryString["projectID"] != null)
            {
                int projectID = int.Parse(Request.QueryString["projectID"].ToString());
                comment com = new comment();
                com.uID = int.Parse(Session["id"].ToString());
                com.projectID = projectID;
                com.commentCtn = txtB_comment.Text;
                if (commentBLL.InsertTbcommentAll(com))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('success')</script>");
                    Response.Redirect("projectDetails.aspx?page=1&&projectID="+projectID);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error')</script>");
                //Response.Write("<script>请登录后进行评论</script>");
            }

        }
    }
}