<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="csslrf/css/LoginCss/bootstrap.min.css" rel="stylesheet" />
    <link href="csslrf/css/LoginCss/animate.css" rel="stylesheet" />
    <link href="csslrf/css/LoginCss/style.css" rel="stylesheet" />
    <!-- special -->
    <script src="scripts/Loginjs/special.js"></script>
    <!-- jQuery -->
    <script src="scripts/Loginjs/jquery.min.js"></script>
    <%--<script src="js/jquery.min.js"></script>--%>
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
                    var txt = "手机号码和密码均不能为空";
                    var option = {
                        title: "非空提示",
                        btn: parseInt("0011", 2),
                        onOk: function () {
                            console.log("非空");
                        }
                    }
                    window.wxc.xcConfirm(txt, "custom", option);
                    break;
                case "error":
                    var txt=  "密码错误";
					window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error1":
                    var txt=  "手机号码不存在";
					window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                  case "error2":
                    var txt=  "您的账号已被封停";
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
    <canvas id="texiao" style="position: absolute; top: 0px; display: block;"></canvas>
                <script src="scripts/Loginjs/index.js"></script>
<script  src="js/js/index.js"></script>
	
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					
                    <img class="logo_img" src="images/logo2.png" />
					<!-- Start Sign In Form -->
					<form action="#" id="kuang" class="fh5co-form animate-box" data-animate-effect="fadeIn" runat="server">
						<h2>登 录</h2>
						<div class="form-group">
							<label for="username" class="sr-only">手机号：</label>
							<asp:TextBox class="form-control" id="mobilePhoneNum" placeholder="手机号" autocomplete="off" runat="server"></asp:TextBox>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码：</label>
							<asp:TextBox type="password" class="form-control" id="password" placeholder="密码" autocomplete="off" runat="server"></asp:TextBox>
						</div>
						
						<div class="form-group">
							<p>没有账号? <a href="Rigister.aspx">注册</a> | <a href="Forget.aspx">忘记密码?</a></p>
						</div>
						<div class="form-group">
							<asp:Button Text="登 录"  class="btn btn-primary" runat="server" OnClick="Unnamed1_Click"/>
                            
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
			
		</div>
	
</body>
</html>
