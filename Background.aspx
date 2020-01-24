<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Background.aspx.cs" Inherits="Crowdfunding.Background" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="content/Background.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="head_" class="zt">
            <div id="headid">
                <span style="margin-left: 19%"><b>甜橙众筹后台管理界面</b></span>
            </div>
            <%-- 头部结束 --%>
            <div id="background">
                <div id="nav">
                    <ul>
                        <li>
                            <asp:Button ID="Button1" runat="server" Text="用户管理" CssClass="btn_" BackColor="#EE5F59" Font-Size="15px" ForeColor="White" Height="40px" OnClick="Button1_Click" Width="200px" /></li>
                        <li>
                            <asp:Button ID="Button2" runat="server" Text="项目管理" CssClass="btn_" BackColor="#EE5F59" Font-Size="15px" ForeColor="White" Height="40px" Width="200px" OnClick="Button2_Click" /></li>
                        <li>
                            <asp:Button ID="Button4" runat="server" Text="评论管理" CssClass="btn_" BackColor="#EE5F59" Font-Size="15px" ForeColor="White" Height="40px" Width="200px" OnClick="Button4_Click" /></li>
                    </ul>
                </div>
                <div id="nr" style="overflow-y:auto">
                    <div id="user" runat="server">
                        <div class="ss">
                            搜索条件：<asp:DropDownList ID="ddl_user" runat="server" Height="25px">
                                <asp:ListItem Value="mobileNum">手机号码</asp:ListItem>
                                <asp:ListItem Value="isHave">用户状态</asp:ListItem>
                                <asp:ListItem Value="isManager">权限</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txt_user" runat="server" Width="250px" Height="21px"></asp:TextBox>
                            <asp:Button ID="btn_user" runat="server" BackColor="#EE5F59" Height="25px" Text="搜索" Width="70px" OnClick="btn_user_Click" />
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <asp:GridView ID="gv_user" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="30px" OnPageIndexChanging="gv_user_PageIndexChanging" OnRowDeleting="gv_user_RowDeleting" Width="775px" HorizontalAlign="Center" OnSelectedIndexChanging="gv_user_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="手机号码" DataField="mobileNum" />
                                            <asp:BoundField HeaderText="真实姓名" DataField="accountName" />
                                            <asp:BoundField HeaderText="用户状态" DataField="isHave" />
                                            <asp:BoundField HeaderText="权限" DataField="isManager" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnStop" runat="server" OnClick="lbtnStop_Click" CommandArgument='<%#Eval("mobileNum") %>'>停用</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnUseing" runat="server" OnClick="lbtnUseing_Click" CommandArgument='<%#Eval("mobileNum") %>'>使用</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle Height="30px" />
                                        <RowStyle Height="25px" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%-- 用户结束 --%>
                    <div id="project" runat="server">
                        <div class="ss">
                            搜索条件：<asp:DropDownList ID="ddl_Pro" runat="server" Height="25px">
                                <asp:ListItem Value="content">项目名称</asp:ListItem>
                                <asp:ListItem Value="State">项目状态</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txt_Pro" runat="server" Width="250px" Height="21px"></asp:TextBox>
                            <asp:Button ID="btn_Pro" runat="server" BackColor="#EE5F59" Height="25px" Text="搜索" Width="70px" OnClick="btn_Pro_Click" />
                            <asp:Label ID="lb_Pro" runat="server" ForeColor="#EE5F59"></asp:Label>
                        </div>
                        <asp:Repeater ID="rpt_pro" runat="server" OnItemCommand="rpt_pro_ItemCommand">
                            <ItemTemplate>
                                <div class="Pro_ID">
                                    <%# Eval("projectID") %>
                                </div>
                                <div class="Pro_Pic">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+ Eval("projectImg") %>' CssClass="pic" />
                                </div>
                                <div class="Pro_Name">
                                    <a href="#"><%# Eval("content") %></a>
                                </div>
                                <div class="Pro_State">
                                    <%# Eval("State") %>
                                </div>
                                <div class="Pro_Cz">
                                    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" CommandName="Delete" Text="删除" CommandArgument='<%# Eval("projectID") %>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server" CommandName="Update" Text="通过" CommandArgument='<%# Eval("projectID") %>'></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
<%--                        <div>
                            <%=this.pagingHtml %>
                        </div>--%>
                    </div>
                    <%-- 项目结束 --%>
                    <div id="Comment" runat="server">
                        <div class="ss">
                            搜索条件：
                            <asp:DropDownList ID="ddl_comment" runat="server" Height="25px">
                                <asp:ListItem Value="accountName">评论者</asp:ListItem>
                                <asp:ListItem Value="commentTime">时间</asp:ListItem>
                                <asp:ListItem Value="content">被评论项目</asp:ListItem>
                                <asp:ListItem Value="commentCtn">评论内容</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txt_comment" runat="server" Width="250px" Height="22px"></asp:TextBox>
                            <asp:Button ID="btn_comment" runat="server" BackColor="#EE5F59" Height="26px" Text="搜索" Width="70px" OnClick="btn_comment_Click" />
                            <asp:Label ID="lb_tip" runat="server" ForeColor="#EE5F59"></asp:Label>
                        </div>
                        <asp:GridView ID="gv_comment" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gv_comment_PageIndexChanging" Width="775px" OnRowDeleting="gv_comment_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="commentID" HeaderText="评论ID" />
                                <asp:BoundField HeaderText="评论者" DataField="accountName" />
                                <asp:BoundField HeaderText="评论内容" DataField="commentCtn" />
                                <asp:BoundField HeaderText="时间" DataField="commentTime" />
                                <asp:BoundField DataField="content" HeaderText="被评论项目" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <HeaderStyle Height="30px" />
                            <RowStyle Height="25px" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <%-- 评论结束 --%>
                </div>
                <%-- 中间结束 --%>
            </div>
            <div id="foot">
                <p class="foot">&copy;2019年高软三班科技有限公司zhongchou.com版权所有&nbsp;|&nbsp;1000湘ICP备999号</p>
            </div>
            <%-- 尾部结束 --%>
        </div>
    </form>
</body>
</html>
