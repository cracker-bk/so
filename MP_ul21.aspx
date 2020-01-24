<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MP_ul21.aspx.cs" Inherits="WebUI.MP_ul21" %>
<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>制作团队</title>
    <link href="content/reset.css" rel="stylesheet" />

    <style type="text/css">
        .ctn1 {
            width: 100%;
            height: 200px;
        }

        .ctn12 {
            float: left;
        }

        .ctn13 {
            float: right;
        }

        .ctn12 p {
            font-size: 48px;
            font-weight: bold;
            padding: 30px;
        }

        #btnBack {
            border-radius: 5px;
            margin: 30px;
        }

        .ctn2 {
            margin: 0 auto;
            width: 1000px;
            height: auto;
            border: 1px solid green;
            overflow: hidden;
        }

        .ctnTitle {
            font-size: 18px;
            font-weight: 400;
        }

        .ctnM {
            margin-left: 100px;
        }
        ul li{
            text-align:center;
            margin-top:20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ctn1">
            <div class="ctn12">
                <p>制作团队</p>
            </div>
            <div class="ctn13">
                <asp:Button ID="btnBack" runat="server" Text="<返回首页" BackColor="WhiteSmoke" BorderColor="White" BorderStyle="Solid" ForeColor="#FF3300" Height="40px" Width="100px" OnClick="btnBack_Click" /></div>
        </div>
        <div class="ctn2">

            <p class="ctnTitle">甜橙项目小组</p>
            <ul>
                <li class="img"><img  src="images/383E468C5535C1FE6D0260892844304E.jpg" style="width:400px" height="250"/></li>
            </ul>
            <p class="ctnM" style="line-height: 60px">
                &nbsp;&nbsp; 甜橙项目小组是由2018173803最强王者集团甜橙组甜橙项目小组组长汤琪、技术总监何冬华、组员周玲英组成

                <br />
                一、组长汤琪
                <br />               
                <img src="images/2B589288F97A41EF3A8D44A967CB5459.jpg" style="width:400px" height="350" />
                <br />
                

                二、技术总监何冬华
                <br />
                <img src="images/4AC2100EDD9C092AA21D3FF52A161BF4.jpg" style="width:400px" height="250" />
                <br />
                三、组员周玲英 
                <br />
                <img src="images/psbO3XKJUH1.jpg"  style="width:350px" height="400" />
                <br />
            </p>
        </div>
    </form>
</body>
</html>
