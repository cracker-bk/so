using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
namespace WebUI
{
    public partial class lft_project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null && Session["phoneNum"] != null)
                {
                    int id = int.Parse(Session["id"].ToString());
                    this.Repeater1.DataSource = projectBLL.SelectWfaQ_Project(id);
                    this.Repeater1.DataBind();
                    this.Repeater2.DataSource = projectBLL.SelectWTG_Project(id);
                    this.Repeater2.DataBind();
                    rp3_4();
                    string phoneNum = Session["phoneNum"].ToString();
                    string a = phoneNum.Substring(0, 3);
                    string b = phoneNum.Substring(7, 4);
                    if (userInfoBLL.SelectUserInfoAll(id).Count>0)
                    {
                        userInfo u = new userInfo();
                        u = userInfoBLL.SelectUserInfoAll(id)[0];
                        this.imgBtn_tx.ImageUrl = "images/" + u.userImg;
                        this.Label1.Text = "用户名：" + a + "****" + b;
                        this.labTime.Text = "加入时间：" + u.resigterTime.ToShortDateString();
                        this.labPosition.Text = "所在地区：" + u.address;
                    }
                    else
                    {
                        this.Label1.Text = "用户名：" + a + "****" + b;
                        this.labTime.Text = "加入时间：" + DateTime.Now.ToShortDateString();
                    }
                }
            }

        }
        void rp3_4()
        {
            int id = int.Parse(Session["id"].ToString());
            DataTable dt = commonBLL.SelectPID_UID(id);
            List<DataRow> a = new List<DataRow>();
            foreach (DataRow item in dt.Rows)
            {
                a.Add(item);
            }
            string auid = "";
            string bpid = "";
            foreach (DataRow item in a)
            {
                auid += item[0].ToString() + ",";
                bpid += item[1].ToString() + ",";
            }
            if (auid.Length > 1 && bpid.Length > 1)
            {
                auid = auid.Substring(0, auid.Length - 1);
                bpid = bpid.Substring(0, bpid.Length - 1);
            }
            else
            {
                auid = "0";
                bpid = "0";
            }
            try
            {
                this.Repeater3.DataSource = commonBLL.SelectMyZcmanInfo(bpid, auid);
                this.Repeater3.DataBind();
            }
            catch (Exception)
            {

                Response.Write("<script>alert('这里还没有数据呢')</script>");
            }
        }

        protected void btn_info_Click(object sender, EventArgs e)
        {
            //跳转到个人设置界面
            Response.Redirect("myself.aspx");
        }
    }
}