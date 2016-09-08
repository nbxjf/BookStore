<%@ page  pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>

<head>
	<title>首页</title>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

.STYLE1 {	color: #00CC99;
	font-size: 24px;
	font-weight: bold;
}

    </style>
</head>

<body background="./images/bg-body.gif">
	  <div id="background">
		<div id="page">
			<div class="header">
				<div class="footer">
					<div class="body">
						<div id="sidebar">
							<div align="center">
								<p><a href="index.jsp"><span class="STYLE1">网上书城</span></a></p>
								<table width="200" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
									  <c:if test="${empty uname}" var="result" scope="session">
									     <td><div align="center"><a href="login.jsp">登录</a></div></td>
									     <td><div align="center"><a href="register.jsp">注册</a></div></td>
									   </c:if>
									   <c:if test="${uname != null}" var="result" scope="session">
									     <td><div align="center">你好  ${uname}</div></td>
									     <td><div align="center"><a href="delman.action">注销</a></div></td>
									   </c:if>
									 </tr>
                                 </table>
							</div><!-- </center> -->
                         <div><!-- </sidebar -->
					</div><!-- </body> -->
                    <ul class="navigation">
						<li class="active" ><a href="index.jsp" style="left: 0px; width: 191px;">书城主页</a></li>
						<li><a href="allBook.action" style="left: 0px; width: 192px;">所有书籍</a></li>
						<li><a href="clearSearch.action" style="left: 0px; width: 192px;">查找书籍</a></li>
						<c:if test="${uname != null}" var="result" scope="session">
						<li ><a href="lookshoppingCart.action?cart.id=${uid}" style="left: 0px; width: 189px;">查看购物车</a></li>
						</c:if>
						<c:if test="${uname != null}" var="result" scope="session">
						<li ><a href="lookOrder.action?order.id=${uid}" style="left: 0px; width: 183px;">查看订单</a></li>
						</c:if>
						<c:if test="${uname != null}" var="result" scope="session">
						<li ><a href="userData.jsp" style="left: 0px; width: 183px;">个人管理</a></li>
						</c:if>
						<td><div align="center"><a href="ManagerLogin.jsp">管理员登录</a></div></td>
					</ul>
					<p>&nbsp;</p>
				</div><!-- </footer -->
					
					<!--  <img src="images/xpic3366.jpg" width="800" height="433" alt="" title="">-->
					欢迎进入网上书城
		</div>  <!-- </header> -->	    
	  </div>   <!-- </page -->
	</div><!-- <background> -->
	
<script language="JavaScript" type="text/javascript"> 
</script> 
</body>
</html>