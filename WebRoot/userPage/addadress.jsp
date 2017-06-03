<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加地址</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
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
  <div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-bottom">
										<h3>添加收获地址</h3>
										<c:if test="${info!=null}">
										<h4><s:property value="#session.info"></s:property></h4>
										</c:if>
											<s:form action="address_add!addAddress.action" method="post" theme="simple" namespace="/">
											<div class="sign-up">
												收货人姓名: <s:textfield name="receiver" label="邮箱"/>
											</div>
											<div class="sign-up">
												联系方式: <s:textfield name="phone" label="密码"/>
											</div>
											<div class="sign-up">
												详细地址: <s:textfield name="address" label="密码"/>
											</div>
											<div class="sign-up">
												邮政编码: <s:textfield name="postcode" label="密码"/>
											</div>
											<div class="sign-up">
												<s:submit value="确认添加"/>
											</div>
										</s:form>
									</div>
									<div class="clearfix"></div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
</body>
</html>
