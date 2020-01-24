<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="WebUI.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="content/index.css" rel="stylesheet" />
    <link href="content/progress.css" rel="stylesheet" />
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".ll").addClass("bbClick");
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
        .content {
            width: 230px;
            margin: 0px auto;
        }

            .content > div {
                margin-top: 50px;
            }

        .ctn3--middle-top {
            width: 1000px;
            height: auto;
            margin: 20px auto;
        }

            .ctn3--middle-top ul li {
                float: left;
            }

            .ctn3--middle-top ul li {
                margin-left: 10px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ctn3" style="margin: 60px auto">
        <%--        <div class="ctn3--middle-top">
            <ul>
                <li>
                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="众筹中" />
                </li>
                <li>
                    <asp:Button ID="Button2" OnClick="Button2_Click" runat="server" Text="已完成" />
                </li>
                <li>
                    <asp:Button ID="Button3" OnClick="Button3_Click" runat="server" Text="已失败" />
                </li>
            </ul>
        </div>--%>
        <div style="clear: both"></div>
        <div class="ctn3_middle" style="text-align: left">
            <asp:Repeater ID="rpProject" runat="server">
                <HeaderTemplate>
                    <script src="js/progress.js"></script>
                    <div class="ctn3_middle_gird1">
                </HeaderTemplate>
                <ItemTemplate>
                    <dl style="margin-right: 20px; position: relative;">
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("projectID") %>' />
                        <asp:LinkButton ID="runat_redLove" CommandArgument='<%#Eval("projectID") %>' OnClick="runat_redLove_ServerClick" runat="server" Style="display: block" class="red_love">
                                <div class="rl_ctn1">
                                    <img src="Icons/爱心图标.png" />
                                </div>
                                <div class="rl_ctn2"><%#Eval("heart") %></div>
                        </asp:LinkButton>
                        <dt><a href='projectDetails.aspx?projectID=<%#Eval("projectID") %>'>
                            <img width="230" height="180" src='<%#"images/"+Eval("projectImg") %>' alt="Alternate Text" /></a></dt>
                        <dd class="dlMax1"><%#Eval("content").ToString() %></dd>
                        <dd class="dlMin1">目标：<%#(DateTime.Parse(Eval("endTime").ToString())-DateTime.Parse(Eval("beginTime").ToString())).Days.ToString().Split('.')[0]%>天￥<%#Eval("money").ToString().Split('.')[0] %><span class="dlMin1_span"><%#Eval("State") %></span></dd>
                        <dd style="margin-top: 10px; margin-left: 15px">
                            <div class="jdt1">
                                <div class="jdt2" style='width: <%#Eval("JD") %>%;'></div>
                            </div>
                            <span style="position: relative; top: -5px;"><%#Eval("JD").ToString().Substring(0,4) %>%</span>
                        </dd>
                        <dd style="position: relative; right: 60px; top: 5px">已筹资<span>￥<%#Eval("getedMoney").ToString().Split('.')[0] %></span></dd>
                        <dd style="position: relative; left: 50px; top: -15px">还剩<span><%#(DateTime.Parse(Eval("endTime").ToString()) - DateTime.Now).Days.ToString().Split('.')[0]%>天</span></dd>
                    </dl>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                    <style>
                        .red_love:hover {
                            cursor: pointer;
                        }

                        .jdt1 {
                            width: 160px;
                            background: white;
                            float: left;
                            border: 1px solid gray;
                        }

                        .jdt1,
                        .jdt2 {
                            height: 10px;
                            border-radius: 3px;
                        }

                        .jdt2 {
                            background: orange;
                        }
                    </style>
                    <script>
                        $(function () {
                            $(".red_love").click(function () {
                                var $nums = $(".rl_ctn2").html();
                                $(".rl_ctn2").html($nums + 1);
                            });
                        })
                    </script>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="white--div" style="width: 100%; height: 30px; background: #F3F3F3"></div>
    </div>

</asp:Content>
