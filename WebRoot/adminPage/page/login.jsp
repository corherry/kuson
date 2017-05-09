<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="adminPage/css/style.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="App Loction Form,Login Forms,Sign up Forms,Registration Forms,News latter Forms,Elements" ./>
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
</script>
<!--webfonts-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!--//webfonts-->

</head>

<body>
	<h1>酷森服装管理系统</h1>
	<div class="app-location">
		<h2>Welcome to Kuson</h2>
		<div class="line">
			<span></span>
		</div>
		<div class="location">
			<img src="adminPage/images/location.png" class="img-responsive" alt="" />
		</div>
		<s:form action="admin_login!login.action" method="post" namespace="/">
			<input name="admin.adminAccount" type="text" class="text" value="Admin account"
				onFocus="this.value = '';"
				onBlur="if (this.value == '') {this.value = 'Admin account';}">
			<input name="admin.adminPassword" type="password" value="Password" onFocus="this.value = '';"
				onBlur="if (this.value == '') {this.value = 'Password';}">
			<div class="submit">
				<input type="submit" onClick="myFunction()" value="Sign in">
			</div>
			<div class="clear"></div>
		</s:form>
	</div>
</body>
</html>
