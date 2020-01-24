<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="initiate.aspx.cs" Inherits="WebUI.initiate" ValidateRequest="false" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="content/initiate.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="dateShow/dateSelect.css">
    <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            $('.register_li_display,.login_li_display').hide();
            $('.diy_select').css('display', 'block');
        });
    </script>
    <script src="js/wangEditor.js"></script>
    <%--  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="js/jquery-3.2.1.min.js"></script>
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
                    var txt = "图片格式错误";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error1":
                    var txt = "意外错误";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
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
            }
        }
    </script>
    <%-- 弹窗结束 --%>
    <style type="text/css">
        #Select1 {
            width: 73px;
        }

        #initiate {
            margin-top: 40px;
        }

        .cRadioButtonList1 {
            padding-top: 20px;
            padding-left: 20px;
        }

        .lbPaddingTop {
            padding-top: 30px;
        }
    </style>

    <script>
        window.onload = function () {

            var E = window.wangEditor;
            var editor = new E('#initiate #nr_inport #sdsd');
            var $text1 = $('#ContentPlaceHolder1_content1');
            editor.customConfig.onchange = function (html) {
                $text1.val(html);// 监控变化，同步更新到 textarea
                //$text1.val(editor.txt.html());

            }

            editor.create();

            editor.txt.html('<h3>关于我</h3><h6> 向支持者介绍你自己或你的团队，并详细说明你与所发起的项目之间的背景，让支持者能够在最短时间内了解你，以拉近彼此之间的距离。</h6><h3>我想要做什么</h3><h6>这是项目介绍中最关键的部分，建议上传5张以上高清图片(宽700、高不限)，配合文字来简洁生动地说明你的项目，让支持者对你要做的事情一-目 了然并充满兴趣。</h6><h3>为什么我需要你的支持及资金用途</h3><h6>请在这一部分说明你的项目不同寻常的特色， 为什么需要大家的支持以及详细的资金用途，这会增加你项目的可信度并由此提高筹资的成功率。</h6><h3>我的承诺与回报</h3><h6>请在此处展示你为支持者准备的回报，回报方式将是左右项目能否筹资成功的关键因素,建议设定两个以上的回报方式，保证有趣且可行，并明确实现回报的时间。</h6><h3>可能存在的风险</h3><h6>请在此标注你的项目在实施过程中可能存在的风险，让支持者对你的项目有全面而清晰的认识。其他备注信息</h6>')

            //document.getElementById('ContentPlaceHolder1_content1').addEventListener('click', function () {
            var editor_txt = editor.txt.html();
            document.getElementById('ContentPlaceHolder1_content1').value = editor_txt;

            //}, false);

        };
    </script>

    <%--  <script src="Js/jquery-1.7.1.min.js" type="text/javascript"></script>--%>
    <%--  <script src="Js/Project.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="initiate">
        <div id="pic">
            <img src="images/shou_xmxx1.png" />
            <br />
        </div>
        <div id="nr">

            <h2>项目信息</h2>
            <hr />
            <div id="nr_inport">
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="项目名称：" CssClass="wenzi_left"></asp:Label>
                <asp:TextBox ID="txt_pro_Name" runat="server" Height="25px" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_pro_Name" ErrorMessage="项目名称不能为空！" ForeColor="#EE5F57"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="筹集金额：" CssClass="wenzi_left"></asp:Label>
                <asp:TextBox ID="txt_Pro_moeny" runat="server" Height="25px" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Pro_moeny" ErrorMessage="筹集金额不能为空！" ForeColor="#EE5F57"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="结束时间：" CssClass="wenzi_left"></asp:Label>
                <input type="text" id="date" style="width: 300px; height: 25px;" runat="server">
                <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
                <script type="text/javascript" src="dateShow/dateSelect.js"></script>
                <script type="text/javascript">
                    $("#ContentPlaceHolder1_date").dateSelect();
                </script>
                <%--                <asp:TextBox ID="txt_Endtime" runat="server" Height="25px" Width="300px" TextMode="SingleLine"></asp:TextBox>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="date" ErrorMessage="结束时间不能为空！" ForeColor="#EE5F57"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;<asp:Label ID="Label11" runat="server" Text="类别：" CssClass="wenzi_left"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="cRadioButtonList1"></asp:RadioButtonList>
                <asp:RequiredFieldValidator Style="margin-left: 20px" ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="项目类型不能为空！" ForeColor="#EE5F57"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="项目地点：" CssClass="wenzi_left"></asp:Label>
                <asp:DropDownList ID="ddl_sf" runat="server" Height="22px" Width="75px" AutoPostBack="True" OnSelectedIndexChanged="ddl_sf_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<asp:DropDownList ID="ddl_city" runat="server" Width="75px" Height="22px">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="项目封面：" CssClass="wenzi_left"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="139px" />
                <asp:RegularExpressionValidator ID="sdsdsdsd" runat="server" ControlToValidate="FileUpload1" ValidationGroup="sss" ForeColor="#EE5F57" />


                <asp:ImageButton ID="shangchuan" runat="server" ImageUrl="~/images/scfm.png" CausesValidation="false" OnClick="shangchuan_Click2" ValidationGroup="sss" />

                <asp:Label ID="lb_pic" runat="server" CssClass="wenzi_color">支持jpg、jpeg、png、gif格式，大小不超过5M。</asp:Label>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="项目简介：" CssClass="wenzi_left"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txt_jj" runat="server" Height="144px" TextMode="MultiLine" Width="616px" Style="margin-left: 20px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="项目简介不能为空" ForeColor="#EE5F57" ControlToValidate="txt_jj"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="项目详情：" CssClass="wenzi_left"></asp:Label>
                <br />

                <div id="sdsd"></div>
                <textarea id="content1" cols="30" rows="10" name="content1" runat="server" validationgroup="qw" style="display: none;" />
                <asp:RequiredFieldValidator ID="fgfg" runat="server" ValidationGroup="qw" ControlToValidate="content1" ErrorMessage="不能为空" ForeColor="#EE5F57"></asp:RequiredFieldValidator>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <div id="btn">
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/bt_go.png" OnClick="ImageButton2_Click" />
                </div>
            </div>

        </div>
        <div id="tip">
            <div id="lst">
                <asp:Image ID="image_cover" runat="server" Height="238px" Width="240px" Visible="false" />
            </div>
            <br />
            <br />
            &nbsp;
            <asp:Label ID="lb_mb" runat="server" Text="目标：" CssClass="lbPaddingTop"></asp:Label>
            <asp:Label ID="lb_day" runat="server" Text="" CssClass="lbPaddingTop"></asp:Label>
            &nbsp;
            <asp:Label ID="lb_money" runat="server" Text="" CssClass="lbPaddingTop"></asp:Label>
        </div>
    </div>
</asp:Content>

