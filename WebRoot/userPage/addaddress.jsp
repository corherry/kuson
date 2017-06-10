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
			<div class="col-md-8 products-right iframe01">
				<div class="bs-docs-example">
					<s:form action="address_add!addAddress.action" method="post"
						theme="simple" namespace="/" onsubmit="return ok()">
						<c:if test="${param.op==1}">
						<s:hidden name="op" value="1"></s:hidden>
						</c:if>
						<c:if test="${param.op==0}">
						<s:hidden name="op" value="0"></s:hidden>
						</c:if>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="2" align="center">添加收货地址</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>收货人姓名</td>
									<td><s:textfield name="receiver" id="name"/>
									</td>
								</tr>
								<tr>
									<td>联系方式</td>
									<td><s:textfield name="phone" id="call"/></td>
								</tr>
								<tr>
									<td>详细地址</td>
									<td><s:textfield name="address" id="address"/></td>
								</tr>
								<tr>
									<td align="center" colspan="2"><s:submit value="确认添加"/></td>
								</tr>
							</tbody>
						</table>
					</s:form>
					<script type="text/javascript">
						function ok(){
							var name=document.getElementById("name");
							var call=document.getElementById("call");
							var address=document.getElementById("address");
							var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
							if(name.value=="" || call.value==""|| address.value==""){
								alert("收件人/手机/地址不能为空!");
								return false;
							}else if(!myreg.test(call.value)){
								alert("请输入正确的手机号");
								return false;
							}
							return true;
						}
					</script>
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
									  alert("姓名不能为空！")
									  return false;
									}else if(psw.value==""){
										alert("密码不能为空!")
										return false;
									}else if(repass.value==""){
										alert("请再次输入确认密码!")
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
 

