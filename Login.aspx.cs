using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
using WebUI;

namespace WebUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            users u = new users();
            u.mobileNum = this.mobilePhoneNum.Text.Trim();
            u.pwd = this.password.Text.Trim();
            if (u.mobileNum == "" || u.pwd == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('auto')</script>");
                //Response.Write("<script>alert('手机号和密码均不能为空')</script>");
            }
            else
            {
                //判断手机号码是否存在
                if (userBLL.SelectUsersMobileNumIs(u.mobileNum))
                {
                    //获取用户状态
                    string state = userBLL.SelectIsHave(u.mobileNum);
                    //获取用户身份
                    string sf = userBLL.SelectIsManager(u.mobileNum);
                    if (state == "已停用")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                        //Response.Write("<script>alert('您的账号已被封停')</script>");
                    }
                    else
                    {
                        //判断手机号码和密码是否正确
                        if (userBLL.IsLogin(u))
                        {
                            //找到用户id
                            int id = userBLL.SelectUidByNum(u.mobileNum);
                            //用户id
                            Session["id"] = userBLL.SelectUidByNum(u.mobileNum);
                            //手机号码
                            Session["phoneNum"] = u.mobileNum;
                            if (sf=="管理员")
                            {
                                //跳到首页
                                Response.Redirect("Background.aspx?id=" + id);
                            }
                            else
                            {
                                //跳到首页
                                Response.Redirect("index.aspx?id=" + id);
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error')</script>");
                            //Response.Write("<script>alert('密码错误')</script>");
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                    //Response.Write("<script>alert('手机号不存在')</script>");
                }
            }
        }
    }
}

