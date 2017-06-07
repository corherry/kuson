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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酷森后台管理系统</title>
<link type="text/css" rel="stylesheet" href="adminPage/css/style1.css" />
<script type="text/javascript" src="adminPage/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="adminPage/js/menu1.js"></script>
<link rel="Stylesheet" type="text/css"
	href="adminPage/css/loginDialog.css" />
<script type="text/javascript">
function del_confirm()
{
var r=confirm("确定要删除该管理员吗？");
if (r==true)
  {
    return true;
  }
else
  {
    return false;
  }
}
</script>
</head>

<body>
	<div class="top"></div>
	<div id="header">
		<div class="logo">后台管理系统</div>
		<div class="navigation">
			<ul>
				<li>欢迎您：</li>
				<li><a href="adminPage/page/adminInformation.jsp"><s:property
							value="#session.admin.adminName"></s:property></a></li>
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
						<a href="adminPage/page/adminInformation.jsp">基本信息</a> <a
							href="adminPage/page/resetPassword.jsp">修改密码</a>
					</div>
				</li>
				<s:if test="#session.admin.adminAuthority <= 1 ">
					<li>
						<h4 class="M5">
							<span></span>分类管理
						</h4>
						<div class="list-item none">
							<a href="category!showFirstCategory.action">分类列表</a>
						</div>
					</li>
					<li>
						<h4 class="M6">
							<span></span>商品管理
						</h4>
						<div class="list-item none">
							<a href="goods_show.action">商品信息</a>
						</div>
					</li>
				</s:if>
				<s:if
					test="#session.admin.adminAuthority == 0 ||  #session.admin.adminAuthority == 2">
					<li>
						<h4 class="M1">
							<span></span>订单管理
						</h4>
						<div class="list-item none">
									<a href="order!findOrderByStatus.action?pageIndex=1&status=5">所有订单</a> 
						<a href="order!findOrderByStatus.action?pageIndex=1&status=0">待付款订单</a> 
						<a href="order!findOrderByStatus.action?pageIndex=1&status=1">待发货订单</a> 
						<a href="order!findOrderByStatus.action?pageIndex=1&status=2">已发货订单</a>
						<a href="order!findOrderByStatus.action?pageIndex=1&status=3">已完成订单</a> 
						<a href="order!findOrderByStatus.action?pageIndex=1&status=-1">已关闭订单</a>
						</div>
					</li>
				</s:if>
				<s:if test="#session.admin.adminAuthority == 0 ">
					<li>
						<h4 class="M9">
							<span></span>用户管理
						</h4>
						<div class="list-item none">
							<a href="user_show!findUser.action?pageIndex=1">用户信息</a>
						</div>
					</li>
					</li>
					<li>
						<h4 class="M10">
							<span></span>权限管理
						</h4>
						<div class="list-item none" style="display:block;">
							<a href="admin_show!findAdminByAuthority.action?pageIndex=1&adminAuthority=2">订单管理员</a> 
							<a href="admin_show!findAdminByAuthority.action?pageIndex=1&adminAuthority=1">商品管理员</a> 
							<a href="admin_show!findAdminByAuthority.action?pageIndex=1&adminAuthority=3">订单配送员</a>
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
					<li>权限管理</li>
					<li>></li>
					<li>
						<s:if test="#parameters.adminAuthority[0] == 2">
							订单管理员
						</s:if> 
						<s:elseif test="#parameters.adminAuthority[0] == 1">
							商品管理员
						</s:elseif> 
						<s:else>
							配送管理员
						</s:else>
					</li>
				</ul>
			</div>
			<% int cas = 0; %>
			<div class="main">
				<div align="center" style=" margin:20px;">
					<p align="center"><a href="adminPage/page/addAdmin.jsp?adminAuthority=${requestScope.adminAuthority}"><img src="adminPage/images/add_user.png" title="添加管理员"/></a></p>
					<table border="1" cellspacing="0" cellpadding="0" align="center"
						width="100%">
						<tr>
							<th>序号</th>
							<th>管理员账号</th>
							<th>姓名</th>
							<th>类型</th>
							<th>操作</th>
						</tr>
						<c:forEach var="admin" items="${pageBean.list}">
							<% cas++; %>
							<tr>
								<td align="center"><%= cas %></td>
								<td align="center">${admin.adminAccount}</td>
								<td align="center">${admin.adminName}</td>
								<td align="center">
									<c:if test="${admin.adminAuthority==1}">商品管理员</c:if>
									<c:if test="${admin.adminAuthority==2}">订单管理员</c:if> 
									<c:if test="${admin.adminAuthority==3}">订单配送员</c:if>
								</td>
								<td align="center">
									<a href="admin_show!findAdminById?adminId=${admin.adminId}"><img src="adminPage/images/update_user.png" title="修改管理员"/></a>&nbsp;&nbsp;|&nbsp;&nbsp;
									<a onclick="return del_confirm();" href="admin_show!delete.action?adminId=${admin.adminId}&adminAuthority=${admin.adminAuthority}"><img src="adminPage/images/delete_user.png" title="删除管理员"/></a>
								</td>
							</tr>	 
						</c:forEach>
					</table>
					<a href="admin_show!findAdminByAuthority.action?pageIndex=1&adminAuthority=${requestScope.adminAuthority}">首页</a>
					<a href="admin_show!findAdminByAuthority.action?pageIndex=${pageBean.pageIndex-1}&adminAuthority=${requestScope.adminAuthority}">上一页</a>
					<a href="admin_show!findAdminByAuthority.action?pageIndex=${pageBean.pageIndex+1}&adminAuthority=${requestScope.adminAuthority}">下一页</a>
					<a href="admin_show!findAdminByAuthority.action?pageIndex=${pageBean.totalPage}&adminAuthority=${requestScope.adminAuthority}">末页</a>
					(${pageBean.pageIndex}/${pageBean.totalPage})
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
