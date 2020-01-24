<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="update_project.aspx.cs" Inherits="WebUI.update_project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery.js"></script>
    <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            //$('.register_li_display,.login_li_display').hide();
            //$('.diy_select').css('display', 'block');
        });
    </script>
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
                case "tishiInfo":
                    var txt = "本网站由甜橙众筹信息技术科技有限公司开发，如发现bug或疑惑请联系--18273403759(何先生)";
                    var option = {
                        title: "联系我们",
                        btn: parseInt("0011", 2),
                        onOk: function () {
                            console.log("确认啦");
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
                case "error1":
                    var txt = "还没有实名认证呢！！！";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error2":
                    var txt = "请您勾选网站版权协议";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
            }
        }
    </script>
    <%-- 弹窗结束 --%>
    <style type="text/css">
        * {
            margin: 0px 0px 10px 0px;
            padding: 0px;
        }

        .section {
            width: 1000px;
            height: 500px;
            border: 1px solid wheat;
            margin: 50px auto;
            background: #ffffff;
        }

        .head {
            height: 60px;
            border-bottom: 1px dashed gray;
        }

        .left {
            float: left;
        }

        .font_a {
            font-size: 22px;
            margin-left: 100px;
            font-weight: bolder;
        }

        .font_b {
            font-size: 35px;
            color: lightcoral;
        }

        .img {
            height: 375px;
            width: 300px;
            margin-left: 10px;
        }

        .font_d {
            font-size: 15px;
            margin-left: 100px;
        }

        .content {
            height: 259px;
        }

        .chexk- {
            width: 495px;
            margin-left: 400px;
        }

        .button {
            width: 495px;
            margin-left: 500px;
        }

        .button_style {
            background: red;
            width: 100px;
            height: 30px;
            color: white;
            border-radius: 5px;
        }

        .cLable1 {
            display: block;
            font-weight: bolder;
            font-size: 25px;
            margin-left: 50px;
            margin-top: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section">
        <div class="head">
            <asp:Label ID="Label1" runat="server" Text="发起项目" CssClass="cLable1"></asp:Label>
        </div>
        <div class="left">
            <img class="img" src="images/tree.jpg" />
        </div>
        <div class="content">
            <asp:Label ID="Label2" class="font_a" runat="server" Text="如果你有一颗"></asp:Label>
            <asp:Label ID="Label3" class="font_b" runat="server" Text="真诚的心"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" class="font_a" runat="server" Text="那么请在这里发起"></asp:Label>
            <asp:Label ID="Label5" class="font_b" runat="server" Text="你的梦想"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" class="font_d" runat="server" Text="众筹网是一家可以帮助您实现梦想的网站，在这里您可以发布您的梦想、创意和创意"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 计划，并通过网络平台面对公众集资，让有创造力的人可以获得他们所需的资金，<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 以便他们的梦想可以得以实现。<br />

        </div>
        <div class="chexk-">

            <asp:CheckBox ID="CheckBox1" runat="server" />
            <asp:Label ID="Label7" runat="server" Text="阅读并同意甜橙众筹"></asp:Label>
            <a style="color: red;" href="MP_ul11.aspx">《网站版权协议》</a>
        </div>
        <div class="button">
            <asp:Button ID="Button1" class="button_style" runat="server" Text="立即发起项目" OnClick="Button1_Click" BorderStyle="None" />
        </div>
    </div>
</asp:Content>
