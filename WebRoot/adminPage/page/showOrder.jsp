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
<script type="text/javascript" src="adminPage/js/menu1.js"></script>
<script type="text/javascript">

function del_confirm()
{
var r=confirm("确定要删除该商品吗？");
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
				<s:if test="#session.admin.adminAuthority == 0 ||  #session.admin.adminAuthority == 2">
				<li>
					<h4 class="M1">
						<span></span>订单管理
					</h4>
					<div class="list-item none" style="display:block;">
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
					<div class="list-item none">
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
					<li>订单管理</li>
					<li>></li>
					<li>
						<c:if test="${requestScope.status == 0}">
							待付款订单
						</c:if>
						<c:if test="${requestScope.status == -1}">
							已关闭订单
						</c:if>
						<c:if test="${requestScope.status == 1}">
							已付款订单
						</c:if>
						<c:if test="${requestScope.status == 2}">
							已发货订单
						</c:if>
						<c:if test="${requestScope.status == 3}">
							已完成订单
						</c:if>
						<c:if test="${requestScope.status == 5}">
							所有订单
						</c:if>
					</li>
				</ul>
			</div>
			<div class="main">
			  <div align="center" style=" margin:20px;">
		 		 <table cellspacing = "0" cellpadding = "0" align ="center" width = "95%">
                   <c:forEach var = "order" items="${pageBean.list}">
                   	<tr >
                   		<td colspan="4"><hr color="#D8D8D8">${order.orderTime}&nbsp;&nbsp;&nbsp;&nbsp;订单号:${order.orderNo}<hr color="#D8D8D8"></td>
                   	</tr>
                    <tr>
                      <td>
                      	<table style="border-spacing: 10px">
                      		<c:forEach var = "orderItem" items="${order.orderItems}">
                      			<tr>
                      				<td width="15%"><a href="goods_show!findGoodsInfo.action?goodsId=${orderItem.product.goodsId}" target="_blank"><img width="50px" height="50px" src="adminPage/images/${orderItem.product.goodsPicUrl}" title="${orderItem.product.goodsTitle}"></a></td>
                      				<td><a href="goods_show!findGoodsInfo.action?goodsId=${orderItem.product.goodsId}" target="_blank" title="${orderItem.product.goodsTitle}">${orderItem.product.goodsTitle}</a></td>
                     				<td>￥${orderItem.product.goodsPrice}</td>
                     				<td>×${orderItem.quantity}</td>
                      			</tr>
                      		</c:forEach>
                      	</table>
                      </td>

                      <td><a 
                      title="${order.receiver}
${order.address}
${order.phone}">${order.emailuser.username}&nbsp;&nbsp;<img src="userPage/images/person.png"></a></td>
                      <td>总额 ￥${order.total}</td>
                      <td>	
                      	<c:choose>
						   <c:when test="${order.status==0}">
						   		<span class="button blue medium">未付款</span>
						   </c:when>
						   <c:when test="${order.status==1}"><font color="green" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;已付款</font><br><a href="order!changeStatus.action?status=2&orderId=${order.orderId}"><span class="button blue medium">发货</span></a></c:when>
						   <c:when test="${order.status==2}"><span class="button rosy medium">已发货</span></c:when>
						   <c:when test="${order.status==3}"><span class="button green medium">交易完成</span></c:when>
						   <c:when test="${order.status==-1}"><span class="button while medium">已关闭</span></c:when>
						 </c:choose>         
                      </td>
                    </tr>
                   </c:forEach>
                 </table>
                 <c:if test="${pageBean.totalPage > 0}">
 				 <a href="order!findOrderByStatus.action?pageIndex=1&status=${requestScope.status}">首页</a>
				 <a href="order!findOrderByStatus.action?pageIndex=${pageBean.pageIndex-1}&status=${requestScope.status}">上一页</a>
				 <a href="order!findOrderByStatus.action?pageIndex=${pageBean.pageIndex+1}&status=${requestScope.status}">下一页</a>
				 <a href="order!findOrderByStatus.action?pageIndex=${pageBean.totalPage}&status=${requestScope.status}">末页</a>
				 (${pageBean.pageIndex}/${pageBean.totalPage})
				 </c:if>
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
