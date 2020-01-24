using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.Data;

namespace WebUI
{
    public partial class _return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            huiBao hb = new huiBao();
            hb.zhiChiMoney = double.Parse(this.jine.Text);
            hb.huiBaoCtn = this.ff.Value;
            hb.mingE = int.Parse(this.minge.Text);
            hb.yunFee = double.Parse(this.yunfei.Text);
            hb.huiBaoTime = DateTime.Parse(this.date.Value);
            hb.projectID = projectBLL.SelectProjectID(Request.QueryString["name"]);
            if (huiBaoBLL.InsertHuiBao(hb))
            {
                int id = hb.projectID;
                this.GridView1.DataSource=huiBaoBLL.SelectHuiBao_Project_wTouGByUid(id);
                this.GridView1.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                //Response.Write("<script>alert('恭喜你出错了，这个错误100年都没遇到过')</script>");
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(this.GridView1.Rows[e.RowIndex].Cells[0].Text);
            if (huiBaoBLL.DeleteHuiBao(id))
            {
                int proID = projectBLL.SelectProjectID(Request.QueryString["name"]);
                this.GridView1.DataSource = huiBaoBLL.SelectHuiBao_Project_wTouGByUid(proID);
                this.GridView1.DataBind();
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('success');</script>");
                //Response.Write("<script>alert('删除成功')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                //Response.Write("<script>alert('恭喜你出错了，这个错误100年都没遇到过')</script>");
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = huiBaoBLL.SelectHuiBao_Project_wTouGByUid(projectBLL.SelectProjectID(Request.QueryString["name"]));
            if (dt.Rows[0]["huiBaoCtn"].ToString()!="")
            {
                Response.Redirect("End.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                //Response.Write("<script>alert('您还没有保存回报呢！请单击回报按钮')</script>");
            }
        }
    }
}