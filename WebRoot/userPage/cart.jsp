
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
<title>Home</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="container">
			<ul>
				<c:if test="${user.username==null}">
					<c:if test="${imfo!=null}">
						<script type="text/javascript">
							window.onload = function() {
								a();
							}
						</script>
					</c:if>
					<li>Hi,欢迎来到酷森旗舰店</li>
					<li><a href="#" data-toggle="modal" data-target="#myModal402"><span
							class="glyphicon glyphicon-time" aria-hidden="true"></span>请登录</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal401"><span
							class="glyphicon glyphicon-envelope" aria-hidden="true"></span>免费注册</a></li>
				</c:if>
				<c:if test="${user.username!=null}">
					<li>欢迎您：</li>
					<li><s:property value="#session.user.username"></s:property></li>
					<li><a href="user_logoff!logoff.action"><span
							class="glyphicon glyphicon-time" aria-hidden="true"></span>退出</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- //header -->
	<!-- header-bot -->
	<div class="header-bot">
		<div class="container">
			<div class="col-md-3 header-left">
				<h1>
					<a href="index.html"><img src="images/logo-kuson01.png"></a>
				</h1>
			</div>
			<div class="col-md-6 header-middle">
				<form>
					<div class="search">
						<input type="search" value="Search" onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = 'Search';}" required>
					</div>
					<div class="section_room">
						<select id="country" onChange="change_country(this.value)"
							class="frm-field required">
							<option value="null">全品类</option>
							<option value="null">男装</option>
							<option value="AX">女装</option>
							<option value="AX">童装</option>
							<option value="AX">户外</option>
							<option value="AX">内衣</option>
						</select>
					</div>
					<div class="sear-sub">
						<input type="submit" value=" ">
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
			<div class="col-md-3 header-right footer-bottom">
				<ul>
					<li><a href="personal.jsp" class="use1"><span>Manage</span></a>

					</li>
					<li><a class="fb" href="#"></a></li>
					<li><a class="twi" href="#"></a></li>
					<li><a class="insta" href="#"></a></li>
					<li><a class="you" href="#"></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header-bot -->
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="active menu__item menu__item--current"><a
								class="menu__link" href="../index.action">&nbsp;首
									&nbsp;页&nbsp; <span class="sr-only">(current)</span>
							</a></li>
							<c:forEach var="firstCategory" items="${firstCategoryList}">
								<li class="dropdown menu__item"><a href="#"
									class="dropdown-toggle menu__link" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;${firstCategory}&nbsp;&nbsp;&nbsp;
										<span class="caret"></span>
								</a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="row">
											<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
												<a href="mens.html"><img src="images/woo1.jpg" alt=" " /></a>
											</div>
											<div class="col-sm-3 multi-gd-img" style="float:right;">
												<ul class="multi-column-dropdown">
													<c:forEach var="category" items="${categoryList}">
														<c:if test="${category.typeOne == firstCategory}">
															<li><a
																href="../goods_show!findGoodsByTypeId.action?typeId=${category.typeId}">${category.typeTwo}</a></li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<div class="cart box_1">
					<a href="#">
						<h3>
							<div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								<span id="cart_total">
								</span>
							</div>

						</h3>
					</a>
					<p>
						<a href="../cart!clearCart.action" class="simpleCart_empty">清空购物车</a>
					</p>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- banner -->
	<div class="page-head">
		<div class="container">
			<h3>结算中心</h3>
		</div>
	</div>
	<!-- check out -->
	<div class="checkout">
		<div class="container">
			<h3>我的购物袋</h3>
			<div class="table-responsive checkout-right animated wow slideInUp"
				data-wow-delay=".5s">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th>图&nbsp;片</th>
							<th>商&nbsp;品</th>
							<th>价&nbsp;格</th>
							<th>数&nbsp;量</th>
							<th>小&nbsp;计</th>
							<th>删&nbsp;&nbsp;除</th>
						</tr>
					</thead>
					<c:forEach var="cart" items="${cart.cartItems}">
						<tr class="rem1" lang=${cart.product.goodsId}>
							<td class="invert-image"><a
								href="../goods_show!findGoodsInfo.action?goodsId=${cart.product.goodsId}"><img
									src="../adminPage/images/${cart.product.goodsPicUrl}" alt=" "
									class="img-responsive" /></a></td>
							<td class="invert">${cart.product.goodsTitle}</td>
							<td class="invert" id="price">${cart.product.goodsPrice}</td>
							<td class="invert">
								<div class="quantity">
									<div class="quantity-select">
										<div class="entry value-minus">&nbsp;</div>
										<input type="text" class="text" value="${cart.count}"
											lang="${cart.product.goodsAmount}" name="quantity"
											id="quantity"
											style="height: 40px;width: 50px;text-align: center">
										<div class="entry value-plus active">&nbsp;</div>
									</div>
								</div>
							</td>
							<td class="invert" id="subtotal">${cart.subtotal}</td>
							<td class="invert-closeb">
								<a href="../cart!romoveCart.action?pid=${cart.product.goodsId}">
								<div class="rem">
									<div class="close1"></div>
								</div>
								</a>
							</td>
						</tr>

					</c:forEach>

					<!--quantity-->
					<script>
						$('.value-plus').on('click', function() {

							var value = parseInt($(this).prev().val(), 10) + 1;
							$(this).prev().val(value);
							var quantity = $(this).prev().val(); //也可以使用$(this).val();
							//isNaN(number)表示若number不是数字就返回真
							if (!isNaN(quantity) && parseInt(quantity) == quantity && quantity > 0) {
								if(quantity > parseInt($(this).prev().attr("lang"))){
									quantity = $(this).prev().attr("lang");
									$(this).prev().val(quantity);
								}
								//找到当前标签中第一个是tr的父节点，然后拿到属性为lang的值，也就是商品的id
								var pid = $(this).prev().parents("tr:first").attr("lang");
								//发送Ajax请求，传输当前的数量与商品的id，返回修改数量后的总价格
								$.post("../cart!updateCart.action",
									{
										'quantity' : quantity,
										'pid' : pid
									},
									function(total) {
										$("#total").html(total).toFixed(2); //所有商品小计和运费的和
										$("#cart_total").html(total).toFixed(2);
									}, "text");
								//计算单个商品的小计，保留两位小数
								var price = ($(this).parent().parent().parent().prev().html()*quantity).toFixed(2);
								$(this).parent().parent().parent().next().html(price); 
							} else {
								//如果非法，还原为刚刚合法的数
								".text".value = $(".text").attr("lang");
							}
						});
					
						$('.value-minus').on('click', function() {
							
							var value = parseInt($(this).next().val(), 10) - 1;
							if(value < 1) value = 1;
							$(this).next().val(value);
							var quantity = $(this).next().val(); //也可以使用$(this).val();
							//isNaN(number)表示若number不是数字就返回真
							if (!isNaN(quantity) && parseInt(quantity) == quantity && quantity > 0) {
								if(quantity > parseInt($(this).next().attr("lang"))){
									quantity = $(this).next().attr("lang");
									count.value=quantity;
								}
								//找到当前标签中第一个是tr的父节点，然后拿到属性为lang的值，也就是商品的id
								var pid = $(this).next().parents("tr:first").attr("lang");
								//发送Ajax请求，传输当前的数量与商品的id，返回修改数量后的总价格
								$.post("../cart!updateCart.action",
									{
										'quantity' : quantity,
										'pid' : pid
									},
									function(total) {
										$("#total").html(total).toFixed(2); //所有商品小计和运费的和
										$("#cart_total").html(total).toFixed(2);
									}, "text");
								//计算单个商品的小计，保留两位小数
								var price = ($(this).parent().parent().parent().prev().html()*quantity).toFixed(2);
								$(this).parent().parent().parent().next().html(price); 
							} else {
								//如果非法，还原为刚刚合法的数
								".text".value = $(".text").attr("lang");
							}
						});
					</script>
					<!--quantity-->

				</table>
			</div>
			<div class="checkout-left">

				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="../index.action"><span
						class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>继&nbsp;续&nbsp;购&nbsp;物</a>
				</div>
				<div class="checkout-left-basket animated wow slideInLeft"
					data-wow-delay=".5s">
					<h4>购物清单</h4>
					<ul>
						<li>Total<span id="total"> 
							<s:if test="#session.cart.total>0">
								${cart.total} 元
							</s:if> 
							<s:else>0.00元</s:else>
						</span></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<script type="text/javascript">
		
			$(function() {
				//1. 注册事件
				$(".text").change(function() {
					//2. 验证数据的有效性
					var count = this;
					var quantity = this.value; //也可以使用$(this).val();
					if(isNaN(quantity) == true){
						quantity=1;
						this.value=1;
					}
					//isNaN(number)表示若number不是数字就返回真
					if (!isNaN(quantity) && parseInt(quantity) == quantity && quantity > 0) {
						if(quantity > parseInt($(this).attr("lang"))){
							quantity = $(this).attr("lang");
							this.value=quantity;
						}
						//找到当前标签中第一个是tr的父节点，然后拿到属性为lang的值，也就是商品的id
						var pid = $(this).parents("tr:first").attr("lang");
						//发送Ajax请求，传输当前的数量与商品的id，返回修改数量后的总价格
						$.post("../cart!updateCart.action",
							{
								'quantity' : quantity,
								'pid' : pid
							},
							function(total) {
								$("#total").html(total).toFixed(2); //所有商品小计和运费的和
								var cart_total = document.getElementById("cart_total");
							}, "text");
						//计算单个商品的小计，保留两位小数
				 		var price = ($(this).parent().parent().parent().prev().html()*quantity).toFixed(2);
						$(this).parent().parent().parent().next().html(price); 
					} else {
						alert("fuck");
						//如果非法，还原为刚刚合法的数
						this.value = $(this).attr("lang");
					}
				})
			})
		</script>
	</div>
	<!-- //check out -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div>
				<img src="images/tail.png" />
			</div>
			<div class="col-md-3 footer-left">

				<h2>
					<a href="index.html"><img src="images/logo-kuson02.gif" alt=" " /></a>
				</h2>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit
					amet, consectetur, adipisci velit, sed quia non numquam eius modi
					tempora incidunt ut labore et dolore magnam aliquam quaerat
					voluptatem.</p>
			</div>
			<div class="col-md-9 footer-right">
				<div class="clearfix"></div>
				<div class="sign-grds">
					<div class="col-md-4 sign-gd">
						<h4>常用服务</h4>
						<ul>
							<li><a href="index.html">问题咨询</a></li>
							<li><a href="index.html">订单查询</a></li>
							<li><a href="index.html">保修退换货</a></li>
							<li><a href="index.html">上门安装</a></li>
							<li><a href="index.html">上门自提</a></li>
							<li><a href="index.html">价格保护</a></li>
						</ul>
					</div>
					<div class="col-md-4 sign-gd">
						<h4>购物联盟</h4>
						<ul>
							<li><a href="index.html">怎么购物</a></li>
							<li><a href="mens.html">积分查询</a></li>
							<li><a href="womens.html">礼品卡介绍</a></li>
							<li><a href="electronics.html">积分兑换</a></li>
							<li><a href="codes.html">礼品卡使用</a></li>
							<li><a href="contact.html">积分换大奖</a></li>
						</ul>
					</div>
					<div class="col-md-4 sign-gd">
						<h4>售后服务</h4>
						<ul>
							<li><a href="index.html">退换货流程</a></li>
							<li><a href="mens.html">售后服务政策</a></li>
							<li><a href="womens.html">特色服务指南</a></li>
							<li><a href="electronics.html">发票说明</a></li>
							<li><a href="codes.html">正品鉴定</a></li>
							<li><a href="contact.html">权益保障</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<p class="copy-right">Copyright &copy; 2017.Company name All
				rights reserved.酷森服装</p>
		</div>
	</div>
	<!-- //footer -->
	<!-- login -->
	<div class="modal fade" id="myModal401" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<h3>免费注册</h3>
								<form>
									<div class="sign-up">

										<h4>
											<img class="img1" src="images/person07.png" />
										</h4>
										<input type="text" value="姓名" onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = '姓名';}" required>
									</div>
									<div class="sign-up">

										<h4>
											<img class="img1" src="images/envelope.png" />
										</h4>
										<input type="text" value="邮箱" onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = '邮箱';}" required>
									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password05.png" />
										</h4>
										<input type="password" value="" onFocus="this.value = '';"
											required>

									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password06.png" />
										</h4>
										<input type="password" value="" onFocus="this.value = '';"
											required>

									</div>
									<div class="sign-up">
										<input type="submit" value="注册">
									</div>

								</form>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	<!-- login -->
	<div class="modal fade" id="myModal402" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<h3>用户登陆</h3>

								<s:form action="../user_login!login.action" method="post"
									theme="simple" namespace="/">
									<div class="sign-up">
										<c:if test="${imfo!=null}">
											<s:property value="#session.imfo"></s:property>
										</c:if>
										<h4>
											<img class="img1" src="images/envelope.png" />
										</h4>
										<s:textfield name="user.email" label="邮箱" />
									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password05.png" />
										</h4>
										<s:password name="user.password" label="密码" />
									</div>
									<div class="sign-in">
										<a href="#">忘记密码?</a>
									</div>
									<div class="sign-up">
										<s:submit value="登陆" />
									</div>
								</s:form>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
</body>
</html>
