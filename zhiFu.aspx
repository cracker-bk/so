<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zhiFu.aspx.cs" Inherits="WebUI.zhiFu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
		<link rel="stylesheet" type="text/css" href="zhichi/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="zhichi/main.css" />
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
                                case "wdl":
                    var txt = "您还没有登录，请返回登录界面进行登录";
                    var option = {
                        title: "未登录",
                        btn: parseInt("0011", 2),
                        onOk: function () {
                            console.log("已存在");
                        }
                    }
                    window.wxc.xcConfirm(txt, "custom", option);
                    break;
                case "success":
                    var txt = "支持成功";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                    break;
                case "error1":
                    var txt = "支持失败";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                    break;
            }
        }
    </script>
    <%-- 弹窗结束 --%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ctn13" style="margin:10px 0px 0px 30px">
            <asp:Button ID="btnBack" runat="server" Text="<返回上一页" BackColor="WhiteSmoke" BorderColor="White" BorderStyle="Solid" ForeColor="#FF3300" Height="40px" Width="100px" OnClick="btnBack_Click" />
        </div>
		<div class="pay">
			<!--主内容开始编辑-->
			<div class="tr_recharge">
				<div class="tr_rechtext">
					<p class="te_retit"><img src="images/coin.png" alt="" />支持中心</p>
					<p>1.给别人一份支持就是给自己的一份支持。</p>
					<p>2.感谢大家的支持。你一票，我一票，明天项目就完成。</p>
				</div>
				<div class="am-form" id="doc-vld-msg">
					<div class="tr_rechbox">
						<div class="tr_rechhead">
							<img src="images/ys_head2.jpg" id="yhTx" runat="server"/>
							<p>用户：
								<a id="yhName" runat="server">未登录</a>
							</p>
						</div>
						<div class="tr_rechli am-form-group">
							<ul class="ui-choose am-form-group" id="uc_01">
								<li>
									<label class="am-radio-inline">
								        	<input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10￥
									    </label>
								</li>
								<li>
									<label class="am-radio-inline">
									        <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 20￥
								      	</label>
								</li>

								<li>
									<label class="am-radio-inline">
									        <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥
								        </label>
								</li>
								<li>
									<label class="am-radio-inline">
									        <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他金额
								        </label>
								</li>
							</ul>
							<!--<span>1招兵币=1元 10元起充</span>-->
						</div>
						<div class="tr_rechoth am-form-group">
							<span>其他金额：</span>
							<input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元" />
							<!--<p>充值金额范围：10-10000元</p>-->
						</div>
						<div class="tr_rechnum">
							<span>应付金额：</span>
<%--							<p class="rechnum" id="rechnumP_Money" runat="server">0.00元</p>--%>
                            <asp:Label ID="rechnumP_Money" class="rechnum"  runat="server" Text="20.0元"></asp:Label>
						</div>
					</div>
					<div class="tr_paybox">
						<input type="submit" id="btn_ZhuChi" onserverclick="btn_ZhuChi_ServerClick" value="确认支持" class="tr_pay am-btn" runat="server"/>
						<span>温馨提示：支付操作后就不可以撤销了。</span>
					</div>
				</div>
			</div>
		</div>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="zhichi/amazeui.min.js"></script>
		<script type="text/javascript" src="zhichi/ui-choose.js"></script>

		<script type="text/javascript">
			// 将所有.ui-choose实例化
			$('.ui-choose').ui_choose();
			// uc_01 ul 单选
			var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
			uc_01.click = function(index, item) {
				console.log('click', index, item.text())
			}
			uc_01.change = function(index, item) {
				console.log('change', index, item.text())
			}
			$(function() {
				$('#uc_01 li:eq(3)').click(function() {
					$('.tr_rechoth').show();
					$('.tr_rechoth').find("input").attr('required', 'true')
					$('.rechnum').text('10.00元');
				})
				$('#uc_01 li:eq(0)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('10.00元');
					$('.othbox').val('');
				})
				$('#uc_01 li:eq(1)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('20.00元');
					$('.othbox').val('');
				})
				$('#uc_01 li:eq(2)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('50.00元');
					$('.othbox').val('');
				})
				$(document).ready(function() {
					$('.othbox').on('input propertychange', function() {
						var num = $(this).val();
						$('.rechnum').html(num + ".00元");
					});
				});
			})

			$(function() {
				$('#doc-vld-msg').validator({
					onValid: function(validity) {
						$(validity.field).closest('.am-form-group').find('.am-alert').hide();
					},
					onInValid: function(validity) {
						var $field = $(validity.field);
						var $group = $field.closest('.am-form-group');
						var $alert = $group.find('.am-alert');
						// 使用自定义的提示信息 或 插件内置的提示信息
						var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

						if(!$alert.length) {
							$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
							appendTo($group);
						}
						$alert.html(msg).show();
					}
				});
			});
		</script>
    </form>
</body>
</html>
