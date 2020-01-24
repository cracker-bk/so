<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="saveRealName.aspx.cs" Inherits="WebUI.saveRealName" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="content/reset.css" rel="stylesheet" />
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
                    var txt = "添加成功";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                    break;
                case "error":
                    var txt = "意外错误";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error1":
                    var txt = "手机号码与注册所用手机号码不一致，请确认手机号码是否正确";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error2":
                    var txt = "请将性别栏和地址栏填写完整";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error3":
                    var txt = "验证码错误";
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
    <style>
        #header_box {
            background: url(images/header_bg.gif) repeat-x 0 0;
            height: 60px;
            text-align: left;
        }

        #header {
            margin: 0 auto;
            height: 60px;
            padding-left: 10px;
            width: 950px;
        }

        a, a:link {
            color: #222;
            text-decoration: none;
        }

        img {
            border: 0 none;
            vertical-align: top;
        }

        #mainbox {
            text-align: center;
            background: url(images/mainbox_bg1.gif) repeat-x left top;
            padding-bottom: 30px;
        }

        #content_title {
            margin: 0 auto;
            padding: 10px 0;
            text-align: left;
            width: 940px;
        }

            #content_title h1 {
                float: left;
                font-size: 36px;
                line-height: 1.2;
            }

                #content_title h1 font {
                    font-size: 18px;
                    color: #666;
                }

        #content {
            margin: 0 auto;
            text-align: left;
            padding: 0px 10px;
            width: 941px;
        }

        #content_top {
            margin: 0 auto;
            background: url(images/boxTop_Bg.png) no-repeat center top;
            height: 6px;
        }

        .register_pw {
            position: relative;
            border-left: 1px #e8e8e8 solid;
            border-right: 1px #e8e8e8 solid;
            width: 939px;
        }

        .reset_tab_box {
            height: 40px;
            width: 905px;
            padding-left: 28px;
            margin: 0px 3px;
            background: url(images/tab_bg.gif) repeat-x 0 0;
        }

        元素 {
        }

        .set_ontab {
            font-size: 14px;
            display: block;
            float: left;
            cursor: pointer;
            line-height: 38px;
            padding: 0px 20px;
            border-top: #dddddd 1px solid;
            border-right: #dddddd 1px solid;
            border-bottom: #fff 1px solid;
            border-left: #dddddd 1px solid;
        }

        .register_main_box {
            position: relative;
        }

        #content_bottom {
            background: url(images/boxBottom_Bg.gif) no-repeat center bottom;
            height: 28px;
        }

        .register_message {
            padding: 5px 0 0px 140px;
            height: 23px;
        }

            .register_message .redtips {
                float: left;
                color: red;
                font-size: 14px;
                line-height: 23px;
            }

        .register_oneline {
            padding: 8px 0 8px 0;
            height: 30px;
            width: 945px;
        }

        .labLeft1 {
            margin-left: 100px;
        }

        .rbtn1 {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header_box">
            <div id="header">
                <a href="#" title="SweetOrange">
                    <img src="images/logo3.png" alt="logo" />
                </a>
            </div>
        </div>
        <div id="mainbox">
            <div id="content_title">
                <h1>认证<font>填写信息</font>
                </h1>
                <div style="clear: both"></div>
            </div>
            <div id="content">
                <div id="content_top"></div>
                <div class="register_pw">
                    <div class="reset_tab_box">
                        <span class="set_ontab">实名认证</span>
                    </div>
                    <div class="register_main_box">
                        <div class="register_message">
                            <a name="message"></a>
                            <span class="redtips"></span>
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label1" runat="server" Text="真实姓名：" CssClass="labLeft1" Font-Size="14px"></asp:Label>
                            <asp:TextBox ID="txtBName" runat="server" Width="240px"></asp:TextBox><asp:RequiredFieldValidator Font-Size="14px" ID="RequiredFieldValidator1" runat="server" ErrorMessage="此处不能为空" ForeColor="red" ControlToValidate="txtBName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label2" runat="server" Text="身份证号：" CssClass="labLeft1" Font-Size="14px"></asp:Label>
                            <asp:TextBox ID="txtBIDNum" runat="server" Width="240px"></asp:TextBox><asp:RequiredFieldValidator Font-Size="14px" ID="RequiredFieldValidator2" runat="server" ErrorMessage="此处不能为空" ForeColor="red" ControlToValidate="txtBIDNum"></asp:RequiredFieldValidator>
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label3" Style="margin-left: 130px" runat="server" Text="性别：" CssClass="labLeft1" Font-Size="14px"></asp:Label>
                            <asp:RadioButton ID="rbtnBoy" Style="margin-left: 10px" runat="server" Text="男" Font-Size="14px" CssClass="rbtn1" GroupName="gn_rbtn1" />
                            <asp:RadioButton ID="rbtnGriy" runat="server" Text="女" Font-Size="14px" CssClass="rbtn1" GroupName="gn_rbtn1" />
                            <asp:RadioButton ID="rbtnBaoMi" runat="server" Text="保密" Font-Size="14px" CssClass="rbtn1" GroupName="gn_rbtn1" />
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label4" runat="server" Text="银行卡号：" CssClass="labLeft1" Font-Size="14px"></asp:Label>
                            <asp:TextBox ID="txtBkaH" runat="server" Width="240px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="此处不能为空" ForeColor="red" Font-Size="14px" ControlToValidate="txtBkaH"></asp:RequiredFieldValidator>
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label5" runat="server" Text="所在地区：" CssClass="labLeft1" Font-Size="14px"></asp:Label>
                            <asp:DropDownList ID="ddl_shengF" runat="server" Width="80" AutoPostBack="True" OnSelectedIndexChanged="ddl_shengF_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddl_chengShi" runat="server" Width="80px">
                            </asp:DropDownList>
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label6" runat="server" Text="手机号码：" CssClass="labLeft1" Font-Size="14px"></asp:Label>
                            <asp:TextBox ID="txtPhone" runat="server" Width="240px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Font-Size="14px" ErrorMessage="此处不能为空" ForeColor="red" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                        </div>
                        <div class="register_oneline">
                            <asp:Label ID="Label7" runat="server" Text="验证码：" CssClass="labLeft1" Style="margin-left: 114px;" Font-Size="14px"></asp:Label>
                            <asp:TextBox ID="txtBcode" runat="server" Width="80px"></asp:TextBox><asp:Button Style="margin-left: 14px;" Width="80px" Height="20px" ID="btnGetCode" CssClass="btnEndH2" runat="server" Text="获取验证码" OnClick="btnGetCode_Click"/>
                        </div>
                        <div class="register_oneline" style="padding-top: 20px">
                            <asp:Button ID="Button1" CssClass="btnEndH1" Style="margin-left: 175px;" runat="server" OnClick="Button1_Click" Text="重置" Width="100px" Height="25px" /><asp:Button Style="margin-left: 14px;" Width="100px" Height="25px" ID="Button2" CssClass="btnEndH1" runat="server" Text="确定" OnClick="Button2_Click"/>
                        </div>
                    </div>
                </div>
                <div id="content_bottom"></div>
            </div>
        </div>
    </form>
</body>
</html>
