<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>

<title>My JSP 'login.jsp' starting page</title>

</head>
<body>
	<div align="center">
		<s:form action="register" method="post" namespace="/" >
			<s:textfield name="user.username" style="font-size:12px;width: 120px;"
				label="用户名" />
			<s:textfield name="user.email" style="font-size:12px;width: 120px;"
				label="邮箱" />
			<s:password name="user.password" style="font-size:12px;width:120px;"
				label="密  码" /><br>
			<s:submit value="注册" align="center"/>
		</s:form>
	</div>
</body>
</html>
