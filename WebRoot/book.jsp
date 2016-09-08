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
										    <li class="active" ><a href="index.jsp" style="left: 0px; width: 191px;">阅毒主页</a></li>
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
								<div></div>
								<table>
								     <s:iterator id="item" value="#session.book" status="status">  
								     <tr>
								     <table>
 								     <tr><td><img src=" images//${item.picture } "width="192" height="270"></td><td></td></tr> 
                                     <tr><td>ISBN：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.isbn}&nbsp;</td></tr>  
    							     <tr><td>书名：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.bname}&nbsp;</td></tr> 
    							     <tr><td>作者：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.author}&nbsp;</td></tr>  
    							     <tr><td>出版社：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.press}&nbsp;</td></tr> 
    							     <tr><td>出版日期：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.publicationDate}&nbsp;</td></tr>  
    							     <tr><td>售价：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.price}&nbsp;</td></tr>
    							     <tr><td>简介：&nbsp;&nbsp;</td><td valign="top"><br></td><td width="400">${item.discription }&nbsp;</td></tr>
    							     <tr><td>目录：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.cata}&nbsp;</td></tr>
    							     <c:if test="${uname != null}" var="result" scope="session">
    							      <tr><td valign="top">
    							     <input type="button" value="购买" onclick="location.href='buy.action?order.id=${uid}&&order.isbn=${item.isbn}'">
    							     </td><td><br></td>
    							     <td><input type="button" value="加购物车" onclick="location.href='addToCart.action?shoppingCarts.id=${uid}&&shoppingCarts.isbn=${item.isbn}&&shoppingCarts.price=${item.price }'"></td>
    							     </tr>
    							     </c:if>						
								</table>
								</tr>
								</s:iterator>
								</table>									
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