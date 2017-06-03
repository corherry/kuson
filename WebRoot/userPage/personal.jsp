<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Personal</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
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
<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
</head>
<body>
<!-- header -->
<div class="header">
	<div class="container">
		<ul>
		<c:if test="${user.username==null}">
            <li>Hi,欢迎来到酷森旗舰店</li>
			<li><a href="#" data-toggle="modal" data-target="#myModal402"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>请登录</a></li>
			<li><a href="#" data-toggle="modal" data-target="#myModal401"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>免费注册</a></li>
		</c:if>
		<c:if test="${user.username!=null}">
		<li>欢迎您：</li>
		<li><s:property value="#session.user.username"></s:property></li>
		<li><a href="logoff"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>退出</a></li>
		</c:if>
		</ul>
	</div>
</div>
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
	<div class="container">
		<div class="col-md-3 header-left">
			<h1><a href="index.html"><img src="images/logo-kuson01.png"></a></h1>
	  </div>
		<div class="col-md-6 header-middle">
			<form>
				<div class="search">
					<input type="search" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}" required>
				</div>
				<div class="section_room">
					<select id="country" onChange="change_country(this.value)" class="frm-field required">
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
			    <c:if test="${user.username==null }">
			    <li><a href="#" data-toggle="modal" data-target="#myModal402" class="use1"><span>Manage</span></a></li>
			    </c:if>
			    <c:if test="${user.username!=null }">
			    <li><a href="personal.jsp" class="use1"><span>Manage</span></a></li>
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
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav menu__list">
					<li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">&nbsp;首 &nbsp;页&nbsp; <span class="sr-only">(current)</span></a></li>
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;男&nbsp;装&nbsp;&nbsp;&nbsp; <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
										<a href="mens.html"><img src="images/woo1.jpg" alt=" "/></a>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="mens.jsp">Clothing</a></li>
											<li><a href="mens.jsp">Wallets</a></li>
											<li><a href="mens.jsp">Footwear</a></li>
											<li><a href="mens.jsp">Watches</a></li>
											<li><a href="mens.jsp">Accessories</a></li>
											<li><a href="mens.jsp">Bags</a></li>
											<li><a href="mens.jsp">Caps & Hats</a></li>
										</ul>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="mens.jsp">Jewellery</a></li>
											<li><a href="mens.jsp">Sunglasses</a></li>
											<li><a href="mens.jsp">Perfumes</a></li>
											<li><a href="mens.jsp">Beauty</a></li>
											<li><a href="mens.jsp">Shirts</a></li>
											<li><a href="mens.jsp">Sunglasses</a></li>
											<li><a href="mens.jsp">Swimwear</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;女&nbsp;装&nbsp;&nbsp;&nbsp; <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="womens.jsp">Clothing</a></li>
											<li><a href="womens.jsp">Wallets</a></li>
											<li><a href="womens.jsp">Footwear</a></li>
											<li><a href="womens.jsp">Watches</a></li>
											<li><a href="womens.jsp">Accessories</a></li>
											<li><a href="womens.jsp">Bags</a></li>
											<li><a href="womens.jsp">Caps & Hats</a></li>
										</ul>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="womens.jsp">Jewellery</a></li>
											<li><a href="womens.jsp">Sunglasses</a></li>
											<li><a href="womens.jsp">Perfumes</a></li>
											<li><a href="womens.jsp">Beauty</a></li>
											<li><a href="womens.jsp">Shirts</a></li>
											<li><a href="womens.jsp">Sunglasses</a></li>
											<li><a href="womens.jsp">Swimwear</a></li>
										</ul>
									</div>
									<div class="col-sm-6 multi-gd-img multi-gd-text ">
										<a href="womens.jsp"><img src="images/woo.jpg" alt=" "/></a>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>
					<li class=" menu__item"><a class="menu__link" href="electronics.html">&nbsp;&nbsp;&nbsp;户&nbsp;外&nbsp;&nbsp;&nbsp;</a></li>
					<li class=" menu__item"><a class="menu__link" href="codes.html">&nbsp;&nbsp;&nbsp;童&nbsp;装&nbsp;&nbsp;&nbsp;</a></li>
					<li class=" menu__item"><a class="menu__link" href="contact.html">&nbsp;&nbsp;&nbsp;内&nbsp;衣&nbsp;&nbsp;&nbsp;</a></li>
				  </ul>
				</div>
			  </div>
			</nav>	
		</div>
		<div class="top_nav_right">
			<div class="cart box_1">
						<a href="checkout.html">
							<h3> <div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> 项)</div>
								
							</h3>
						</a>
						<c:if test="${user.username==null }">
						<p><a href="#" data-toggle="modal" data-target="#myModal402" class="simpleCart_empty">购物车</a></p>
						</c:if>
						<c:if test="${user.username!=null }">
						<p><a href="cart.jsp" class="simpleCart_empty">购物车</a></p>
						</c:if>
			</div>	
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //banner-top -->
<!-- banner -->
<div class="page-head">
	<div class="container">
		<h3>个人中心</h3>
	</div>
</div>

<!-- mens -->
<div class="men-wear">
	<div class="container">
		<div class="col-md-4 products-left treewidth1">
		  <div class="css-treeview treewidth">
				<h4>管理中心</h4>
				<ul class="tree-list-pad">
					<li><input type="checkbox" checked="checked" id="item-0" /><label for="item-0"><span></span>个人资料</label>
						<ul>
							<li><a href="information.jsp" target="treemain">个人信息</a></li>
							<li><a href="updatainfo.jsp" target="treemain">修改姓名</a></li>
                            <li><a href="resetpassword.jsp" target="treemain">修改密码</a></li>
						</ul>
					</li>
					<li><input type="checkbox" id="item-1" checked="checked" /><label for="item-1">订单管理</label>
						<ul>
							<li><a href="orderlist.jsp" target="treemain">我的订单</a></li>
						</ul>
					</li>
					<li><input type="checkbox" checked="checked" id="item-2" /><label for="item-2">收货地址</label>
						<ul>
							<li><a href="adressinfo.jsp" target="treemain">查看信息</a></li>
							<li><a href="addadress.jsp" target="treemain">增加信息</a></li>
       					</ul>
					</li>
                    <li><input type="checkbox" checked="checked" id="item-3" /><label for="item-3">钱包</label>
						<ul>
							<li><a href="wallet.jsp" target="treemain">交易记录</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-8 products-right iframe01">
             <iframe name="treemain" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" class="iframe01" > </iframe>
		</div>
		
	</div>
</div>	
<!-- //mens -->
<!-- footer -->
<div class="footer">
	<div class="container">
        <div><img src="images/tail.png"/></div>
	  <div class="col-md-3 footer-left">
            
		<h2><a href="index.html"><img src="images/logo-kuson02.gif" alt=" " /></a></h2>
			<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur, adipisci velit, sed quia non 
			numquam eius modi tempora incidunt ut labore 
			et dolore magnam aliquam quaerat voluptatem.</p>
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
		<p class="copy-right">Copyright &copy; 2017.Company name All rights reserved.酷森服装</p>
	</div>
</div>
<!-- //footer -->
<!-- login -->
			<div class="modal fade" id="myModal401" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-bottom">
										<h3>免费注册</h3>
										<form>
											<div class="sign-up">
                                               
											  <h4><img class="img1" src="images/envelope.png" /></h4>
												<input type="text" value="邮箱" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '邮箱';}" required>	
											</div>
											<div class="sign-up">
												<h4><img class="img1" src="images/password05.png" /></h4>
												<input type="password" value="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}" required>
												
											</div>
											<div class="sign-up">
												<h4><img class="img1" src="images/password06.png" /></h4>
												<input type="password" value="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}" required>
												
											</div>
											<div class="sign-up">
												<input type="submit" value="注册" >
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
			<div class="modal fade" id="myModal402" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-right">
										<h3>密码登录</h3>
										<form>
											<div class="sign-in">
												<img class="img1" src="images/envelope.png" />
												<input type="text" value="邮箱" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '邮箱';}" required>	           
											</div>
											<div class="sign-in">
												<h4><img class="img1" src="images/password05.png" /></h4>
												<input type="password" value="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}" required>
												<a href="#">忘记密码?</a>
											</div>
											<div class="single-bottom">
												<input type="checkbox"  id="brand" value="">
												<label for="brand"><span></span>记住密码.</label>
											</div>
											<div class="sign-in">
												<input type="submit" value="登录" >
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
