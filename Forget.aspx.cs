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
    public partial class Forget : System.Web.UI.Page
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
                    this.txtPhone.Text = phone;
                    this.txtNewPwd.Text = pwd12;
                    this.txtRePwd.Text = pwd12;
                }
            }
        }
        private static string phone = "";
        private static string pwd12 = "";
        //验证码部分
        private const String host = "https://cxkjsms.market.alicloudapi.com";
        private const String path = "/chuangxinsms/dxjk";
        private const String method = "POST";
        private const String appcode = "5acf79595841493ea6ebe9f4b433c1d5";
        private static string vc = "";
        protected void Test_Click(object sender, EventArgs e)
        {
            phone = this.txtPhone.Text.Trim();//手机号码
            pwd12 = this.txtNewPwd.Text.Trim();//密码
            //生成四位随机数
            Random random = new Random();
            int num1 = random.Next(0, 9);
            int num2 = random.Next(0, 9);
            int num3 = random.Next(0, 9);
            int num4 = random.Next(0, 9);
            int[] nums = new int[4] { num1, num2, num3, num4 };
            for (int i = 0; i < nums.Length; i++)//循环添加四个随机数
            {
                vc += nums[i].ToString();
            }
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

        protected void btnCode_Click(object sender, EventArgs e)
        {
            users u = new users();
            u.mobileNum = this.txtPhone.Text.Trim();
            u.pwd = this.txtNewPwd.Text.Trim();
            //判断手机号码是否存在

            if (u.mobileNum == "" || u.pwd == "" || this.txtRePwd.Text == "" || this.txtCode.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "fk2", "<script>lianX('auto')</script>");
                //Response.Write("<script>alert('请填入完整信息，方可修改密码')</script>");
            }
            else
            {
                //判断两次密码是否输入相同
                if (this.txtNewPwd.Text==this.txtRePwd.Text)
                {
                    if (userBLL.SelectUsersMobileNumIs(u.mobileNum))
                    {
                        if (this.txtCode.Text == vc)
                        {
                            if (userBLL.UpdatePwdByNum(u))
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "fk1", "<script>lianX('success')</script>");
                                //Response.Write("<script>alert('密码找回成功，请登录');window.location.href='Login.aspx'</script>");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "fk2", "<script>lianX('error')</script>");
                                //Response.Write("<script>alert('修改失败')</script>");
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "fk3", "<script>lianX('error1')</script>");
                            //Response.Write("<script>alert('验证码错误')</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "fk4", "<script>lianX('error2')</script>");
                        //Response.Write("<script>alert('用户名不存在，请立即注册')</script>");
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "fk2", "<script>lianX('error2')</script>");
                }
            }
        }
    }
}


