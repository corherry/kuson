<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酷森后台管理系统</title>
<link type="text/css" rel="stylesheet" href="adminPage/css/style1.css" />
<script type="text/javascript" src="adminPage/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="adminPage/js/menu.js"></script>

</head>

<body>
	<div class="top"></div>
	<div id="header">
		<div class="logo">后台管理系统</div>
		<div class="navigation">
			<ul>
				<li>欢迎您：</li>
				<li><a href="adminPage/page/adminInformation.jsp"><s:property value="#session.admin.adminName"></s:property></a></li>
				<li>| <a href="adminPage/index.jsp">&nbsp;我的主页</a></li>
				<li>| <a href="adminPage/page/resetPassword.jsp">&nbsp;修改密码</a></li>
				<li>| <a href="adminPage/page/login.jsp">&nbsp;退出</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="left_menu">
			<ul id="nav_dot">
				<li>
					<h4 class="M3">
						<span></span>个人设置
					</h4>
					<div class="list-item none">
						<a href="adminPage/page/adminInformation.jsp" >基本信息</a>
						<a href="adminPage/page/resetPassword.jsp">修改密码</a>
					</div>
				</li>
				<s:if test="#session.admin.adminAuthority <= 1 ">
				<li>
					<h4 class="M5">
						<span></span>分类管理
					</h4>
					<div class="list-item none">
						<a href="adminPage/page/typeList.jsp">分类列表</a>
					</div>
				</li>
				<li>
					<h4 class="M6">
						<span></span>商品管理
					</h4>
					<div class="list-item none">
						<a href="adminPage/page/goodsInformation.jsp">商品信息</a>
					</div>
				</li>
				</s:if>
				<s:if test="#session.admin.adminAuthority == 0 ||  #session.admin.adminAuthority == 2">
				<li>
					<h4 class="M1">
						<span></span>订单管理
					</h4>
					<div class="list-item none">
						<a href="adminPage/page/nopayOrder.jsp">待付款订单</a> <a href="adminPage/page/nosentOrder.jsp">待发货订单</a> <a href="adminPage/page/sentedOrder.jsp">已发货订单</a>
						<a href="adminPage/page/finishedOrder.jsp">已完成订单</a> <a href="adminPage/page/noevalutionOrder.jsp">待评价订单</a> <a href="adminPage/page/allOrder.jsp">所有订单</a> <a
							href="adminPage/page/closeOrder.jsp">已关闭订单</a>
					</div>
				</li>
				</s:if>
				<s:if test="#session.admin.adminAuthority == 0 ">
				<li>
					<h4 class="M9">
						<span></span>用户管理
					</h4>
					<div class="list-item none">
						<a href="#">用户信息</a>
					</div>
				</li>
				</li>
				<li>
					<h4 class="M10">
						<span></span>权限管理
					</h4>
					<div class="list-item none"  style="display:block;">
						<a href="admin_show!getAdmin.action?adminAuthority=2">订单管理员</a> 
						<a href="admin_show!getAdmin.action?adminAuthority=1">商品管理员</a> 
						<a href="admin_show!getAdmin.action?adminAuthority=3">订单配送员</a>
					</div>
				</li>
				</s:if>
			</ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
				<ul>
					<li><img src="adminPage/images/home.png"></li>
					<li style="margin-left:25px;">您当前的位置：</li>
					<li><a href="adminPage/page/adminInformation.jsp">个人设置</a></li>
					<li>></li>
					<li><a href="adminPage/page/adminInformation.jsp">基本信息</a></li>
				</ul>
			</div>
			<div class="main">
			  <div align="center" style=" margin:20px;">
				 <table border ="1" cellspacing = "0" cellpadding = "0" align ="center" width = "800">
                   <tr>
                     <th>管理员账号</th><th>姓名</th><th>类型</th><th>操作</th>
                   </tr>
                   <c:forEach var = "admin" items = "${requestScope.list}" varStatus="status">
                    <tr <c:if test="${status.index%2 == 1 }"> style="background-color:rgb(240,248,255);" </c:if> >
                       <td align="center">${admin.adminAccount}</td>
                       <td align="center">${admin.adminName}</td>
                       <td align="center">
                           <c:if test="${admin.adminAuthority==1}">商品管理员</c:if>
                           <c:if test="${admin.adminAuthority==2}">订单管理员</c:if>
                           <c:if test="${admin.adminAuthority==3}">订单配送员</c:if>
                       </td>
                     
                       
                       <td align="center"><a href="#">修改</a>|<a href="admin_show!delete.action?adminId=${admin.adminId}&adminAuthority=${requestScope.adminAuthority}">删除</a></td>
                    </tr>
                   </c:forEach>
                 </table>
                 <a href = "admin_show!getAdmin.action?pageIndex=1&adminAuthority=${requestScope.adminAuthority}">首页</a>
				 <a href = "admin_show!getAdmin.action?pageIndex=<%= (Integer)request.getAttribute("pageIndex") - 1%>&adminAuthority=${requestScope.adminAuthority}
">上一页</a>
				 <a href = "admin_show!getAdmin.action?pageIndex=<%= (Integer)request.getAttribute("pageIndex") + 1%>&adminAuthority=${requestScope.adminAuthority}">下一页</a>
				 <a href = "admin_show!getAdmin.action?pageIndex=<%= request.getAttribute("totalPages")%>&adminAuthority=${requestScope.adminAuthority}">末页</a>
				 (<%= request.getAttribute("pageIndex")%>/<%= request.getAttribute("totalPages")%>)
               </div>   
			</div>
		</div>
	</div>
	<div class="bottom"></div>
	<div id="footer">
		<p>
			Copyright© 2017 版权所有 Company name All rights reserved.酷森服装</a>
		</p>
	</div>
	<script>navList(12);</script>
</body>
</html>
