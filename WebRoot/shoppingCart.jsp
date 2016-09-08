<%@ page  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>

<head>
	<title>首页</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
		<link href="css/ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<!--[if IE 7]>
        <link href="css/ie7.css" rel="stylesheet" type="text/css" />  
	<![endif]-->
    <style type="text/css">
<!--
.STYLE1 {	color: #00CC99;
	font-size: 24px;
	font-weight: bold;
}
.STYLE2 {color: #003300}
-->
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
								      </div>
                                       <div></div>
                                       <ul class="navigation">
										    <li class="active" ><a href="index.jsp" style="left: 0px; width: 191px;">书城主页</a></li>
											<li><a href="allBook.action" style="left: 0px; width: 192px;">所有书籍</a></li>
											<li><a href="clearSearch.action" style="left: 0px; width: 192px;">查找书籍</a></li>
											 <c:if test="${uname != null}" var="result" scope="session">
											 <li ><a href="" style="left: 0px; width: 189px;">查看购物车</a></li>
											 </c:if>
											  <c:if test="${uname != null}" var="result" scope="session">
											  <li ><a href="lookOrder.action?order.id=${uid}" style="left: 0px; width: 183px;">查看订单</a></li>
											  </c:if>
											   <c:if test="${uname != null}" var="result" scope="session">
											  <li ><a href="userData.jsp" style="left: 0px; width: 183px;">个人管理</a></li>
											  </c:if>
									  </ul>
										<p>&nbsp;</p>
									</div>	
								<div id="contentDIV" >
								<table border="0">
								<tr>
    							    <td>书号ISBN</td>
    							    <td>&nbsp;单价&nbsp;</td>
    							    <td>&nbsp;数量&nbsp;</td>
    							    <td>&nbsp;&nbsp;</td>
    							</tr>
								<s:iterator id="item" value="#session.shoppingcarts" status="status">  
								<tr>     
    							    <td>&nbsp;&nbsp;${item.isbn}&nbsp;</td>
    							    <td>${item.price}&nbsp;&nbsp;</td>
    							    <td>${item.number}&nbsp;&nbsp;</td>
    							    <td>
    							    <td><a href="deleteFromCart.action?cart.id=${uid}&&cart.isbn=${item.isbn }">删除</a>
								</s:iterator>  
								</table>										
						        </div>
						        <div>
						        <form action="buyCart.action">
						        <s:submit value="结算" />
						        </form>
						        </div>
						</div>
					 </div>
					 <div class="shadow">&nbsp;</div>
			  </div>  
			    
	  </div>    
	</div>
	
<script language="JavaScript" type="text/javascript"> 
</script> 
</body>
</html>