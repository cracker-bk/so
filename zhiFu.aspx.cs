using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace WebUI
{
    public partial class zhiFu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null && Session["phoneNum"] != null)
                {
                    int uID = int.Parse(Session["id"].ToString());
                    if (userInfoBLL.SelectUserInfoAll(uID).Count==0)
                    {
                        this.yhTx.Src = "images/ys_head2.jpg";                       
                    }
                    else
                    {
                    this.yhTx.Src = "images/" + userInfoBLL.SelectUserInfoAll(uID)[0].userImg.ToString();
                    }
                    string phoneNum = Session["phoneNum"].ToString();
                    string a = phoneNum.Substring(0, 3);
                    string b = phoneNum.Substring(7, 4);
                    this.yhName.InnerText = a + "****" + b;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["projectID"] != null)
            {
                int projectID = int.Parse(Request.QueryString["projectID"].ToString());
                Response.Redirect("projectDetails.aspx?projectID=" + projectID);
            }
        }

        protected void btn_ZhuChi_ServerClick(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                if (Request.QueryString["projectID"] != null)
                {
                    int projectID = int.Parse(Request.QueryString["projectID"].ToString());
                    double a = double.Parse(this.rechnumP_Money.Text.ToString().Split('元')[0]);
                    if (projectBLL.UpdateGetedMoney(a, projectID))
                    {
                        myZCman cman = new myZCman();
                        cman.uID = int.Parse(Session["id"].ToString());
                        cman.projectID = projectID;
                        wTouG wtg = new wTouG();
                        wtg.uID= int.Parse(Session["id"].ToString());
                        wtg.projectID = projectID;
                        wtg.money = a;
                        myZCmanBLL.InsertmyZCman(cman);
                        projectBLL.UpdatePeopleNum(projectID);
                        wTouGBLL.InsertWTG(wtg);
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('success');</script>");
                        //Response.Write("<script>alert('支持成功')</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                        //Response.Write("<script>alert('支持失败')</script>");

                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('wdl')</script>");
            }
        }
    }
}