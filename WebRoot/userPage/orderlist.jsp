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
<style type="text/css">
.button {
	display: inline-block;
	zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
	*display: inline;
	vertical-align: baseline;
	margin: 0 2px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
	text-decoration: none;
}
.button:active {
	position: relative;
	top: 1px;
}
.medium {
	font-size: 12px;
	padding: .4em 1.5em .42em;
}
/* color styles 
---------------------------------------------- */

/* black */
.black {
	color: #d7d7d7;
	border: solid 1px #333;
	background: #333;
	background: -webkit-gradient(linear, left top, left bottom, from(#666), to(#000));
	background: -moz-linear-gradient(top,  #666,  #000);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#666666', endColorstr='#000000');
}
.black:hover {
	background: #000;
	background: -webkit-gradient(linear, left top, left bottom, from(#444), to(#000));
	background: -moz-linear-gradient(top,  #444,  #000);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#444444', endColorstr='#000000');
}
.black:active {
	color: #666;
	background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#444));
	background: -moz-linear-gradient(top,  #000,  #444);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000', endColorstr='#666666');
}

/* gray */
.gray {
	color: #e9e9e9;
	border: solid 1px #555;
	background: #6e6e6e;
	background: -webkit-gradient(linear, left top, left bottom, from(#888), to(#575757));
	background: -moz-linear-gradient(top,  #888,  #575757);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#888888', endColorstr='#575757');
}
.gray:hover {
	background: #616161;
	background: -webkit-gradient(linear, left top, left bottom, from(#757575), to(#4b4b4b));
	background: -moz-linear-gradient(top,  #757575,  #4b4b4b);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#757575', endColorstr='#4b4b4b');
}
.gray:active {
	color: #afafaf;
	background: -webkit-gradient(linear, left top, left bottom, from(#575757), to(#888));
	background: -moz-linear-gradient(top,  #575757,  #888);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#575757', endColorstr='#888888');
}

/* white */
.white {
	color: #606060;
	border: solid 1px #b7b7b7;
	background: #fff;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
	background: -moz-linear-gradient(top,  #fff,  #ededed);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
}
.white:hover {
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
	background: -moz-linear-gradient(top,  #fff,  #dcdcdc);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');
}
.white:active {
	color: #999;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));
	background: -moz-linear-gradient(top,  #ededed,  #fff);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');
}

/* orange */
.orange {
	color: #fef4e9;
	border: solid 1px #da7c0c;
	background: #f78d1d;
	background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
	background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
}
.orange:hover {
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
	background: -moz-linear-gradient(top,  #f88e11,  #f06015);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
}
.orange:active {
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
	background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
}

/* red */
.red {
	color: #faddde;
	border: solid 1px #980c10;
	background: #d81b21;
	background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#aa1317));
	background: -moz-linear-gradient(top,  #ed1c24,  #aa1317);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ed1c24', endColorstr='#aa1317');
}
.red:hover {
	background: #b61318;
	background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115));
	background: -moz-linear-gradient(top,  #c9151b,  #a11115);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#c9151b', endColorstr='#a11115');
}
.red:active {
	color: #de898c;
	background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));
	background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#aa1317', endColorstr='#ed1c24');
}

/* blue */
.blue {
	color: #d9eef7;
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
	background: -moz-linear-gradient(top,  #00adee,  #0078a5);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}
.blue:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e');
}
.blue:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));
	background: -moz-linear-gradient(top,  #0078a5,  #00adee);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee');
}

/* rosy */
.rosy {
	color: #fae7e9;
	border: solid 1px #b73948;
	background: #da5867;
	background: -webkit-gradient(linear, left top, left bottom, from(#f16c7c), to(#bf404f));
	background: -moz-linear-gradient(top,  #f16c7c,  #bf404f);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f16c7c', endColorstr='#bf404f');
}
.rosy:hover {
	background: #ba4b58;
	background: -webkit-gradient(linear, left top, left bottom, from(#cf5d6a), to(#a53845));
	background: -moz-linear-gradient(top,  #cf5d6a,  #a53845);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#cf5d6a', endColorstr='#a53845');
}
.rosy:active {
	color: #dca4ab;
	background: -webkit-gradient(linear, left top, left bottom, from(#bf404f), to(#f16c7c));
	background: -moz-linear-gradient(top,  #bf404f,  #f16c7c);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#bf404f', endColorstr='#f16c7c');
}

/* green */
.green {
	color: #e8f0de;
	border: solid 1px #538312;
	background: #64991e;
	background: -webkit-gradient(linear, left top, left bottom, from(#7db72f), to(#4e7d0e));
	background: -moz-linear-gradient(top,  #7db72f,  #4e7d0e);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#7db72f', endColorstr='#4e7d0e');
}
.green:hover {
	background: #538018;
	background: -webkit-gradient(linear, left top, left bottom, from(#6b9d28), to(#436b0c));
	background: -moz-linear-gradient(top,  #6b9d28,  #436b0c);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#6b9d28', endColorstr='#436b0c');
}
.green:active {
	color: #a9c08c;
	background: -webkit-gradient(linear, left top, left bottom, from(#4e7d0e), to(#7db72f));
	background: -moz-linear-gradient(top,  #4e7d0e,  #7db72f);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#4e7d0e', endColorstr='#7db72f');
}

/* pink */
.pink {
	color: #feeef5;
	border: solid 1px #d2729e;
	background: #f895c2;
	background: -webkit-gradient(linear, left top, left bottom, from(#feb1d3), to(#f171ab));
	background: -moz-linear-gradient(top,  #feb1d3,  #f171ab);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#feb1d3', endColorstr='#f171ab');
}
.pink:hover {
	background: #d57ea5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f4aacb), to(#e86ca4));
	background: -moz-linear-gradient(top,  #f4aacb,  #e86ca4);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f4aacb', endColorstr='#e86ca4');
}
.pink:active {
	color: #f3c3d9;
	background: -webkit-gradient(linear, left top, left bottom, from(#f171ab), to(#feb1d3));
	background: -moz-linear-gradient(top,  #f171ab,  #feb1d3);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f171ab', endColorstr='#feb1d3');
}
</style>
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
			<h1><a href="index.html"><img src="images/logo-kuson01.png"></a></h1>
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
<!-- //banner-top -->
<!-- banner -->
<div class="page-head">
	<div class="container">
		<h3>个人中心</h3>
	</div>
</div>

<!-- mens -->
<div class="men-wear" width="100%">
	<div class="container">
		<div class="col-md-4 products-left treewidth1">
		  <div class="css-treeview treewidth">
				<h4>管理中心</h4>
				<ul class="tree-list-pad">
					<li><input type="checkbox" checked="checked" id="item-0" /><label for="item-0"><span></span>个人资料</label>
						<ul>
							<li><a href="personal.jsp" target="treemain">个人信息</a></li>
                            <li><a href="resetpassword.jsp" target="treemain">修改密码</a></li>
						</ul>
					</li>
					<li><input type="checkbox" id="item-1" checked="checked" /><label for="item-1">订单管理</label>
						<ul>
							<li><a href="../order!findOrderByUid.action" target="treemain">我的订单</a></li>
						</ul>
					</li>
					<li><input type="checkbox" checked="checked" id="item-2" /><label for="item-2">收货地址</label>
						<ul>
							<li><a href="../show_address!showAddress.action" target="treemain">查看地址</a></li>
							<li><a href="addaddress.jsp?op=0" target="treemain">添加地址</a></li>
       					</ul>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-8 products-right iframe01" style="margin:0px; padding:0px; height: 400px;">
		<div style="width:100%;height:100%; overflow-y:scroll; ">
          <div class="bs-docs-example">
             <div align="center" style=" margin:0px 0px;">
							<table cellspacing="0" cellpadding="0" align="center" width="95%" height="100%" border="1" bordercolor="#D9D9D9" >
								<c:forEach var="order" items="${pageBean.list}">					
									<tr>
										<td colspan="4">${order.orderTime}&nbsp;&nbsp;&nbsp;&nbsp;订单号:${order.orderNo}</td>
									</tr>
									<tr>
										<td>
											<table style="border-spacing: 10px; height: 100px;">
												<c:forEach var="orderItem" items="${order.orderItems}">
													<tr>
														<td width="15%" ><a
															href="../goods_show!findGoodsInfo.action?goodsId=${orderItem.product.goodsId}"
															target="_blank"><img width="50px" height="65px"
																src="../adminPage/images/${orderItem.product.goodsPicUrl}"
																title="${orderItem.product.goodsTitle}"></a></td>
														<td><a
															href="../goods_show!findGoodsInfo.action?goodsId=${orderItem.product.goodsId}"
															target="_blank" title="${orderItem.product.goodsTitle}">${orderItem.product.goodsTitle}</a></td>
														<td>￥${orderItem.product.goodsPrice}</td>
														<td>×${orderItem.quantity}</td>
													</tr>
												</c:forEach>
											</table>
										</td>

										<td><a title="
										${order.receiver}
${order.address}
${order.phone}">${order.emailuser.username}&nbsp;&nbsp;<img
												src="images/person.png"></a></td>
										<td>总额 ￥${order.total}</td>
										<td><c:choose>
												<c:when test="${order.status==0}">
													<font color="green" style="font-weight: 500; font-family: "SimHei">&nbsp;&nbsp;未付款</font>
													<br>
													<span class="button blue medium">付款</span>
												</c:when>
												<c:when test="${order.status==1}">
													<span class="button blue medium">已付款</span>
												</c:when>
												<c:when test="${order.status==2}">
													<font color="green" style="font-weight: 500; font-family: "SimHei">&nbsp;&nbsp;&nbsp;&nbsp;已发货</font>
													<br>
													<a
														href="../userOrder!changeStatus.action?status=3&orderId=${order.orderId}"><span
														class="button rosy medium">确认收货</span></a>
												</c:when>
												<c:when test="${order.status==3}">
													<span class="button green medium">交易完成</span>
												</c:when>
												<c:when test="${order.status==-1}">
													<span class="button white medium">已关闭</span>
												</c:when>
											</c:choose></td>
									</tr>
								</c:forEach>
							</table>
							<br>
               	  <c:if test="${pageBean.totalPage > 0}">
 				 <a href="../order!findOrderByUid.action?pageIndex=1">首页</a>
				 <a href="../order!findOrderByUid.action?pageIndex=${pageBean.pageIndex-1}">上一页</a>
				 <a href="../order!findOrderByUid.action?pageIndex=${pageBean.pageIndex+1}">下一页</a>
				 <a href="../order!findOrderByUid.action?pageIndex=${pageBean.totalPage}">末页</a>
				 (${pageBean.pageIndex}/${pageBean.totalPage})
				 </c:if>
               	<br>
               	<br>
               	<br>
               	</div>
          </div>
    
		</div>
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