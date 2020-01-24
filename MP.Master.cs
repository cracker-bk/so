using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace WebUI
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    if (Session["id"].ToString() != "")
                    {
                        int uID = int.Parse(Session["id"].ToString());
                        if (userInfoBLL.SelectImgByID(uID.ToString()).Rows.Count==0)
                        {
                            this.txImg.Src = "images/用户.png";
                        }
                        else
                        {
                        this.txImg.Src = "images/" + userInfoBLL.SelectImgByID(uID.ToString()).Rows[0]["userImg"].ToString();
                        }
                    }
                }
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            ////获取url
            //string[] s = Page.Request.Url.ToString().Split('/');
            //string a=s[3];
            ////获取当前页面的aspx文件
            //string b = a.Split('?')[0];
            ////使页面刷新一下
            //Response.Redirect(""+b);
            //清空session
            Session["phoneNum"] = null;
            Session["id"] = null;
            //直接跳回首页
            Response.Redirect("index.aspx");
        }

        protected void Unnamed_ServerClick1(object sender, EventArgs e)
        {
        }

        protected void ImgbtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            string txtCtn = this.txtSearch.Text;
            Response.Redirect("list.aspx?txtCtn=" + txtCtn);
        }
    }
}