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
											 <li ><a href="lookshoppingCart.action?cart.id=${uid}" style="left: 0px; width: 189px;">查看购物车</a></li>
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
								
								     <s:iterator id="item" value="#session.userData" status="status">  
								     <tr id="<s:property value='#status。id'/>"> 
								     <table>
                                     <tr><td>用户名：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.uname }&nbsp;</td></tr>  
    							     <tr><td>密码：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.upass }&nbsp;</td></tr> 
    							     <tr><td>地址：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.address }&nbsp;</td></tr>  
    							     <tr><td>电话：&nbsp;&nbsp;</td><td valign="top"><br></td><td>${item.phone }&nbsp;</td></tr> 
    							      <tr>
    							      <td valign="top"><input type="button" value="更新" onclick="location.href='updateUser.jsp'"></td>
    							     </tr>					
								    </table>
								    </tr>
								</s:iterator>
								
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