using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    Response.Write("<script>window.onload=function(){$('.register_li_display,.login_li_display').hide();$('.diy_select').css('display','block');}</script>");
                }
                if (Request.QueryString["txtCtn"]!="")
                {
                    this.rpProject.DataSource = projectBLL.SelectProjectMH(Request.QueryString["txtCtn"]);
                    this.rpProject.DataBind();
                }
                else
                {
                    this.rpProject.DataSource = projectBLL.SelectProjectAll();
                    this.rpProject.DataBind();
                }
            }
        }

        protected void runat_redLove_ServerClick(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            int id = int.Parse(lbtn.CommandArgument);
            //调用修改的方法
            projectBLL.UpdateProject_heart(id);
            //获取当前页面的url
            string url = Page.Request.Url.ToString();
            Response.Redirect("" + url);
        }      
        protected void Button1_Click(object sender, EventArgs e)
        {
            string state = "众筹中";
            projectBLL.SelectProjectByState(state);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string state = "已完成";
            projectBLL.SelectProjectByState(state);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string state = "已失败";
            projectBLL.SelectProjectByState(state);
        }
    }
}