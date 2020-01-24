<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="projectDetails.aspx.cs" Inherits="WebUI.projectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <link href="content/reset.css" rel="stylesheet" />
    <link href="content/projectDetails.css" rel="stylesheet" />
    <link href="content/progress.css" rel="stylesheet" />
    <link href="content/onlinebusinesshall/newexpand/css/index-debug.css" rel="stylesheet" />
    <link href="content/buZhou.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="static/lib/jquery-step/css/jquery.step.css">
    <link href="content/index.css" rel="stylesheet" />
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
                    var txt = "请登录后进行评论";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
                case "success":
                    var txt = "评论成功，期待您的下次评论";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                    break;
            }
        }
    </script>
    <%-- 弹窗结束 --%>
    <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            //$('.register_li_display,.login_li_display').hide();
            //$('.diy_select').css('display', 'block');
        });
    </script>
    <style type="text/css">
        .content {
            width: 400px;
            margin: 0px auto;
        }

            .content > div {
                margin-top: 50px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content_wrap">
        <div id="ctn__wrap1">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="ctn__wrap1--banner" style="font-size: 24px; font-weight: 700; color: gray">
                        <%#Eval("content") %>
                    </div>
                    <dl class="details_dl_left">
                        <dt>
                            <img src='images/<%#Eval("projectImg") %>' />
                        </dt>
                    </dl>
                    <dl class="details_dl_right">
                        <dt style="margin-top: 20px;"><span style="font-size: 36px; font-weight: bold"><%#Eval("peopleNum") %></span><span>支持数</span><span style="margin-left: 100px; font-size: 24px; color: white; background: red; border-radius: 5px">众筹中</span>
                        </dt>
                        <dd style="margin-top: 30px;"><span style="font-size: 36px; font-weight: bold">￥<%#Eval("getedMoney") %></span><span>已筹金额</span></dd>
                        <dd style="margin-top:80px">
                            <div class="jdt1">
                                <div class="jdt2" style='width: <%#Eval("JD") %>%;'></div>
                            </div>
                            <span style="position: relative; top: -5px;"><%#Eval("JD").ToString().Substring(0,4) %>%</span>
                        </dd>
                        <style>
                            .jdt1 {
                                width: 300px;
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
                        <dd style="text-align: center; margin-top: 45px">
                            <asp:Button ID="btn_ZhiC" runat="server" Text="立即支持" CssClass="cbtn_ZhiC" Width="350" Height="50" OnClick="btn_ZhiC_Click" OnClientClick="xs()" />
                        </dd>
                        <dd style="text-align: center; margin-top: 45px">
                            <div class="bdsharebuttonbox" data-tag="share_1">
                                <span style="float: left; display: block; position: relative; top: 4px">分享到：</span>
                                <a class="bds_mshare" data-cmd="mshare"></a>
                                <a class="bds_qzone" data-cmd="qzone" href="#"></a>
                                <a class="bds_tsina" data-cmd="tsina"></a>
                                <a class="bds_baidu" data-cmd="baidu"></a>
                                <a class="bds_renren" data-cmd="renren"></a>
                                <a class="bds_tqq" data-cmd="tqq"></a>
                                <a class="bds_more" data-cmd="more">更多</a>
                                <a class="bds_count" data-cmd="count"></a>
                            </div>
                            <script>
                                with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
                            </script>
                            <script>
                                window._bd_share_config = {
                                    common: {
                                        bdText: '大家快来投这个项目呀！！！',
                                        bdDesc: '<%=content%>',
            /*自定义分享url地址*/        bdUrl: '<%=Page.Request.Url.ToString()%>',
                                        bdPic: '自定义分享图片'
                                    },
                                    share: [{
                                        "bdSize": 16
                                    }],
                                    slide: [{
                                        bdImg: 0,
                                        bdPos: "right",
                                        bdTop: 100
                                    }],
                                    image: [{
                                        viewType: 'list',
                                        viewPos: 'top',
                                        viewColor: 'black',
                                        viewSize: '16',
                                        viewList: ['qzone', 'tsina', 'huaban', 'tqq', 'renren']
                                    }],
                                    selectShare: [{
                                        "bdselectMiniList": ['qzone', 'tqq', 'kaixin001', 'bdxc', 'tqf']
                                    }]
                                }
                                with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
                            </script>
                        </dd>
                    </dl>
                    <div id="ctn__wrap1--2">
                        <ul class="ctn__wrap1--2--ul">
                            <li style="padding-left: 40px">项目详情</li>
                            <li style="margin-left: 110px; border-left: 1px solid gray">评论</li>
                        </ul>
                    </div>
                    <div class="cwp1-ctn1__left">
                        <p style="margin-left: 30px; font-weight: bold">项目简介：</p>
                        <p style="margin-left: 30px; margin-top: 30px; line-height: 40px">
                            <%#Eval("proJJ") %>
                        </p>
                        <p style="margin: 30px 0px 0px 30px; font-weight: bold">项目详情：</p>
                        <p style="margin: 30px 0px 0px 30px; text-align: center">
                            <span style="display: block; text-align: left; line-height: 40px">&nbsp;&nbsp;
                        <%#Eval("proXQ") %>
                            </span>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="cwp1-ctn1__right">
                <p style="margin-top: 20px; font-size: 24px; font-family: '微软雅黑'">请留下您的评论:</p>
                <asp:TextBox ID="txtB_comment" runat="server" CssClass="ctxtB_comment" Width="300" Height="30" placeHolder="您必须登录后再进行评论"></asp:TextBox>
                <asp:Button ID="btnComment" runat="server" Text="发布" OnClick="btnComment_Click" Width="200" Height="30" CssClass="cbtnComment" />
                <hr style="margin-top: 50px; margin-left: 25px" width="350" />
                <div class="c1c1r1" style="text-align: left">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div style="margin-left: 40px; margin-top: 40px">
                                <img src='images/<%#Eval("userImg") %>' width="30" height="30" style="border-radius: 50%;" /><asp:Label ID="Label1" runat="server" Text='<%#Eval("mobileNum").ToString().Substring(0,3)+"****"+Eval("mobileNum").ToString().Substring(7,4) %>'></asp:Label>
                                <br />
                                <asp:Label ID="lab_pinL1" runat="server" Text='<%#Eval("commentCtn")%>' CssClass="clab_pinL1"></asp:Label>
                            </div>
                            <hr style="margin-top: 30px; margin-left: 25px" width="350" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div style="position: relative; left: 120px; top: 40px">
                        <%=this.pagingHtml %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
