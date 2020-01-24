using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using Model;
namespace WebUI
{
    public partial class update_project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    Response.Write("<script>window.onload=function(){$('.register_li_display,.login_li_display').hide();$('.diy_select').css('display','block');}</script>");
                }
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                if (Session["id"]!=null)
                {
                    int id = int.Parse(Session["id"].ToString());
                    if (userInfoBLL.SelectUserInfoByUid(id).Rows.Count==0)
                    {
                        //ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                        Response.Write("<script>alert('还没有实名认证呢！！！');window.location.href='saveRealName.aspx'</script>");
                    }
                    else
                    {
                        Response.Redirect("initiate.aspx?id=" + Request.QueryString["id"]);
                    }
                }
                else
                {
                    Response.Write("<script>alert('您还没有登录呢，请立即登录！！！');window.location.href='Login.aspx'</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                //Response.Write("<script>alert('请您勾选网站版权协议')</script>");
            }
        }
    }
}