<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MP_ul12.aspx.cs" Inherits="WebUI.MP_ul12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>《用户信用协议》</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ctn1">
            <div class="ctn12">
                <p>《用户信用协议》</p>
            </div>
            <div class="ctn13">
                <asp:Button ID="btnBack" runat="server" Text="<返回首页" BackColor="WhiteSmoke" BorderColor="White" BorderStyle="Solid" ForeColor="#FF3300" Height="40px" Width="100px" OnClick="btnBack_Click" /></div>
        </div>
        <div class="ctn2">

            <p class="ctnTitle">《用户信用协议》</p>
            <p class="ctnM" style="line-height: 60px">
                &nbsp;&nbsp; 本授权协议是合肥卡神网络工作室旗下的卡友俱乐部APP平台（以下简称本平台）和您签订。如您选择点击同意此协议将视为授权本平台向第三方支付/征信/金融机构/提交您的个人信息，将视为您已阅读并理解本协议的全部内容。

                <br />
                一、授权条款

                <br />
                （一）您同意在您注册或使用本平台时，本平台依据相关法律法规向第三方支付/征信/金融机构或通过上述机构向其他拥有合法资质的第三方（包括但不限于具有资质的征信机构，运营商及其代理商、关联公司，公安部身份信息查询中心等）了解、获取、核实您的信用信息。并同意本平台及上述机构将查询获取的信息进行保存、整理、加工，并用于评价本人信用情况或核实本人信息的真实性。

                <br />
                （二）您同意在您注册或使用本平台时，本平台将依据相关法律法规，向第三方支付/征信/金融机构提交您在本平台业务中产生的相关信息，包括个人基础信息、信用/提现信息、借款申请信息、借款合同信息以及还款信息等，并记录在上述机构建立的信息数据库中。

                <br />
                （三）您在本平台打赏获取的分析报告，为本平台独家知识产权，其内容为本平台的著作权，相关个人信息均为您授权同意后交由本平台做分析用，请勿泄露给第三方。上述过程中，如造成个人信息泄露。由于本平台已经尽到提醒和防范义务，本平台故概不负责。

                <br />
                二、保密条款

                <br />
                （一）本平台重视对用户隐私的保护。因收集您的信息是出于遵守国家法律法规以及向您提供服务及提升服务质量的目的，本平台对您的信用信息承担保密义务，不会为满足第三方的营销目的而向其出售或出租您的任何信息。

                <br />
                （二）本平台会在下列情况下才将您的个人信用信息与第三方共享：

 <br />
                1、事先获得用户的明确授权；

 <br />
                2、某些情况下只有共享您的信息才能提供您需要的服务或产品；

                <br />
                3、某些服务或产品由本平台的合作伙伴提供或由本平台与合作伙伴共同提供，本平台会与其共享提供服务或产品需要的信息；

 <br />
                4、为维护本平台和其他平台用户的合法权益；

 <br />
                5、根据法律规定及合理商业习惯，在本平台计划与其他公司合并或被其收购或进行其他资本市场活动（包括但不限于IPO，债券发行）时，以及其他情形下本平台需要接受来自其他主体的尽职调查时，本平台会把您的信息提供给必要的主体，但本平台会通过和这些主体签署保密协议等方式要求其对您的个人信息采取合理的保密措施；

                <br />
                6、按照相关政府主管部门的要求；

 <br />
                7、由于用户将其注册密码告知他人或与他人共享账户密码，由此导致的任何个人信息泄露，或其他非本平台原因导致用户个人信息的泄露；

                <br />
                8、任何由于黑客攻击、电脑病毒入侵及其他不可抗力事件所导致的用户信息泄露、公开；

                <br />
                三、用户义务及免责声明

                <br />
                （一）您保证所提供的个人信息均为您本人的真实信息，不可为他人的信息或虚假信息，若涉嫌恶意信息作假或盗用他人信息，将可能记入网络征信系统，影响您的征信记录，同时本平台将保留追究您相应法律责任的权利。

                <br />
                （二）如您所提供的个人信息中全部或部分信息为他人信息或虚假信息，本平台将有权暂停或终止与您的全部或部分服务协议，由此行为所产生的全部法律责任将由您承担，本平台将不对此承担法律责任。
            </p>
        </div>
    </form>
</body>
</html>
