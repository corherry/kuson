<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'cardOrder.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="css/tasp.css" />
<link href="css/orderconfirm.css" rel="stylesheet" />

<style>
#page {
	width: auto;
}

#comm-header-inner, #content {
	width: 950px;
	margin: auto;
}

#logo {
	padding-top: 26px;
	padding-bottom: 12px;
}

#header .wrap-box {
	margin-top: -67px;
}

#logo .logo {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 140px;
	height: 35px;
	font-size: 35px;
	line-height: 35px;
	color: #f40;
}

#logo .logo .i {
	position: absolute;
	width: 140px;
	height: 35px;
	top: 0;
	left: 0;
	background: url(http://a.tbcdn.cn/tbsp/img/header/logo.png);
}
</style>

<script type="text/javascript">
function pay_prompt()
{
var password=prompt("请输入支付密码", "");
if (password)
  {
    alert("支付密码"+password)
    return true;
  }
else
  {
    alert("没有输入密码")
    return false;
  }
}
</script>

</head>

<body onload="check()">
	<script type="text/javascript">
		function check(){
			var address = document.getElementsByName("address");
			address[0].checked=true;
			var to = document.getElementById("J_AddrConfirm");
			var arr =address[0].value.split(" ");
			to.innerHTML=arr[0];
			var receiver = document.getElementById("J_AddrNameConfirm");
			receiver.innerHTML=arr[1] + " " + arr[2];
		}
		window.onload=check;
	</script>
	<div id="page">

		<div id="content" class="grid-c" style="margin-top:50px;">
			<form id="J_Form" name="J_Form"
				action="/auction/order/unity_order_confirm.htm" method="post">
				<div>
					<h3 class="dib">订单信息</h3>
					<table cellspacing="0" cellpadding="0" class="order-table"
						id="J_OrderTable" summary="统一下单订单信息区域">
						<thead>
							<tr>
								<th class="s-title">店铺宝贝
									<hr />
								</th>
								<th class="s-price">单价(元)
									<hr />
								</th>
								<th class="s-amount">数量
									<hr />
								</th>
								<th class="s-agio">优惠方式(元)
									<hr />
								</th>
								<th class="s-total">小计(元)
									<hr />
								</th>
							</tr>
						</thead>
						<c:forEach var="cart" items="${order.orderItems}">
						<tbody data-spm="3" class="J_Shop" data-tbcbid="0"
							data-outorderid="47285539868" data-isb2c="false"
							data-postMode="2" data-sellerid="1704508670">
							<tr class="first">
								<td colspan="5"></td>
							</tr>
							<tr class="item"
								data-lineid="19614514619:31175333266:35612993875"
								data-pointRate="0">
								<td class="s-title"><a href="#" target="_blank"
									title="${cart.product.goodsTitle}"
									class="J_MakePoint"
									data-point-url="http://log.mmstat.com/buy.1.5"> <img
										src="../adminPage/images/${cart.product.goodsPicUrl}"
										class="itempic"><span class="title J_MakePoint"
										data-point-url="http://log.mmstat.com/buy.1.5">${cart.product.goodsTitle}
											</span></a>

									<div class="props">
										<span>颜色: ${cart.product.goodsColor} </span> <span>尺码: ${cart.product.goodsSize} </span> 
									</div> <a title="消费者保障服务，卖家承诺商品如实描述" href="#" target="_blank"> <img
										src="http://img03.taobaocdn.com/tps/i3/T1bnR4XEBhXXcQVo..-14-16.png" />
								</a>
								</td>
								<td class="s-price"><span class='price '> <em
										class="style-normal-small-black J_ItemPrice">${cart.product.goodsPrice}</em>
								</span> </td>
								<td class="s-amount" data-point-url="">${cart.quantity}</td>
								<td class="s-agio">
									<div class="J_Promotion promotion" data-point-url="">无优惠</div>
								</td>
								<td class="s-total"><span class='price '> <em
										class="style-normal-bold-red J_ItemTotal ">${cart.subtotal}</em>
								      </span> 
								</td>
							</tr>



							<tr class="item-service">
								<td colspan="5" class="servicearea" style="display: none"></td>
							</tr>

							<tr class="blue-line" style="height: 2px;">
								<td colspan="5"></td>
							</tr>

						</tbody>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="5">

									<div class="order-go" data-spm="4">
										<div class="J_AddressConfirm address-confirm">
											<div class="kd-popup pop-back" style="margin-bottom: 40px;">
												<div class="box">
													<div class="bd">
														<div class="point-in">

															<em class="t">实付款：</em> <span class='price g_price '>
																<span>￥</span><em class="style-large-bold-red"
																id="J_ActualFee">${order.total}</em>
															</span>
														</div>

														<ul>
															<li><em>寄送至:</em><span id="J_AddrConfirm"
																style="word-break: break-all;">${address}</span></li>
															<li><em>收货人:</em><span id="J_AddrNameConfirm">${receive}</span></li>
														</ul>
													</div>
												</div>
												<a href="../order!cancelOrder.action?orderId=${order.orderId}" class="back J_MakePoint" target="_top" data-point-url="">取消订单</a>
											          支付密码：<input type="password" name="password" style="height:25px" id="psw"> 
											          
											  <a id="J_Go" class=" btn-go" data-point-url="" tabindex="0" title="点击此按钮，提交订单。" href="JavaScript:;"
						onclick="location='../order!payOrder.action?orderId=${order.orderId}&password=' + document.getElementById('psw').value">付款<b class="dpl-button"></b></a>
											</div>
										</div>										
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>

		<div id="footer"></div>
	</div>
	<div style="text-align:center;">
		<p>Copyright &copy; 2017.Company name All rights reserved.酷森服装</p>
	</div>
</body>
</html>
