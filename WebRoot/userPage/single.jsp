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
				<c:if test="${user.username==null}">
					<li><a href="#" data-toggle="modal" data-target="#myModal402"><span
							class="glyphicon glyphicon-time" aria-hidden="true"></span>请登录</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal401"><span
							class="glyphicon glyphicon-envelope" aria-hidden="true"></span>免费注册</a></li>
				</c:if>
				<c:if test="${user.username!=null}">
					<li>欢迎您：</li>
					<li><s:property value="#session.user.username"></s:property></li>
					<li><a href="../user_login!logout.action"><span
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
			<s:form action="../goods_show!queryBySearch.action" method="post" namespace="/">
				<div class="search">
					<input type="search" name="search" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}" required>
				</div>
				<div class="sear-sub">
					<input type="submit" value="">
				</div>
				<div class="clearfix"></div>
			</s:form>
			</div>
			<div class="col-md-3 header-right footer-bottom">
				<ul>
					<c:if test="${user.username!=null}">
					<li><a href="personal.jsp" class="use1"><span>Manage</span></a></li>
					</c:if>
					<c:if test="${user.username==null}">
					<li><a href="login.jsp" class="use1"><span>Manage</span></a></li>
					</c:if>
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
												<a href="../goods_show!findByFirstCategory.action?firstCategory=${firstCategory}"><img src="images/woo1.jpg" alt=" " /></a>
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
								style="height: 40px;width: 50px;text-align: center" lang="${productInfo.goodsAmount}" class="text">
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
						
							quantity = parseInt($(this).attr("lang"))
							this.value=quantity;
						}
					} else {
						//如果非法，还原为刚刚合法的数
						this.value = $(this).attr("lang");
					}
				})
			})
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
					<a href="#"><img src="images/logo-kuson02.gif" alt=" " /></a>
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
							<li><a href="#">问题咨询</a></li>
							<li><a href="#">订单查询</a></li>
							<li><a href="#">保修退换货</a></li>
							<li><a href="#">上门安装</a></li>
							<li><a href="#">上门自提</a></li>
							<li><a href="#">价格保护</a></li>
						</ul>
					</div>
					<div class="col-md-4 sign-gd">
						<h4>购物联盟</h4>
						<ul>
							<li><a href="#">怎么购物</a></li>
							<li><a href="#">积分查询</a></li>
							<li><a href="#">礼品卡介绍</a></li>
							<li><a href="#">积分兑换</a></li>
							<li><a href="#">礼品卡使用</a></li>
							<li><a href="#">积分换大奖</a></li>
						</ul>
					</div>
					<div class="col-md-4 sign-gd">
						<h4>售后服务</h4>
						<ul>
							<li><a href="#">退换货流程</a></li>
							<li><a href="#">售后服务政策</a></li>
							<li><a href="#">特色服务指南</a></li>
							<li><a href="#">发票说明</a></li>
							<li><a href="#">正品鉴定</a></li>
							<li><a href="#">权益保障</a></li>
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
								<form  action="../user_register!register.action" onsubmit="return check()">
									<div class="sign-up">

										<h4>
											<img class="img1" src="images/person07.png" />
										</h4>
										<input  type="text" name="user.username" value="姓名" id="username"
											onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = '姓名';}" style="color:#858585;" required>
									</div>
									<div class="sign-up">

										<h4>
											<img class="img1" src="images/envelope.png" />
										</h4>
										<input type="text" name="user.email" value="邮箱" id="email"
											onFocus="this.value = '';"
											onBlur="if (this.value == '') {this.value = '邮箱';}" style="color:#858585;" required>
									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password05.png" />
										</h4>
										<input type="password" name="user.password" value=""  id="password"
											onFocus="this.value = '';" style="color:#858585;" required>

									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password06.png" />
										</h4>
										<input type="password" name="rePassword" value="" id="repassword"
											onFocus="this.value = '';" style="color:#858585;" required>

									</div>
									<div class="sign-up">
										<input type="submit" value="注册">
									</div>

								</form>
							</div>
							<div class="clearfix"></div>
							<script type="text/javascript">
								function check(){
								    var name= document.getElementById("username");
								    var email = document.getElementById("email");
									var psw = document.getElementById("password");
									var repass = document.getElementById("repassword");
									var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
									if(email.value=="邮箱"){
									   alert("邮箱不能为空!");
									   return false;
									}else if(myreg.test(email.value) == false){
										alert("请输入正确的邮箱");
										return false;
									}else if(name.value=="姓名"){
									  alert("姓名不能为空！");
									  return false;
									}else if(psw.value==""){
										alert("密码不能为空!");
										return false;
									}else if(repass.value==""){
										alert("请再次输入确认密码!");
										return false;
									}else if(psw.value != repass.value){
										alert("密码不匹配!");
										return false;
									}
									return true;
								}
							</script>
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
								<h3>用户登陆</h3>
								
								<s:form  action="../user_login!login.action" method="post"
									theme="simple" namespace="/">
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/envelope.png" />
										</h4>
										<s:textfield name="user.email" label="邮箱" style="color:#858585;" />
									</div>
									<div class="sign-up">
										<h4>
											<img class="img1" src="images/password05.png" />
										</h4>
										<s:password name="user.password" label="密码" style="color:#858585;" />
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
