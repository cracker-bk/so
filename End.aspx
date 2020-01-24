<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="End.aspx.cs" Inherits="WebUI.End" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         $(function () {
            $("a").removeClass("bbClick");
            $(".fqxm_a").addClass("bbClick");
            $('.register_li_display,.login_li_display').hide();
            $('.diy_select').css('display', 'block');
         });
         </script>
    <style type="text/css">
        #over {
            margin: 0px auto;
            width: 1300px;
            height: 750px;
            /*background: #f8f8f8;*/
            overflow: hidden;
        }

            #over #pic {
                margin-left: 150px;
                margin-top: 30px;
            }

            #over #nr {
                border: 1px solid #ccc;
                width: 950px;
                height: 500px;
                background-color: #fff;
                margin-left: 160px;
                margin-top: 10px;
                padding-top: 50px;
                overflow: hidden;
            }

        #left, #right {
            margin-top: 110px;
            float: left;
            margin-left: 180px;
        }

        #pic_over {
            margin-left: 40px;
        }

        #btn_over {
            margin-top: 40px;
        }

        .label_over {
            margin-left: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="over">
        <div id="pic">
            <img src="images/shou_xmxx3.png" />
            <br />
        </div>
        <div id="nr">
            <div id="left">
                <asp:Label ID="Label1" runat="server" Text="恭喜你项目设置成功！" Font-Size="20px" ForeColor="#565656" CssClass="label_over"></asp:Label>
                <br />
                <br />
                <div id="pic_over">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/成功.png" Width="150" Height="150" CssClass="cImage2" />
                </div>
            </div>
            <div id="right">
                <asp:Label ID="Label2" runat="server" Text="请耐心等待审核....." Font-Size="20px" ForeColor="#808080"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="或者" Font-Size="20px" ForeColor="#808080"></asp:Label>
                <div id="btn_over">
                    <asp:Button ID="Button1" runat="server" Text="去看看其它项目" Height="50px" Width="150px" OnClick="Button1_Click" style="border-radius:5px;background-color:wheat;" BorderStyle="None" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

