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
<script type="text/javascript"> function a(){$('#myModal402').modal({show:true,backdrop:true})};</script>
<script type="text/javascript"> function b(){$('#myModal401').modal({show:true,backdrop:true})};</script>
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
					<a href="../cart!lookCart.action">
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
	<div class="banner-grid">
		<div id="visual">
			<div class="slide-visual">
				<!-- Slide Image Area (1000 x 424) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="images/ba1.jpg"
						alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="images/ba2.jpg"
						alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="images/ba3.jpg"
						alt="Dummy Image" /></li>
				</ul>

				<!-- Slide Description Image Area (316 x 328) -->
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script">
								<img class="img-responsive" src="images/baa1.jpg"
									alt="Dummy Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="images/baa2.jpg"
									alt="Dummy Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="images/baa3.jpg"
									alt="Dummy Image" />
							</div></li>
					</ul>
					<div class="slide-controller">
						<a href="#" class="btn-prev"><img src="images/btn_prev.png"
							alt="Prev Slide" /></a> <a href="#" class="btn-play"><img
							src="images/btn_play.png" alt="Start Slide" /></a> <a href="#"
							class="btn-pause"><img src="images/btn_pause.png"
							alt="Pause Slide" /></a> <a href="#" class="btn-next"><img
							src="images/btn_next.png" alt="Next Slide" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<script type="text/javascript" src="js/pignose.layerslider.js"></script>
		<script type="text/javascript">
			//<![CDATA[
			$(window).load(function() {
				$('#visual').pignoseLayerSlider({
					play : '.btn-play',
					pause : '.btn-pause',
					next : '.btn-next',
					prev : '.btn-prev'
				});
			});
			//]]>
		</script>

	</div>
	<!-- //banner -->
	<!-- content -->

	<div class="new_arrivals">
		<div class="container">
			<h3>
				<span>新&nbsp;款</span>&nbsp;&nbsp;上&nbsp;市
			</h3>
			<p>时代新女性，红与白，来自酷森的魅力！酷森时装！弘扬男士精品,一展男士风采！带给你不一样的风范与气派！</p>
			<div class="new_grids">
				<div class="col-md-4 new-gd-left">
					<img src="images/wed1.jpg" alt=" " />
					<div class="wed-brand simpleCart_shelfItem">
						<h4>Wedding Collections</h4>
						<h5>Flat 50% Discount</h5>

					</div>
				</div>
				<div class="col-md-4 new-gd-middle">
					<div class="new-levis">
						<div class="mid-img">
							<img src="images/levis1.png" alt=" " />
						</div>
						<div class="mid-text">
							<h4>
								up to 40% <span>off</span>
							</h4>
							<a class="hvr-outline-out button2">Shop now </a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="new-levis">
						<div class="mid-text">
							<h4>
								up to 50% <span>off</span>
							</h4>
							<a class="hvr-outline-out button2">Shop now </a>
						</div>
						<div class="mid-img">
							<img src="images/dig.jpg" alt=" " />
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 new-gd-left">
					<img src="images/wed2.jpg" alt=" " />
					<div class="wed-brandtwo simpleCart_shelfItem">
						<h4>Spring / Summer</h4>
						<p>Shop Men</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //content -->
	<!-- product-nav -->

	<div class="product-easy">
		<div class="container">
			<div class="sap_tabs">
				<div id="horizontalTab"width: 100%; margin: 0px;">
					<div class="resp-tabs-container">
						<c:forEach var="product" items="${goodsList}">
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../adminPage/images/${product.goodsPicUrl}" alt=""
											class="pro-image-front"> <img
											src="../adminPage/images/${product.goodsPicUrl}" alt=""
											class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a
													href="../goods_show!findGoodsInfo.action?goodsId=${product.goodsId}"
													class="link-product-add-cart">商品详情</a>
											</div>
										</div>
									</div>
									<div class="item-info-product ">
										<h4>
											<a
												href="goods_show!findGoodsInfo.action?goodsId=${product.goodsId}">${product.goodsTitle}</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">￥${product.goodsPrice}</span>
										</div>
										<a
											href="../cart!addCart.action?pid=${product.goodsId}&quantity=1"
											class="item_add single-item hvr-outline-out button2">加入购物车</a>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="clearfix"></div>
					</div>

				</div>


			</div>
		</div>
	</div>
	<!-- //product-nav -->
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
							<div class="login-bottom">
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
