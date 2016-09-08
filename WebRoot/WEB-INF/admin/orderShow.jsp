<%@ page  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>

<head>
	<title>后台首页</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
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

<body background="../images/bg-body.gif">
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
									    
									         <td><div align="center"><a href="../index.jsp">注销</a></div></td>
									     
									    </tr>
                                          </table>
								      </div>
                                       <div></div>
                                       <ul class="navigation">
										    <li class="active" ><a href="orderShow.jsp" style="left: 0px; width: 191px;">发货</a></li>
											<li><a href="bookAdd.jsp" style="left: 0px; width: 192px;">添加书籍</a></li>
											<li><a href="bookShow.jsp" style="left: 0px; width: 192px;">修改删除书籍</a></li>
									
											 
										 
											  <li ><a href="orderSearch.jsp" style="left: 0px; width: 183px;">查看订单</a></li>
											 
									  </ul>
										<p>&nbsp;</p>
									</div>
								<div id="contentDIV" >
								
									
								<table border="1">
								<tr>
								<td>书号</td>
								<td>会员号</td>
								<td>发货情况</td>
								<td>购买时间</td>
								<td>单价</td>
								<td>数量</td>
								
								</tr>
								<s:iterator id="item" value="#session.allorder" status="status">  
								<tr id="<s:property value="#status.isbn"/>"> 
 								   
    							     <td>${item.isbn } &nbsp;</td>
    							     <td>${item.id }&nbsp;</td> 
    							     <td> <a href="orderUpdate.action?order.oid=${item.oid}">${item.shipments }&nbsp;</a> </td>   
    							     <td>${item.date }&nbsp;</td> 
    							     <td>${item.price }&nbsp;</td>
    							     <td>${item.number }&nbsp;</td>
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