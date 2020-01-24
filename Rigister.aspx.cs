using BLL;
using Model;
using System;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace WebUI
{
    public partial class Rigister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                return;
            }
            else
            {
                if (phone != "")
                {
                    //给文本框赋值
                    this.txtBmNum.Text = phone;
                    this.password.Text = pwd12;
                    this.txt_repwd.Text = pwd12;
                }
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            users u = new users();
            u.mobileNum = this.txtBmNum.Text.Trim();
            u.pwd = this.password.Text.Trim();
            if (u.mobileNum == "" || u.pwd == "" || this.txt_repwd.Text == "" || this.txtCode.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('auto')</script>");
                //Response.Write("<script>alert('请填入完整信息，方可注册')</script>");
            }
            else
            {
                //判断手机号码是否已存在,存在为true
                if (userBLL.SelectUsersMobileNumIs(u.mobileNum))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('auto1')</script>");
                    //Response.Write("<script>alert('用户名已存在')</script>");
                }
                else
                {
                    //判断两次密码是否一致
                    if (u.pwd == this.txt_repwd.Text)
                    {
                        //判断验证码是否输入正确
                        if (this.txtCode.Text.Trim() == vc.ToString())
                        {
                            if (userBLL.InsertUsers(u))
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('success');</script>");
                                //Response.Write("<script>alert('注册成功');window.location.href='Login.aspx'</script>");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error')</script>");
                                //Response.Write("<script>alert('注册失败')</script>");
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error1')</script>");
                            //Response.Write("<script>alert('验证码错误')</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk", "<script>lianX('error2')</script>");
                        //Response.Write("<script>alert('两次密码不一致')</script>");
                    }
                }
            }
        }
        int RandomNum() {
            //生成四位随机数
            Random random = new Random();
            int num1 = random.Next(1000, 9999);
            return num1;
        }
        private static string phone = "";
        private static string pwd12 = "";
        //验证码部分
        private const String host = "https://cxkjsms.market.alicloudapi.com";
        private const String path = "/chuangxinsms/dxjk";
        private const String method = "POST";
        private const String appcode = "5acf79595841493ea6ebe9f4b433c1d5";
        private static int vc = 0;
        protected void Button2_Click(object sender, EventArgs e)
        {
            phone = this.txtBmNum.Text.Trim();//手机号码
            pwd12 = this.password.Text.Trim();//密码
            //调用生成随机数的方法
            vc = RandomNum();
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
        public static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            return true;
        }
    }
}