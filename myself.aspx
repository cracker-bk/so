<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="myself.aspx.cs" Inherits="WebUI.myself" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script>
        $(function () {
            $("a").removeClass("bbClick");
            $('.register_li_display,.login_li_display').hide();
            $('.diy_select').css('display', 'block');
        })
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
                    var txt = "修改成功";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                    break;
                case "error1":
                    var txt = "意外错误，请联系我们";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error2":
                    var txt = "手机号码不存在";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
            }
        }
    </script>
    <%-- 弹窗结束 --%>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .container {
            margin: 50px auto;
            width: 800px;
            overflow: hidden;
            background: beige;
        }

        #tabnav li {
            border-top: 1px solid lightgrey;
            border-left: 1px solid lightgrey;
            border-right: 1px solid lightgrey;
            height: 50px;
            line-height: 50px;
            list-style: none;
            text-align: center;
            width: 150px;
        }

            #tabnav li:last-child {
                height: 0px;
                border-right: 1px solid lightgrey;
                border-bottom: 1px solid lightgrey;
            }

            #tabnav li.active {
                border-right: 1px solid white;
                background: white;
            }

            #tabnav li.normal {
                border-right: 1px solid white;
                background: red;
            }

        #tab_content {
            float: right;
            width: 650px;
            *width: 394px;
            background: white;
            height: 400px;
            overflow: hidden;
            border-top: 1px solid lightgrey;
            border-right: 1px solid lightgrey;
            border-bottom: 1px solid lightgrey;
            border-left: 0px solid lightgrey;
        }

            #tab_content .content {
                padding: 15px;
                -moz-border-radius: 5px;
                height: 400px;
            }

        .ac1, .ac6 {
            margin-left: 50px;
        }

        .ac2 {
            margin-left: 66px;
        }

        .ac3 {
            margin-left: 82px;
        }

        .ac4 {
            margin-left: 66px;
        }

        .ac5 {
            margin-left: 50px;
        }

        .ac1, .ac2, .ac3, .ac4, .ac5, .ac6 {
            margin-top: 25px;
        }

        .ac7 {
            margin-top: 35px;
            margin-left: 160px;
        }

        .abc1.abc2, .abc3 {
            margin: 0px auto;
        }

        .abc1, .abc2, .abc3 {
            margin-top: 40px;
            margin-left: 150px;
        }

        .dc1 {
            margin-top: 30px;
            margin-left: 150px;
        }

        tr td {
            text-align: center;
        }

        .cc1 {
            margin-top: 50px;
            margin-left: 80px;
            float: left;
        }

        .cc1_right {
            margin-top: 70px;
            margin-right: 80px;
            border: 1px dashed green;
            border-radius: 5px;
            float: right;
        }

        .clabel16 {
            margin-left: -7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>--%>
    <div class='container'>
        <div id="tab_content">
            <div id="a" class="content">
                <div class="abc1">
                    <asp:Label ID="Label7" runat="server" Text="手机号码：" CssClass="cLabel2"></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text="无"></asp:Label>
                </div>
                <div class="abc2">
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="旧密码：" CssClass="cLabel2"></asp:Label>
                    <asp:TextBox ID="txtBoldPwd" runat="server" Height="30px" Width="250" TextMode="Password"></asp:TextBox>
                </div>
                <div class="abc3">
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Text="新密码：" CssClass="cLabel2"></asp:Label>
                    <asp:TextBox ID="txtBnewPwd" runat="server" Height="30px" Width="250" TextMode="Password"></asp:TextBox>
                </div>
                <div class="abc4" style="margin: 40px auto; text-align: center">
                    <asp:Button ID="btn_QRXG" OnClick="btn_QRXG_Click" runat="server" Text="确认修改" Height="30px" Width="150px" />
                </div>
            </div>
            <div id="f" class="content">
                <div class="ac1">
                    <asp:Label ID="Label1" runat="server" Text="手机号码：" CssClass="cLabel1" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lab_mobileNum" runat="server" Text="无" ForeColor="Red"></asp:Label>
                </div>
                <div class="ac2">
                    <asp:Label ID="Label2" runat="server" Text="姓名：" CssClass="cLabel1" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lab_Name" runat="server" Text="无" ForeColor="Red"></asp:Label>
                </div>
                <div class="ac3">
                    <asp:Label ID="Label3" runat="server" Text="性别："></asp:Label>
                    <asp:RadioButton ID="sexBoy" runat="server" Text="男" GroupName="sex" />
                    <asp:RadioButton ID="sexGril" runat="server" Text="女" GroupName="sex" />
                    <asp:RadioButton ID="sexBaoMi" runat="server" Text="保密" GroupName="sex" />
                </div>
                <div class="ac4">
                    <asp:Label ID="Label4" runat="server" Text="所在地："></asp:Label>
                    <asp:DropDownList ID="ddl_shengF" runat="server" Width="70" AutoPostBack="True" OnSelectedIndexChanged="ddl_shengF_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddl_chengShi" runat="server" Width="70px">
                    </asp:DropDownList>
                </div>
                <div class="ac5">
                    <asp:Label ID="Label5" runat="server" Text="银行卡号："></asp:Label>
                    <asp:TextBox ID="txtB_accountNum" Text="无" runat="server" Height="25px" Width="250"></asp:TextBox>
                </div>
                <div class="ac6">
                    <asp:Label ID="Label6" runat="server" Text="身份证号：" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lab_IDNum" runat="server" Text="无" ForeColor="Red"></asp:Label>
                </div>
                <div class="ac7">
                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" runat="server" Text="修改" Width="100px" />
                </div>
            </div>
            <div id="c" class="content">
                <div class="cc1">
                    <asp:Label ID="Label8" runat="server" Text="头像修改"></asp:Label><br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="仅支持JPG、GIF、PNG图片文件，且文件小于5M" Font-Size="10px" ForeColor="Gray" Style="margin-top: 20px;"></asp:Label><br />
                    <asp:FileUpload ID="FileUpload1" runat="server" Style="margin-top: 25px;" /><br />
                    <br />
                    <asp:Button ID="btn_ccBaoc" OnClick="btn_ccBaoc_Click" runat="server" Text="保存" Width="100px" Style="margin-top: 25px;" />
                </div>
                <div class="cc1_right">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/用户.png" CssClass="cImage1" Width="150" Height="150" />
                </div>
            </div>
            <div id="d" class="content">
                <div class="dc1">
                    <asp:Label ID="Label12" runat="server" Text="新增收货地址:" ForeColor="Red" Font-Size="15px"></asp:Label><br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="地址信息" ForeColor="Red"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Width="250px" Height="30px"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="邮政编码"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" Width="250px" Height="30px"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="Label16" runat="server" Text="收货人姓名" ForeColor="Red" CssClass="clabel16"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" Width="250px" Height="30px"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="Label17" runat="server" Text="手机号码" ForeColor="Red"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TextBox4" runat="server" Width="250px" Height="30px"></asp:TextBox><br />
                    <br />
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <asp:Label ID="Label18" runat="server" Text="设为默认地址"></asp:Label><br />
                    <br />
                    <asp:Button ID="dc_btnBaoc" OnClick="dc_btnBaoc_Click" runat="server" Text="保存" Width="70px" />
                </div>
            </div>
            <div id="e" class="content" style="overflow-y:auto">
                <asp:Repeater ID="rpHuiBao" runat="server">
                    <HeaderTemplate>
                        <table style="width: 100%;" border="1" class="HBtable1">
                            <tr>
                                <th>序号</th>
                                <th>项目名称</th>
                                <th>收到的回报</th>
                                <th>回报的时间</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1%></td>
                            <td><%#Eval("content") %></td>
                            <td><%#Eval("huiBaoCtn") %></td>
                            <td><%#Eval("huiBaoTime") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div>
            <ul id='tabnav'>
                <li class='active'>
                    <a href="#a">密码修改</a>
                </li>
                <li>
                    <a href="#f">资料修改</a>
                </li>
                <li>
                    <a href="#c">头像修改</a>
                </li>
                <li>
                    <a href="#d">收件地址管理</a>
                </li>
                <li>
                    <a href="#e">我得到的回报</a>
                </li>
                <li>
                    <a href="#e"></a>
                </li>
            </ul>
        </div>
    </div>
    <%--        </ItemTemplate>
    </asp:Repeater>--%>
    <script type="text/javascript">
        function changeStyle() {
            this.onclick = function () {
                var list = this.parentNode.childNodes;
                for (var i = 0; i < list.length; i++) {
                    if (1 == list[i].nodeType && 'active' == list[i].className) {
                        list[i].className = "";
                    }
                }
                this.className = 'active';
            }
        }
        var tabs = document.getElementById('tabnav').childNodes;
        for (var i = 0; i < tabs.length; i++) {
            if (1 == tabs[i].nodeType) {
                changeStyle.call(tabs[i]);
            }
        }
    </script>
</asp:Content>
