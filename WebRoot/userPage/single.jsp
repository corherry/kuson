<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Single</title>
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
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- single -->
<script src="js/imagezoom.js"></script>
<script src="js/jquery.flexslider.js"></script>
<!-- single -->
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
				<li>Hi,欢迎来到酷森旗舰店</li>
				<li><a href="#" data-toggle="modal" data-target="#myModal402"><span
						class="glyphicon glyphicon-time" aria-hidden="true"></span>请登录</a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal401"><span
						class="glyphicon glyphicon-envelope" aria-hidden="true"></span>免费注册</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-off"
						aria-hidden="true"></span>退出</a></li>
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
					<li><a href="#" class="use1" data-toggle="modal"
						data-target="#myModal401"><span>个人中心</span></a></li>
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
							<li class="active menu__item "><a class="menu__link"
								href="../index.action">&nbsp;首 &nbsp;页&nbsp; <span
									class="sr-only">(current)</span></a></li>
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
					<a href="checkout.html">
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
	<!-- //banner-top -->
	<!-- banner -->
	<div class="page-head">
		<div class="container">
			<h3>商品详情</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- single -->
	<div class="single">
		<div class="container">
			<div
				class="col-md-6 single-right-left animated wow slideInUp animated"
				data-wow-delay=".5s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
				<div class="grid images_3_of_2">
					<div class="flexslider">
						<!-- FlexSlider -->
						<script>
							// Can also be used with $(document).ready()
							$(window).load(function() {
								$('.flexslider').flexslider({
									animation : "slide",
									controlNav : "thumbnails"
								});
							});
						</script>
						<!-- //FlexSlider-->
						<ul class="slides">
							<li
								data-thumb="../adminPage/images/<s:property value="#session.productInfo.goodsPicUrl"></s:property>">
								<div class="thumb-image">
									<img
										src="../adminPage/images/<s:property value="#session.productInfo.goodsPicUrl"></s:property>"
										data-imagezoom="true" class="img-responsive">
								</div>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div
				class="col-md-6 single-right-left simpleCart_shelfItem animated wow slideInRight animated"
				data-wow-delay=".5s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: slideInRight;">
				<h3 id="title">
					<s:property value="#session.productInfo.goodsTitle"></s:property>
				</h3>
				<br> <br>
				<h5 style="font-size: 22">价格:</h5>
				<p>
					<span class="item_price" id="price">￥<s:property
							value="#session.productInfo.goodsPrice"></s:property></span>
				</p>
				<div class="occasional">
					<h5 style="font-size: 22">数量 :</h5>
					<div class="quantity">
						<div class="quantity-select">
							<div class="entry value-minus">&nbsp;</div>
							<input type="text" value="1" name="quantity" id="quantity"
								style="height: 40px;width: 50px;text-align: center">
							<div class="entry value-plus active">&nbsp;</div>
							<font color="#909090" size="4">(&nbsp;库存<s:property
									value="#session.productInfo.goodsAmount"></s:property>件&nbsp;)
							</font>
						</div>
					</div>
					<!--quantity-->
					<script>
						$('.value-plus').on('click', function() {
							var count = document.getElementById("quantity");
							var value = parseInt(count.value, 10) + 1;
							if(value <= ${session.productInfo.goodsAmount})
								count.value=value;
							else
								count.value = ${session.productInfo.goodsAmount};
						});
					
						$('.value-minus').on('click', function() {
							var count = document.getElementById("quantity");
							var value = parseInt(count.value, 10) - 1;
							if(value>=1) count.value=value;
							else count.value=1;
						});
					</script>
					<!--quantity-->
					<div class="clearfix"></div>
				</div>

				<div class="occasion-cart">
					<a href="JavaScript:;"
						onclick="location='../cart!addCart.action?pid=${session.productInfo.goodsId}&quantity=' + document.getElementById('quantity').value"
						class="item_add hvr-outline-out button2" id="addCart">加入购物车</a>
				</div>

			</div>
			<div class="clearfix"></div>

			<div class="bootstrap-tab animated wow slideInUp animated"
				data-wow-delay=".5s"
				style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home"
							id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
							aria-expanded="true">商品简介</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel"
							class="tab-pane fade in active bootstrap-tab-text" id="home"
							aria-labelledby="home-tab">
							<h5 id="number">
								商品颜色:
								<s:property value="#session.productInfo.goodsColor"></s:property>
							</h5>
							<h5 id="number">
								商品尺码:
								<s:property value="#session.productInfo.goodsSize"></s:property>
							</h5>

							<p id="info">
								商品详情<br>
								<s:property value="#session.productInfo.goodsDescription"></s:property>
								</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //single -->
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
											<img class="img1" src="images/envelope.png" />
										</h4>
										<input type="text" value="邮箱" onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = '邮箱';}" required>
									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password05.png" />
										</h4>
										<input type="password" value="Password"
											onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = 'Password';}"
											required>

									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password06.png" />
										</h4>
										<input type="password" value="Password"
											onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = 'Password';}"
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
							<div class="login-right">
								<h3>密码登录</h3>
								<form>
									<div class="sign-in">
										<img class="img1" src="images/envelope.png" /> <input
											type="text" value="邮箱" onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = '邮箱';}" required>
									</div>
									<div class="sign-in">
										<h4>
											<img class="img1" src="images/password05.png" />
										</h4>
										<input type="password" value="Password"
											onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = 'Password';}"
											required> <a href="#">忘记密码?</a>
									</div>
									<div class="single-bottom">
										<input type="checkbox" id="brand" value=""> <label
											for="brand"><span></span>记住密码.</label>
									</div>
									<div class="sign-in">
										<input type="submit" value="登录">
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
</body>
</html>
