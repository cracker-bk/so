<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebUI.shouye" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="content/index.css" rel="stylesheet" />
    <link href="content/progress.css" rel="stylesheet" />
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            $("a").removeClass("bbClick");
            $(".sy").addClass("bbClick");
            //$('.register_li_display,.login_li_display').hide();
            //$('.diy_select').css('display', 'block');
        });
    </script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .slider ul li {
            list-style: none;
        }

        .slider img {
            width: 1000px;
            height: 500px;
        }

        .slider {
            width: 1000px;
            height: 500px;
            margin: 0px auto;
            position: relative;
            cursor: pointer;
        }

            .slider li {
                position: absolute;
                display: none;
            }

                .slider li:first-child {
                    display: block;
                }

        .arrow_left, .arrow_right {
            font-family: "SimSun",'宋体';
            width: 30px;
            height: 60px;
            background-color: rgba(0,0,0,.2);
            position: absolute;
            top: 45%;
            text-align: center;
            line-height: 60px;
            color: #fff;
            font-weight: 700;
            font-size: 30px;
        }

        .arrow_left {
            left: 0;
        }

        .arrow_right {
            right: 0;
        }

            .arrow_left:hover, .arrow_right:hover {
                background-color: rgba(0,0,0,.6);
            }

        .tab {
            position: absolute;
            bottom: 20px;
            left: 42%;
        }

            .tab span {
                display: inline-block;
                width: 10px;
                height: 10px;
                border-radius: 10px;
                margin-left: 20px;
                border: 3px solid #fff;
                float: left;
            }

                .tab span:first-child {
                    margin-left: 0;
                }

        .slider .tab .show {
            border: 3px solid #F16D2C;
        }
    </style>
    <style type="text/css">
        .content {
            width: 230px;
            margin: 0px auto;
        }

            .content > div {
                margin-top: 50px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="section">
        <div class="ctn2">
            <div class="slider">
                <ul>
                    <li><a href="#">
                        <img src="luoBo/timg.jpg"></a></li>
                    <li><a href="#">
                        <img src="luoBo/timg2.jpg" alt=""></a></li>
                    <li><a href="#">
                        <img src="luoBo/luobo_xila.jfif" alt="" /></a></li>
                    <li><a href="#">
                        <img src="luoBo/lunbo_movie.jpg" alt="" /></a></li>
                    <li><a href="#">
                        <img src="luoBo/timg5.jpg" alt=""></a></li>
                </ul>
                <!-- 左右箭头 -->
                <div class="arrow">
                    <span class="arrow_left">&lt;</span>
                    <span class="arrow_right">&gt;</span>
                </div>
                <div class="tab">
                    <span class="show"></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript">
            $(function () {
                var index = 0;
                var timer = null;
                // 定时器自动播放
                function sliderTimer() {
                    timer = setInterval(function () {
                        index++;
                        if (index == $('.slider li').length) {
                            index = 0;
                        }
                        sliderIndex(index)
                    }, 3000)
                }
                sliderTimer()

                // 根据索引值点亮小圆点并显示对应图片
                function sliderIndex(index) {
                    // 对应图片显示
                    $('.slider li').eq(index).fadeIn(600).siblings().fadeOut(600);

                    // 小圆点点亮
                    $('.tab span').eq(index).addClass('show').siblings().removeClass('show')
                }

                // 小圆点点击事件
                $('.tab span').click(function () {
                    clearInterval(timer)
                    index = $(this).index()
                    sliderIndex(index)
                })

                // 左侧按钮点击事件
                $('.arrow_left').click(function () {
                    index--;
                    if (index == -1) {
                        index = $('.slider li').length - 1;
                    }
                    sliderIndex(index)
                })

                // 右侧按钮点击事件
                $('.arrow_right').click(function () {
                    index++;
                    if (index == $('.slider li').length) {
                        index = 0;
                    }
                    sliderIndex(index)
                })

                // 鼠标移入轮播区域关闭定时器
                $('.slider').mouseenter(function () {
                    clearInterval(timer);
                })

                // 鼠标移出轮播区域开启定时器
                $('.slider').mouseleave(function () {
                    sliderTimer();
                })
            })
        </script>
        <div class="ctn3">
            <div class="ctn3_banner" style="border: none">
                <span class="f_li" style="font-weight: bold; font-size: 24px; color: #585856; width: 120px;">热门推荐：</span>
                <asp:Button OnClick="btnKj_Click" ID="btnKj" runat="server" Text="科技" class="btnType btnType2 f_btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnYs_Click" ID="btnYs" runat="server" Text="艺术" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnSj_Click" ID="btnSj" runat="server" Text="设计" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnMusic_Click" ID="btnMusic" runat="server" Text="音乐" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnDm_Click" ID="btnDm" runat="server" Text="动漫" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnGy_Click" ID="btnGy" runat="server" Text="公益" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnNy_Click" ID="btnNy" runat="server" Text="农业" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnStudy_Click" ID="btnStudy" runat="server" Text="学习" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnCb_Click" ID="btnCb" runat="server" Text="出版" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnMovie_Click" ID="btnMovie" runat="server" Text="影视" class="btnType btnType2" BackColor="White" Width="40px" />
                <asp:Button OnClick="btnOthers_Click" ID="btnOthers" runat="server" Text="其它" class="btnType btnType2" BackColor="White" Width="40px" />
            </div>
            <div class="ctn3_middle">
                <asp:Repeater ID="rpProject" runat="server" OnItemCommand="rpProject_ItemCommand">
                    <HeaderTemplate>
                        <script src="js/progress.js"></script>
                        <div class="ctn3_middle_gird1">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <dl style="margin-right: 20px; position: relative">
                            <%--                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("projectID") %>' />--%>
                            <asp:LinkButton ID="runat_redLove" CommandArgument='<%#Eval("projectID") %>' OnClick="runat_redLove_Click" runat="server" Style="display: block" class="red_love">
                                <div class="rl_ctn1">
                                    <img src="Icons/爱心图标.png" />
                                </div>
                                <div class="rl_ctn2"><%#Eval("heart") %></div>
                            </asp:LinkButton>
                            <%--                            <a style="display: block" class="red_love" runat="server" id="runat_redLove" onserverclick="runat_redLove_ServerClick">
                                <div class="rl_ctn1">
                                    <img src="Icons/爱心图标.png" />
                                </div>
                                <div class="rl_ctn2"><%#Eval("heart") %></div>
                            </a>--%>
                            <dt><a href='projectDetails.aspx?projectID=<%#Eval("projectID") %>'>
                                <img width="230" height="180" src='<%#"images/"+Eval("projectImg") %>' alt="Alternate Text" /></a></dt>
                            <dd class="dlMax1"><%#Eval("content") %></dd>
                            <dd class="dlMin1">目标：<%#(DateTime.Parse(Eval("endTime").ToString())-DateTime.Parse(Eval("beginTime").ToString())).Days.ToString().Split('.')[0]%>天￥<%#Eval("money").ToString().Split('.')[0] %><span class="dlMin1_span"><%#Eval("State") %></span></dd>
                            <dd style="margin-top: 10px;margin-left:15px">
                                <div class="jdt1">
                                    <div class="jdt2" style='width: <%#Eval("JD") %>%;'></div>
                                </div>
                                <span style="position: relative; top: -5px;"><%#Eval("JD").ToString().Substring(0,4) %>%</span>
                            </dd>
                            <dd style="position: relative; right: 60px; top: 5px">已筹资<span>￥<%#Eval("getedMoney").ToString().Split('.')[0] %></span></dd>
                            <dd style="position: relative; left: 50px; top: -15px; width: 200px">还剩<span><%#(DateTime.Parse(Eval("endTime").ToString()) - DateTime.Now).Days.ToString().Split('.')[0]%>天</span></dd>
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
                <div class="ctn3_end_middle">
                    <asp:Button ID="btnMore" runat="server" OnClick="btnMore_Click" Text="更多项目" ForeColor="#FF3300" Height="45px" Width="120px" BorderStyle="Solid" BorderColor="#CCCCCC" BackColor="White" Font-Size="18px" />
                </div>
            </div>
        </div>
        <div class="ctn4">
            <div id="sucnav">
                <div class="clearfix">
                    <h3>成功案例<span>他们已经成功了，你还在等什么...</span></h3>
                    <ul>
                        <li><a href="#">奖励</a></li>
                        <li>/</li>
                        <li><a href="#">公益</a></li>
                    </ul>
                </div>
                <div class="sulc">
                    <div class="sumdex">
                        <div class="img">
                            <a href="#">
                                <img src="../images/0103.jpg"></a>
                        </div>
                        <div class="wenzi">
                            <h3>侃球俱乐部<span><a href="#">"《永远20》，我们的NBA，我们的青春集结令"</a></span></h3>
                            <p>
                                杨毅，著名篮球评论员，《体坛周报》副主编。个人微信公号《杨毅侃球》为体育领域最具影响力自媒体。 杨毅将20<br />
                                年关于青春、有关NBA黄金时代汇集成新书《永远20：我们的NBA》，涵盖了过去20年NBA最引人注目、对整个篮
								<br />
                                球世界影响最大的20个事件、人物或文化现象，阐述篮球世界以及社会的改变。
                            </p>
                        </div>
                    </div>
                    <div class="sucR">
                        <div>
                            <p class="scp">105万</p>
                            <p class="ftp">已筹资</p>
                        </div>
                        <div>
                            <p class="scp">14434人</p>
                            <p class="ftp">支持人数</p>
                        </div>
                    </div>
                </div>
                <div class="sulc">
                    <div class="sumdex">
                        <div class="img">
                            <a href="#">
                                <img src="../images/6643.jpg"></a>
                        </div>
                        <div class="wenzi">
                            <h3>天真蓝教育传媒<span><a href="#">""六个口袋"，亲子阅读计划---1000个家庭招募中"</a></span></h3>
                            <p>
                                一群视阅读如信仰的年轻父母，TA们有1岁到10岁的孩子，为了自由呼吸的教育，发起成立了北京天真蓝教育文化传<br />
                                媒有限公司。计划征集1000个家庭，用6个月时间，以“游戏+阅读”的方式，让孩子在父母的陪伴下，在专家的指<br />
                                导下，爱上阅读，学会阅读。会阅读的孩子有更广阔的未来，有爱好的人精神世界更宽广。
                            </p>
                        </div>
                    </div>
                    <div class="sucR">
                        <div>
                            <p class="scp">47万</p>
                            <p class="ftp">已筹资</p>
                        </div>
                        <div>
                            <p class="scp">662人</p>
                            <p class="ftp">支持人数</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ctn5">
            <p>网站简介</p>
            <div class="ctn5_video">
                <video width="100%" height="500" controls="controls">
                    <source src="video/拾柴网.mp4" />
                </video>
            </div>
        </div>
    </section>
</asp:Content>
