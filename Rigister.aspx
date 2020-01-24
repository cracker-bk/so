<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rigister.aspx.cs" Inherits="WebUI.Rigister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="csslrf/css/LoginCss/bootstrap.min.css" rel="stylesheet" />
    <link href="csslrf/css/LoginCss/animate.css" rel="stylesheet" />
    <link href="csslrf/css/LoginCss/style.css" rel="stylesheet" />
    <!-- jQuery -->
    <script src="scripts/Loginjs/jquery.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="scripts/Loginjs/bootstrap.min.js"></script>
    <!-- Placeholder -->
    <script src="scripts/Loginjs/jquery.placeholder.min.js"></script>
    <!-- Waypoints -->
    <script src="scripts/Loginjs/jquery.waypoints.min.js"></script>
    <!-- Main JS -->
    <script src="scripts/Loginjs/main.js"></script>
    <%-- 弹窗开始 --%>
    <link rel="stylesheet" type="text/css" href="tanForm/css/xcConfirm.css" />
    <script src="tanForm/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="tanForm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        function lianX(obj) {
            switch (obj) {
                case "auto":
                    var txt = "请填入完整信息，方可注册";
                    var option = {
                        title: "非空提示",
                        btn: parseInt("0011", 2),
                        onOk: function () {
                            console.log("非空");
                        }
                    }
                    window.wxc.xcConfirm(txt, "custom", option);
                    break;
                case "auto1":
                    var txt = "用户名已存在，请返回登录界面进行登录";
                    var option = {
                        title: "用户名已存在",
                        btn: parseInt("0011", 2),
                        onOk: function () {
                            console.log("已存在");
                        }
                    }
                    window.wxc.xcConfirm(txt, "custom", option);
                    break;
                case "success":
                    var txt = "注册成功，请登录";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                    break;
                case "error":
                    var txt = "修改失败";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error1":
                    var txt = "验证码错误";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error2":
                    var txt = "用户名不存在，请立即注册";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
            }
        }
    </script>
    <%-- 弹窗结束 --%>
                <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            $('.register_li_display,.login_li_display').hide();
            $('.diy_select').css('display', 'block');
        });
    </script>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                 <img class="logo_img" src="images/logo2.png" />

                <!-- Start Sign In Form -->
                <form action="#" class="fh5co-form animate-box" data-animate-effect="fadeIn" runat="server">
                    <h2>注 册</h2>
                    <div class="form-group">
                        <div class="alert alert-success" role="alert">您的信息将会被保存</div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="sr-only">手机号：</label>
                        <asp:TextBox type="text" class="form-control" ID="txtBmNum" placeholder="手机号" autocomplete="off" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>
                        <asp:TextBox type="password" class="form-control" ID="password" placeholder="密码" autocomplete="off" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="re-password" class="sr-only">确认密码</label>
                        <asp:TextBox type="password" class="form-control" ID="txt_repwd" placeholder="确认密码" autocomplete="off" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="email" class="sr-only">验证码：</label>
                        <asp:TextBox ID="txtCode" class="form-control" placeholder="验证码" MaxLength="4" autocomplete="off" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" class="form-control" autocomplete="off" runat="server" Text="获取验证码" OnClick="Button2_Click" />
                    </div>
                    <div class="form-group">
                        <p>已有账号? <a href="Login.aspx">登录</a></p>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="Button1" runat="server" Text="注 册" value="注册" class="btn btn-primary" OnClick="Button1_Click1" />
                    </div>
                </form>
                <!-- END Sign In Form -->

            </div>
        </div>

    </div>
</body>
</html>
