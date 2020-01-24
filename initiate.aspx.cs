using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using Model;
using System.Text.RegularExpressions;

namespace WebUI
{
    public partial class initiate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    Response.Write("<script>window.onload=function(){$('.register_li_display,.login_li_display').hide();$('.diy_select').css('display','block');}</script>");
                }                
                //绑定单选按钮
                this.RadioButtonList1.DataSource = projectTypeBLL.SelectProjectType();
                this.RadioButtonList1.DataValueField = "typeID";
                this.RadioButtonList1.DataTextField = "typeName";
                this.RadioButtonList1.DataBind();
                //对省份下拉框绑定数据源
                this.ddl_sf.DataSource = provinceBLL.SelectProvince();
                this.ddl_sf.DataValueField = "proID";
                this.ddl_sf.DataTextField = "proName";
                this.ddl_sf.DataBind();
                //默认显示请选择
                this.ddl_sf.Items.Insert(0, new ListItem("请选择"));
                this.ddl_city.Items.Insert(0, new ListItem("请选择"));
            }
        }

        protected void shangchuan_Click2(object sender, ImageClickEventArgs e)
        {
            //判断图片上传控件是否有图片
            if (this.FileUpload1.HasFile)
            {
                //得到上传文件大小
                int i = this.FileUpload1.PostedFile.ContentLength; 
                if (i>5242880)//1024*1024*5=5012
                {
                    Response.Write("<script>alert('文件不能超过5M !')</script>");
                    return;
                }
                else
                {
                    //获取文件名
                    string fileName = this.FileUpload1.FileName;
                    //获取文件后缀名
                    string fileNameHZM = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
                    if (fileNameHZM == "png" || fileNameHZM == "jpg" || fileNameHZM == "gif")
                    {
                        //保存到指定文件夹
                        this.FileUpload1.SaveAs(Server.MapPath(".") + "/images/" + fileName);
                        this.image_cover.ImageUrl = "~/images/" + fileName;
                        wenJianName = this.FileUpload1.FileName;
                        this.image_cover.Visible = true;
                        this.lb_day.Text = (DateTime.Parse(this.date.Value).Date-DateTime.Now.Date).ToString().Substring(0,2)+"天";
                        this.lb_money.Text = this.txt_Pro_moeny.Text+"元";
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error')</script>");
                        //Response.Write("<script>alert('图片格式错误')</script>");
                    }
                }
            }
        }
        //获取图片名
        private static string wenJianName = "";
        protected void ddl_sf_SelectedIndexChanged(object sender, EventArgs e)
        {
            //获取省份id
            int id = int.Parse(this.ddl_sf.SelectedValue.ToString());
            //获取用户选择的省级行政单位
            string sjDW = this.ddl_sf.SelectedItem.Text;
            //判断用户选的是直辖市还是某某省
            if (sjDW.Substring(sjDW.Length-1)=="市")
            {
                //绑定下拉框，显示某某区
                this.ddl_city.DataSource =districtBLL.SelectDistrictNameByCityID(id);
                this.ddl_city.DataValueField = "districtID";
                this.ddl_city.DataTextField = "districtName";
                this.ddl_city.DataBind();
                this.ddl_city.Items.Insert(0, new ListItem("请选择"));
            }
            else
            {
                //绑定下拉框，显示某某县
                this.ddl_city.DataSource = cityBLL.SelectCityNameByID(id);
                this.ddl_city.DataValueField = "cityID";
                this.ddl_city.DataTextField = "cityName";
                this.ddl_city.DataBind();
                this.ddl_city.Items.Insert(0, new ListItem("请选择"));
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            string a = "<h3>关于我</h3><h6> 向支持者介绍你自己或你的团队，并详细说明你与所发起的项目之间的背景，让支持者能够在最短时间内了解你，以拉近彼此之间的距离。</h6><h3>我想要做什么</h3><h6>这是项目介绍中最关键的部分，建议上传5张以上高清图片(宽700、高不限)，配合文字来简洁生动地说明你的项目，让支持者对你要做的事情一-目 了然并充满兴趣。</h6><h3>为什么我需要你的支持及资金用途</h3><h6>请在这一部分说明你的项目不同寻常的特色， 为什么需要大家的支持以及详细的资金用途，这会增加你项目的可信度并由此提高筹资的成功率。</h6><h3>我的承诺与回报</h3><h6>请在此处展示你为支持者准备的回报，回报方式将是左右项目能否筹资成功的关键因素,建议设定两个以上的回报方式，保证有趣且可行，并明确实现回报的时间。</h6><h3>可能存在的风险</h3><h6>请在此标注你的项目在实施过程中可能存在的风险，让支持者对你的项目有全面而清晰的认识。其他备注信息</h6>";
            if (this.content1.Value!=a&&this.content1.Value!="")
            {
                project p = new project();
                p.uID = int.Parse(Session["id"].ToString());
                p.content = this.txt_pro_Name.Text;//项目名称
                p.money = double.Parse(this.txt_Pro_moeny.Text);//筹集金额
                p.endTime = DateTime.Parse(this.date.Value);
                p.typeID = int.Parse(this.RadioButtonList1.SelectedItem.Value);
                p.proJJ = this.txt_jj.Text;
                p.proXQ = this.content1.Value;
                p.position = this.ddl_sf.SelectedItem.Text + this.ddl_city.SelectedItem.Text;
                //将图片存放于数据库
                p.projectImg = wenJianName;
                if (projectBLL.InsertProject(p))
                {
                    wFaQ wFa = new wFaQ();
                    wFa.projectID = projectBLL.SelectProjectID(p.content);
                    wFa.uID = p.uID;
                    wFaQBLL.InsertWFaQ(wFa);
                    Response.Redirect("return.aspx?name=" + p.content);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                    //Response.Write("<script>alert('意外错误')</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                //Response.Write("<script>alert('意外错误')</script>");
            }
        }
    }
}