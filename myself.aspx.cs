using BLL;
using Model;
using System;
using System.Web.UI.WebControls;
namespace WebUI
{
    public partial class myself : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //默认显示请选择
                this.ddl_shengF.Items.Insert(0, new ListItem("请选择"));
                this.ddl_chengShi.Items.Insert(0, new ListItem("请选择"));
                //对省份下拉框绑定数据源
                this.ddl_shengF.DataSource = provinceBLL.SelectProvince();
                this.ddl_shengF.DataValueField = "proID";
                this.ddl_shengF.DataTextField = "proName";
                this.ddl_shengF.DataBind();
                if (Session["id"] != null)
                {
                    int id = int.Parse(Session["id"].ToString());
                    if (userInfoBLL.SelectUserInfoAll(id).Count > 0)
                    {
                        userInfo u1 = new userInfo();
                        u1 = userInfoBLL.SelectUserInfoAll(id)[0];
                        this.lab_mobileNum.Text = u1.u.mobileNum;//手机号码
                        this.Label19.Text = u1.u.mobileNum;//手机号码
                        this.txtB_accountNum.Text = u1.accountNum;//卡号
                        this.lab_IDNum.Text = u1.IDNum;//身份证号
                        this.lab_Name.Text = u1.accountName;//真实姓名
                        this.Image1.ImageUrl = "~/images/" + u1.userImg;//图片
                        if (u1.address.Contains("省") && u1.address.Contains("市"))
                        {
                            this.ddl_shengF.SelectedItem.Text = u1.address.Split('省')[0] + "省";
                            this.ddl_chengShi.SelectedItem.Text = u1.address.Split('省')[1];
                        }
                        else
                        {
                            this.ddl_shengF.SelectedItem.Text = u1.address.Split('市')[0] + "市";
                            this.ddl_chengShi.SelectedItem.Text = u1.address.Split('市')[1];
                        }
                        if (u1.sex == "男")
                        {
                            this.sexBoy.Checked = true;
                        }
                        else if (u1.sex == "女")
                        {
                            this.sexGril.Checked = true;
                        }
                        else
                        {
                            this.sexBaoMi.Checked = true;
                        }
                    }

                    //调用方法
                    rpHB_Bind();
                }
            }
        }
        /// <summary>
        /// 绑定数据
        /// </summary>
        void rpHB_Bind()
        {
            int id = int.Parse(Session["id"].ToString());
            this.rpHuiBao.DataSource = huiBaoBLL.SelectHuiBao_Project_wTouGByUid(id);
            this.rpHuiBao.DataBind();
        }
        //void AddressGL() {
        //    //收货地址修改
        //    int id = int.Parse(Request.QueryString["id"]);
        //    List<responseGL> rgls = new List<responseGL>();
        //    rgls = responseGLBLL.SelectResponseGLByUid(id);
        //    List<string> a = new List<string>();
        //    List<string> b = new List<string>();
        //    List<string> c = new List<string>();
        //    List<string> d = new List<string>();
        //    foreach (responseGL item in rgls)
        //    {
        //        a.Add(item.rAddress);
        //        b.Add(item.emailCode);
        //        c.Add(item.rName);
        //        d.Add(item.rPhone);
        //    }
        //    this.ddlR_address.DataSource = a;
        //    this.ddlR_address.DataBind();
        //    this.ddlR_emailCode.DataSource = b;
        //    this.ddlR_emailCode.DataBind();
        //    this.ddlR_name.DataSource = c;
        //    this.ddlR_name.DataBind();
        //    this.ddlR_phone.DataSource = d;
        //    this.ddlR_phone.DataBind();
        //}
        protected void btn_QRXG_Click(object sender, EventArgs e)
        {
            users u = new users();
            u.mobileNum = this.Label19.Text;
            u.pwd = this.txtBnewPwd.Text;
            if (userBLL.SelectUsersMobileNumIs(u.mobileNum))
            {
                if (userBLL.UpdatePwdByNumAndPwd(u, this.txtBoldPwd.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('success');</script>");
                    //Response.Write("<script>alert('修改成功')</script>");
                    //清空文本框
                    this.txtBoldPwd.Text = "";
                    this.txtBnewPwd.Text = "";
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                    //Response.Write("<script>alert('意外错误，请联系我们')</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                //Response.Write("<script>alert('手机号码不存在')</script>");
            }
        }

        protected void ddl_shengF_SelectedIndexChanged(object sender, EventArgs e)
        {
            //获取省份id
            int id = int.Parse(this.ddl_shengF.SelectedValue.ToString());
            //获取用户选择的省级行政单位
            string sjDW = this.ddl_shengF.SelectedItem.Text;
            //判断用户选的是直辖市还是某某省
            if (sjDW.Substring(sjDW.Length - 1) == "市")
            {
                //绑定下拉框，显示某某区
                this.ddl_chengShi.DataSource = districtBLL.SelectDistrictNameByCityID(id);
                this.ddl_chengShi.DataValueField = "districtID";
                this.ddl_chengShi.DataTextField = "districtName";
                this.ddl_chengShi.DataBind();
                this.ddl_chengShi.Items.Insert(0, new ListItem("请选择"));
            }
            else
            {
                //绑定下拉框，显示某某市
                this.ddl_chengShi.DataSource = cityBLL.SelectCityNameByID(id);
                this.ddl_chengShi.DataValueField = "cityID";
                this.ddl_chengShi.DataTextField = "cityName";
                this.ddl_chengShi.DataBind();
                this.ddl_chengShi.Items.Insert(0, new ListItem("请选择"));
            }
        }
        protected void btn_ccBaoc_Click(object sender, EventArgs e)
        {
            //判断图片上传控件是否有图片
            if (this.FileUpload1.HasFile)
            {
                //得到上传文件大小
                int i = this.FileUpload1.PostedFile.ContentLength;
                if (i > 5242880)//1024*1024*5=5012
                {
                    Response.Write("<script>alert('文件不能超过5M !')</script>");
                    return;
                }
                else
                {
                    //获取文件名
                    string fileName = this.FileUpload1.FileName;
                    //获取文件后缀名
                    string fileNameHZM = fileName.Substring(fileName.LastIndexOf('.') + 1);
                    if (fileNameHZM == "png" || fileNameHZM == "jpg" || fileNameHZM == "gif")
                    {
                        //保存到指定文件夹
                        this.FileUpload1.SaveAs(Server.MapPath(".") + "/images/" + fileName);
                        this.Image1.ImageUrl = "~/images/" + fileName;
                        //并存放于数据库
                        int id = int.Parse(Session["id"].ToString());
                        userInfoBLL.UpdateUserImgByID(id, fileName);
                    }
                    else
                    {
                        Response.Write("<script>alert('图片格式错误')</script>");
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            userInfo u = new userInfo();
            u.address = this.ddl_shengF.SelectedItem.Text + this.ddl_chengShi.SelectedItem.Text;
            u.accountNum = this.txtB_accountNum.Text;
            //定义一个计数器
            int num = 0;
            RadioButton[] rs = new RadioButton[3] { this.sexGril, this.sexBoy, this.sexBaoMi };
            foreach (RadioButton item in rs)
            {
                if (item.Checked)
                {
                    num++;
                    u.sex = item.Text;
                    break;
                }
            }
            if (num == 1 && this.ddl_chengShi.SelectedItem.Text != "" && this.ddl_shengF.SelectedItem.Text != "" && this.ddl_chengShi.SelectedItem.Text != "请选择" && this.ddl_shengF.SelectedItem.Text != "请选择" && this.txtB_accountNum.Text != "")
            {
                int id = int.Parse(Session["id"].ToString());
                if (userInfoBLL.UpdateBFInfoByUid(u, id))
                {
                    Response.Write("<script>alert('修改成功')</script>");
                }
                else
                {
                    Response.Write("<script>alert('意外错误，赶快联系小何同志')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('本页面内容不能为空，请完善信息')</script>");
            }
        }

        protected void dc_btnBaoc_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["id"].ToString());
            responseGL rgl = new responseGL();
            rgl.uID = id;
            rgl.rAddress = this.TextBox1.Text;
            rgl.rName = this.TextBox3.Text;
            rgl.rPhone = this.TextBox4.Text;
            rgl.emailCode = this.TextBox2.Text;
            //判断复选框是否选中
            if (this.CheckBox1.Checked)
            {
                rgl.isDefault = "true";
            }
            else
            {
                rgl.isDefault = "false";
            }
            if (responseGLBLL.InsertResponseGL(rgl))
            {
                Response.Write("<script>alert('添加成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('意外错误，赶快联系小何同志')</script>");
            }
        }
    }
}