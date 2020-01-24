<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="return.aspx.cs" Inherits="WebUI._return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="content/return.css" rel="stylesheet" />
    <script src="js/jquery-1.11.1.min.js"></script>
    	<link rel="stylesheet" href="dateShow/dateSelect.css">
        <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            $('.register_li_display,.login_li_display').hide();
            $('.diy_select').css('display', 'block');
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
                    var txt = "删除成功";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                    break;
                case "error1":
                    var txt = "恭喜你出错了，这个错误100年都没遇到过";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "error2":
                    var txt = "您还没有保存回报呢！请单击回报按钮";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
            }
        }
    </script>
    <%-- 弹窗结束 --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="centen">
        <img src="images/shou_xmxx2.png" />
        <br />
        <div id="left">
            <h2 style="margin-top: 20px;">回报设置</h2>
            <br />
            <hr />
            <br />
            <div id="mian">
                <div class="mainGV">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="huiBaoID" HeaderText="回报ID" />
                            <asp:BoundField DataField="zhiChiMoney" HeaderText="支持金额" />
                            <asp:BoundField DataField="mingE" HeaderText="名额" />
                            <asp:BoundField DataField="huiBaoCtn" HeaderText="回报内容" />
                            <asp:BoundField DataField="huiBaoTime" HeaderText="回报时间" />
                            <asp:BoundField DataField="yunFee" HeaderText="运费" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle Height="25px" BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle Height="25px" HorizontalAlign="Center" Width="200px" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>

                <br />
                <div id="hb">
                    <label style="margin-left: 25px;">支持回报选项02</label>
                </div>
                <div id="lp">
                    <ul>
                        <li style="margin-left: 25px;">支持金额：<asp:TextBox ID="jine" runat="server" />元</li>
                        <li style="margin-left: 25px;">回报内容：<textarea runat="server" id="ff" style="width: 500px; height: 80px;" placeholder="请填写关于回报或任何你希望项目发起人知道的信息，不多于500字"></textarea>
                        </li>
                        <li style="margin-left: 25px;">限定名额：<asp:TextBox runat="server" ID="minge" Text="0"></asp:TextBox>&nbsp;个&nbsp;<label></label></li>
                        <li style="margin-left: 25px;">运费：<asp:TextBox runat="server" ID="yunfei" Text="0"></asp:TextBox><label></label></li>
                        <li style="margin-left: 25px;">回报时间：<input type="text" name="name" value="" id="date" runat="server"/></li>
                             <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="dateShow/dateSelect.js"></script>
                <script type="text/javascript">
                    $("#ContentPlaceHolder1_date").dateSelect();
                </script>	
                        <li style="margin-left: 25px;">
                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" ImageUrl="~/images/bt_bc.png" />
                        </li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </li>
                    </ul>
                </div>
            </div>

            <div style="border: 0.5px dashed #ccc; width: 100%; margin-bottom: 20px;"></div>
            <div style="width: 100%; height: 58px; margin-bottom: 10px;">
                <div style="float: right; width: 220px; height: 56px;">
                    <asp:ImageButton style="margin-left:100px" ID="ImageButton4" runat="server" ImageUrl="~/images/bt_go.png" OnClick="ImageButton4_Click"/>
                </div>
            </div>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>

</asp:Content>
