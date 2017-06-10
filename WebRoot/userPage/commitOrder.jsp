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

		<div id="content" class="grid-c">

			<div id="address" class="address" style="margin-top: 20px;"
				data-spm="2">
				<form name="addrForm" id="addrForm" action="#">
					<h3>
						确认收货地址 <span class="manage-address">
						</span>
					</h3>
					<% int cas = 0; %>
					<ul id="address-list" class="address-list">
					  <c:forEach var="address" items="${addressList}">
						<li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "
							data-point-url="http://log.mmstat.com/buy.1.20">
							 <% cas++;%>
							 <span class="marker-tip">寄送至</span>
							<div class="address-info">
								<input name="address" class="J_MakePoint " type="radio" value="${address.address} ${address.receiver} ${address.phone}" id="<%= cas %>"
									data-point-url="http://log.mmstat.com/buy.1.20"
									onclick="getRadio()"> <label for="<%= cas %>"
									class="user-address">${address.address} (${address.receiver} 收) ${address.phone} 
								</label>
							</div>
						</li>
					 </c:forEach>
					</ul>
					<script type="text/javascript">
						function getRadio(){
							var address = document.getElementsByName("address");
							for(i = 0; i < address.length; i++){
								if(address[i].checked == true){
									var to = document.getElementById("J_AddrConfirm");
									var arr =address[i].value.split(" ");
									to.innerHTML=arr[0];
									var receiver = document.getElementById("J_AddrNameConfirm");
									receiver.innerHTML=arr[1] + " " + arr[2];
								}
							}
						}
					</script>
	
					<div class="address-bar">
						<a href="addaddress.jsp?op=1" class="new J_MakePoint" id="J_NewAddressBtn">使用新地址</a>
					</div>

				</form>
			</div>
			<form id="J_Form" name="J_Form"
				action="/auction/order/unity_order_confirm.htm" method="post">
				<div>
					<h3 class="dib">确认订单信息</h3>
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
						<c:forEach var="cart" items="${cart.cartItems}">
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
								<td class="s-amount" data-point-url="">${cart.count}</td>
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
																id="J_ActualFee">${cart.total}</em>
															</span>
														</div>

														<ul>
															<li><em>寄送至:</em><span id="J_AddrConfirm"
																style="word-break: break-all;">  </span></li>
															<li><em>收货人:</em><span id="J_AddrNameConfirm"></span></li>
														</ul>
													</div>
												</div>
												<a href="../cart!lookCart.action" class="back J_MakePoint" target="_top" data-point-url="">返回购物车</a> 
												<a id="J_Go" class=" btn-go" data-point-url="" tabindex="0" title="点击此按钮，提交订单。" href="JavaScript:;"
						onclick="location='../order!addOrder.action?address=' + document.getElementById('J_AddrConfirm').innerText + '&receive=' + document.getElementById('J_AddrNameConfirm').innerText">提交订单<b class="dpl-button"></b></a>
											</div>
										</div>

										


										<div class="msg" style="clear: both;">
											<p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
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
