using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
using System.Data;
namespace WebUI
{
    public partial class shouye : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string a = a.Substring(0,3);
            if (!IsPostBack)
            {
                this.rpProject.DataSource = projectBLL.SelectProjectAll(16);
                this.rpProject.DataBind();
                if (Session["id"] != null)
                {
                    if (Session["id"].ToString() != "")
                    {
                    Response.Write("<script>window.onload=function(){$('.register_li_display,.login_li_display').hide();$('.diy_select').css('display','block');}</script>");
                    }
                }

            }
        }
        //定义全局变量，用于判断用户点了几下更多项目按钮
        private static int num = 0;
        protected void btnMore_Click(object sender, EventArgs e)
        {
            num++;
            if (num >= 1)
            {
                //为repeater控件重新绑定数据源
                this.rpProject.DataSource = projectBLL.SelectProjectAll(16 + num * 4);
                this.rpProject.DataBind();
            }
        }
        protected void rpProject_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }
        protected void btnKj_Click(object sender, EventArgs e)
        {
            string a = this.btnKj.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnYs_Click(object sender, EventArgs e)
        {
            string a = this.btnYs.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnSj_Click(object sender, EventArgs e)
        {
            string a = this.btnSj.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnMusic_Click(object sender, EventArgs e)
        {
            string a = this.btnMusic.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnDm_Click(object sender, EventArgs e)
        {
            string a = this.btnDm.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnGy_Click(object sender, EventArgs e)
        {
            string a = this.btnGy.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnNy_Click(object sender, EventArgs e)
        {
            string a = this.btnNy.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnStudy_Click(object sender, EventArgs e)
        {
            string a = this.btnStudy.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnCb_Click(object sender, EventArgs e)
        {
            string a = this.btnCb.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnMovie_Click(object sender, EventArgs e)
        {
            string a = this.btnMovie.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void btnOthers_Click(object sender, EventArgs e)
        {
            string a = this.btnOthers.Text;
            this.rpProject.DataSource = projectBLL.SelectProjectAndProjectType(a);
            this.rpProject.DataBind();
        }

        protected void runat_redLove_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            int id = int.Parse(lbtn.CommandArgument);
            //调用修改的方法
            projectBLL.UpdateProject_heart(id);
            //获取当前页面的url
            string url = Page.Request.Url.ToString();
            Response.Redirect("" + url);
        }
    }
}