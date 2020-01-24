<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="lft_project.aspx.cs" Inherits="WebUI.lft_project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="content/reset.css" rel="stylesheet" />
    <script src="js/jquery-1.11.0.min.js"></script>
    <script>
        //$(function () {
        //    $("a").removeClass("bbClick");
        //})
        $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            $('.register_li_display,.login_li_display').hide();
            $('.diy_select').css('display', 'block');
        });
    </script>
    <style type="text/css">
        #grayBackP, .demo {
            font: 12px/180% Arial, Helvetica, sans-serif, "宋体";
        }

        #grayBackP {
            margin-top: 20px;
            width: 100%;
            height: 200px;
            background-color: #F3F3F3;
        }

        .gBP_1 {
            width: 1000px;
            height: auto;
            overflow: hidden;
            margin: 0 auto;
        }

        .gBP_11 {
            float: left;
        }

        .gBP_12 {
            width: 600px;
            height: 100px;
            float: left;
            position: relative;
            left: 40px;
            top: 45px;
        }

        .cimgBtn_tx {
            margin-top: 25px;
            border-radius: 5px;
        }

        .cbtn_info {
            margin-left: 20px;
        }

        #grayBackP a, .demo a {
            color: #333;
            text-decoration: none;
        }

        #grayBackP a, #demo a:hover {
            color: #3366cc;
            text-decoration: underline;
        }
        /* demo */

        .demo {
            width: 1000px;
            margin: 0px auto;
            position: relative;
            top: -30px;
            background-color: white;
        }
        /* tabbtn */

        .tabbtn {
            height: 50px;
            background: url(images/tabbg.gif) repeat-x;
            border-left: solid 1px #ddd;
            border-right: solid 1px #ddd;
        }

            .tabbtn li {
                float: left;
                position: relative;
                margin: 0 0 0 -1px;
            }

                .tabbtn li a {
                    display: block;
                    float: left;
                    height: 27px;
                    line-height: 27px;
                    overflow: hidden;
                    width: 333px;
                    text-align: center;
                    font-size: 12px;
                    cursor: pointer;
                }

                .tabbtn li.current {
                    border-left: solid 1px #d5d5d5;
                    border-right: solid 1px #d5d5d5;
                    border-top: solid 1px #c5c5c5;
                }

                    .tabbtn li.current a {
                        border-top: solid 2px #ff6600;
                        height: 30px;
                        line-height: 30px;
                        background: #fff;
                        color: #3366cc;
                        font-weight: 800;
                    }
        /* tabcon */

        .tabcon {
            border-width: 0 1px 1px 1px;
            border-color: #ddd;
            border-style: solid;
            position: relative;
            /*必要元素*/
            height: 500px;
            overflow: hidden;
        }

            .tabcon .subbox {
                position: absolute;
                /*必要元素*/
                left: 0;
                top: 0;
            }

            .tabcon .sublist {
                padding: 5px 10px;
                height: 500px;
            }

        .lft__table2 {
            width: 100%;
            text-align: center;
        }

            .lft__table2 tr td {
                width: 20%;
            }

        .btnSiGE {
            margin-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="grayBackP">
        <div class="gBP_1">
            <div class="gBP_11">
                <asp:ImageButton ID="imgBtn_tx" runat="server" Width="120px" Height="120px" ImageUrl="~/images/用户.png" CssClass="cimgBtn_tx" />
            </div>
            <div class="gBP_12">
                <asp:Label ID="Label1" runat="server" Text="无"></asp:Label>
                <asp:Button ID="btn_info" runat="server" Text="个人设置" CssClass="cbtn_info" OnClick="btn_info_Click" />
                <br />
                <asp:Label ID="labTime" runat="server" Text='加入时间：' CssClass="clabTime"></asp:Label>
                <br />
                <asp:Label ID="labPosition" runat="server" Text="所在地区：暂未添加"></asp:Label>
            </div>
        </div>
    </div>
    <div class="demo">
        <ul class="tabbtn" id="normaltab">

            <li class="current">
                <a href="#">发起的项目</a>
            </li>

            <li>
                <a href="#">支持的项目</a>
            </li>
            <li>
                <a href="#">我的支持人</a>
            </li>
        </ul>
        <!--tabbtn end-->

        <div class="tabcon" id="normalcon">
            <div class="sublist">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table class="lft__table2">
                            <tr>
                                <th style="text-align: left">项目名称</th>
                                <th>发布日期</th>
                                <th>截止日期</th>
                                <th>目标</th>
                                <th>状态</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 35%; text-align: left">
                                <img style="border-radius: 2px" width="40" height="30" src='images/<%#Eval("projectImg") %>' alt='<%#Eval("content") %>' /><span style="position: relative; top: -10px; left: 20px"><%#Eval("content") %></span>
                            </td>
                            <td><%#DateTime.Parse(Eval("beginTime").ToString()).ToShortDateString() %></td>
                            <td><%#DateTime.Parse(Eval("endTime").ToString()).ToShortDateString() %></td>
                            <td><%#Eval("money") %>元</td>
                            <td><%#Eval("State") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <!--tabcon end-->

            <div class="sublist">
                <asp:Repeater ID="Repeater2" runat="server">
                    <HeaderTemplate>
                        <table class="lft__table2">
                            <tr>
                                <th style="text-align: left">项目名称</th>
                                <th>发布日期</th>
                                <th>截止日期</th>
                                <th>目标</th>
                                <th>状态</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 35%; text-align: left">
                                <img style="border-radius: 2px" width="40" height="30" src='images/<%#Eval("projectImg") %>' alt='<%#Eval("content") %>' /><span style="position: relative; top: -10px; left: 20px"><%#Eval("content") %></span>
                            </td>
                            <td><%#DateTime.Parse(Eval("beginTime").ToString()).ToShortDateString() %></td>
                            <td><%#DateTime.Parse(Eval("endTime").ToString()).ToShortDateString() %></td>
                            <td><%#Eval("money") %>元</td>
                            <td><%#Eval("State") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <!--tabcon end-->

            <div class="sublist">
                <asp:Repeater ID="Repeater3" runat="server">
                    <HeaderTemplate>
                        <table class="lft__table2">
                            <tr>
                                <th>姓名</th>
                                <th>地址</th>
                                <th>手机号码</th>
                                <th>卡号</th>
                                <th>他（她）所支持过您的项目名称</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr onmouseover="this.style.backgroundColor='#F3F3F3'" onmouseout="this.style.backgroundColor=''">
                            <td><%# Eval("accountName") %></td>
                            <td><%# Eval("address") %></td>
                            <td><%# Eval("mobileNum") %></td>
                            <td><%# Eval("accountNum") %></td>
                            <td><%#Eval("content") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <!--tabcon end-->
        </div>
        <!--tabcon end-->
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" src="js/jquery.tabso_yeso.js"></script>

    <script type="text/javascript">
        $(document).ready(function ($) {

            //默认选项卡切换

            $("#normaltab").tabso({

                cntSelect: "#normalcon",

                tabEvent: "mouseover",

                tabStyle: "normal"

            });

        });
    </script>
</asp:Content>
