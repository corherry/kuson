<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      
    <title>My JSP 'Success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-color:">
    <div style="margin: 50px;">
       <img alt="" src="images/logo-kuson01.png" width="279px;" height="111px;">
       <hr>
       <div style="margin:80px; text-align: center">
       	  <c:if test="${successMessage != null}">
         	 <img alt="" src="images/ok.png">&nbsp;<b> ${successMessage} </b><br>
          </c:if>
          <c:if test="${payMessage != null}">
          <img alt="" src="images/error1.png">&nbsp;<b> ${payMessage} </b>
          </c:if>
          <a href="index.action">返回首页</a>
       </div>
    </div>
  </body>
</html>
