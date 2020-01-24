<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MP_ul11.aspx.cs" Inherits="WebUI.MP_ul11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站版权信息</title>
    <link href="content/reset.css" rel="stylesheet" />
    <style type="text/css">
                .ctn1{
            width:100%;
            height:200px;
        }
        .ctn12{
            float:left;
        }
        .ctn13{
            float:right;
        }
        .ctn12 p {
            font-size: 48px;
            font-weight: bold;
            padding: 30px;
        }
        #btnBack{
            border-radius:5px;
            margin:30px;
        }
        .ctn2 {
            width: 1000px;
            height: auto;
            margin: 0 auto;
            border: 1px solid green;
            overflow: hidden;
        }

        .ctnTitle {
            font-size: 18px;
            font-weight: 400;
        }

        .ctn2 ul li {
            height: 60px;
            line-height: 60px;
        }

        .ctnM {
            margin-left: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ctn1">
            <div class="ctn12"><p>欢迎阅读本网站的版权信息</p></div>
            <div class="ctn13"><asp:Button ID="btnBack" runat="server" Text="<返回首页" BackColor="WhiteSmoke" BorderColor="White" BorderStyle="Solid" ForeColor="#FF3300" Height="40px" Width="100px" OnClick="btnBack_Click" /></div>
        </div>
        <div class="ctn2">
            <ul>
                <li class="ctnTitle">一、网站Logo版权所有，不容随意翻版</li>
                <li class="ctnM">下图即为本网站的Logo</li>
                <li class="ctnM">
                    <img src="images/logo3.jpg" /></li>
                <li class="ctnM" style="padding-top: 0px;">&nbsp;&nbsp;甜橙LOGO其完整软件著作权及相关设计素材均归属于甜橙信息科技有限公
                    司所有。您一旦使用甜橙LOGO，即表示已经明确
                </li>
                <li class="ctnM">得知该软件的完整软件著作权及相
                    关设计素材均归属于甜橙信息科技有限公司所有，同时确认LOGO运算设计得出的所有logo
                </li>
                <li class="ctnM">创意方案的著作权将归属于甜橙信息科技有限公司所有。未经公司管理层许可随意使用甜橙LOGO
                    属于侵权行为，相关侵权所付
                </li>
                <li class="ctnM">责任参考<a style="color: red" href="https://duxiaofa.baidu.com/detail?searchType=statute&from=aladdin_28231&originquery=%E4%BE%B5%E6%9D%83%E8%B4%A3%E4%BB%BB%E6%B3%95&count=92&cid=9ac8800307f3d0ba8d012843e173f823_law">《侵权责任法》。</a></li>
            </ul>
            <ul>
                <li class="ctnTitle">二、网站简介视频版权所有，不容随意转载</li>
                <li class="ctnM">&nbsp;&nbsp;本网站简介视频声未经授权不得转载。如果转载了，即构成侵权相关责任参考<a style="color: red" href="https://duxiaofa.baidu.com/detail?searchType=statute&from=aladdin_28231&originquery=%E4%BE%B5%E6%9D%83%E8%B4%A3%E4%BB%BB%E6%B3%95&count=92&cid=9ac8800307f3d0ba8d012843e173f823_law">《侵权责任法》。</a></li>
            </ul>
            <ul>
                <li class="ctnTitle">三、深入解读《中华人民共和国网络安全法》</li>
                <li class="ctnM">&nbsp;&nbsp;“没有网络安全就没有国家安全”。网络安全已经成为关系国家安全和发展、关系广大人民群众切身利益的重大问题。网络已</li>
                <p class="ctnM" style="line-height: 60px">
                    经成为关系国家安全和发展、关系广大人民群众切身利益的重大问题。网络已经深刻地融入了经济社会生活的各个方面，网络安全威胁也随之向经济社会的各个层面渗透，网络安全的重要性随之不断提高。党的十八大以来，以习近平同志为核心的党中央从总体国家安全观出发，对加强国家网络安全工作作出了重要的部署，对加强网络安全法制建设提出了明确的要求，制定《网络安全法》是适应我们国家网络安全工作新形势、新任务，落实中央决策部署，保障网络安全和发展利益的重大举措，是落实国家总体安全观的重要举措。中国是网络大国，也是面临网络安全威胁最严重的国家之一，迫切需要建立和完善网络安全的法律制度，提高全社会的网络安全意识和网络安全保障水平，使我们的网络更加安
                    全、更加开放、更加便利，也更加充满活力。
在这样的形势下，制定网络安全法是维护国家广大人民群众切身利益的
                    需要，是维护网络安全的客观需要，是落实国家总体安全观的重要举措。《网络安全法》是国家安全法律制度体系中的一部重要法律，是网络安全领域的基本大法，与之前出台的《国家安全法》、《反恐怖主义法》等属同一位阶。《网络安全法》对于确立国家网络安全基本管理制度具有里程碑式的重要意义。
《网络安全法》是落实国家总体安全观的重要举措。“没有网络安全就没有国家安全，没有信息化就没有现代化。”《网络安全法》是适应我国网络安全工作新形势、新任务，落实中央决策部署，保障网络安全和发展利益的重大举措。《网络安全法》中明确提出了有关国家网络空间安全战略和重要领域安全规划等问题的法律要求，有助于推进与其他国家和行为体就网络安全问题展开有效的战略博弈。
《网络安全法》助力网络空间治理，护航“互联网+”。《网络安全法》的出台将成为新的起点和转折点，公民个人信息保护进入正轨，网络暴力、网络谣言、网络欺诈等“毒瘤”生存的空间将被大大挤压，而“四有”中国好网民从道德自觉走向法律规范，用法律武器维护自己的合法权益，为“互联网+”的长远发展保驾护航。
《网络安全法》完善了网络安全义务和责任。《网络安全法》将原来散见于各种法规、规章中的规定上升到人大法律层面，对网络运营者等主体的法律义务和责任做了全面规定。
                </p>
            </ul>
        </div>
    </form>
</body>
</html>
