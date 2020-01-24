using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web.UI.WebControls;
namespace WebUI
{
    public partial class saveRealName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //默认选择性别男
            this.rbtnBoy.Checked = true;
            if (!IsPostBack)
            {
                ddlSSBind();
            }
        }
        /// <summary>
        /// 绑定省市下拉框
        /// </summary>
        void ddlSSBind()
        {
            //对省份下拉框绑定数据源
            this.ddl_shengF.DataSource = provinceBLL.SelectProvince();
            this.ddl_shengF.DataValueField = "proID";
            this.ddl_shengF.DataTextField = "proName";
            this.ddl_shengF.DataBind();
            //默认显示请选择
            this.ddl_shengF.Items.Insert(0, new ListItem("请选择"));
            this.ddl_chengShi.Items.Insert(0, new ListItem("请选择"));
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
        private static string phone = "";//手机号码
        //验证码部分
        private const String host = "https://cxkjsms.market.alicloudapi.com";
        private const String path = "/chuangxinsms/dxjk";
        private const String method = "POST";
        private const String appcode = "5acf79595841493ea6ebe9f4b433c1d5";
        private static int vc = 0;
        /// <summary>
        /// 生成四位数的随机数
        /// </summary>
        /// <returns></returns>
        int RandomNum()
        {
            //生成四位随机数
            Random random = new Random();
            int num1 = random.Next(1000, 9999);
            return num1;
        }
        protected void btnGetCode_Click(object sender, EventArgs e)
        {
            vc = RandomNum();
            phone = this.txtPhone.Text;
            if (userBLL.SelectUsersMobileNumIs(phone))
            {
                String querys = string.Format("content=【湖南工程职业学院】你的验证码是：{0}，3分钟内有效！&mobile={1}", vc, phone);
                String bodys = "";
                String url = host + path;
                HttpWebRequest httpRequest = null;
                HttpWebResponse httpResponse = null;

                if (0 < querys.Length)
                {
                    url = url + "?" + querys;
                }

                if (host.Contains("https://"))
                {
                    ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
                    httpRequest = (HttpWebRequest)WebRequest.CreateDefault(new Uri(url));
                }
                else
                {
                    httpRequest = (HttpWebRequest)WebRequest.Create(url);
                }
                httpRequest.Method = method;
                httpRequest.Headers.Add("Authorization", "APPCODE " + appcode);
                if (0 < bodys.Length)
                {
                    byte[] data = Encoding.UTF8.GetBytes(bodys);
                    using (Stream stream = httpRequest.GetRequestStream())
                    {
                        stream.Write(data, 0, data.Length);
                    }
                }
                try
                {
                    httpResponse = (HttpWebResponse)httpRequest.GetResponse();
                }
                catch (WebException ex)
                {
                    httpResponse = (HttpWebResponse)ex.Response;
                }

                Console.WriteLine(httpResponse.StatusCode);
                Console.WriteLine(httpResponse.Method);
                Console.WriteLine(httpResponse.Headers);
                Stream st = httpResponse.GetResponseStream();
                StreamReader reader = new StreamReader(st, Encoding.GetEncoding("utf-8"));
                Console.WriteLine(reader.ReadToEnd());
                Console.WriteLine("\n");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                //Response.Write("<script>alert('手机号码与注册所用手机号码不一致，请确认手机号码是否正确')</script>");
            }
        }
        public static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //清空文本框
            this.txtBName.Text = "";
            this.txtBIDNum.Text = "";
            this.txtBkaH.Text = "";
            this.txtPhone.Text = "";
            this.txtBcode.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            List<RadioButton> list = new List<RadioButton>();
            list.Add(this.rbtnBoy);
            list.Add(this.rbtnGriy);
            list.Add(this.rbtnBaoMi);
            int state = 0;//状态数
            RadioButton radioBtn = null;//找出被选中的单选按钮
            foreach (RadioButton item in list)
            {
                if (item.Checked)
                {
                    state++;
                    radioBtn = item;
                    break;
                }
            }
            if (ddl_shengF.SelectedItem.Text == "请选择" || ddl_chengShi.SelectedItem.Text == "请选择" || state != 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                //Response.Write("<script>alert('请将性别栏和地址栏填写完整')</script>");
            }
            else
            {
                //判断验证码是否正确
                if (vc == int.Parse(this.txtBcode.Text))
                {
                    userInfo u = new userInfo();
                    if (Session["id"] != null)
                    {
                        u.uID = int.Parse(Session["id"].ToString());
                    }
                    else
                    {
                        u.uID = 8;
                    }
                    u.accountName = this.txtBName.Text;
                    u.IDNum = this.txtBIDNum.Text;
                    u.sex = radioBtn.Text;
                    u.accountNum = this.txtBkaH.Text;
                    u.address = this.ddl_shengF.SelectedItem.Text + this.ddl_chengShi.SelectedItem.Text;
                    if (userInfoBLL.InsertUserInfo__RealName(u))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('success');window.location.href='initiate.aspx'</script>");                       
                        //Response.Write("<script>alert('添加成功')</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error');</script>");
                        Response.Write("<script>alert('意外错误')</script>");
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error3');</script>");
                    //Response.Write("<script>alert('验证码错误')</script>");
                }
            }
        }
    }
}