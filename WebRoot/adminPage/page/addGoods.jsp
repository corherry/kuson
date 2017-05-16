<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div align="center">
    	<s:form action="goods_show!addGoods.action" method="post" namespace="/" enctype="multipart/form-data">
    	<s:file name="upload" label="商品图片"></s:file>
    	<s:textfield name="goods.goodsNo" label="商品编号"></s:textfield>
    	<s:textfield name="goods.goodsTitle" label="商品标题"></s:textfield>
    	<s:textfield name="goods.goodsPrice" label="商品价格"></s:textfield>
    	<s:textfield name="goods.goodsSize" label="商品尺寸"></s:textfield>
    	<s:textfield name="goods.goodsColor" label="商品颜色"></s:textfield>
    	<s:textfield name="goods.goodsAmount" label="商品库存"></s:textfield>
    	<s:submit value="提交" align="center"/>
    	</s:form>
    </div>
  </body>
</html>
