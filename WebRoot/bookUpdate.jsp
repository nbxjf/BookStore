<%@ page  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page import="domain.*" %>
<%
Books item=(Books)session.getAttribute("item");
 %>
<!DOCTYPE html >
<html>

<head>
	<title>阅毒首页</title>
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
									      <p><a href="index.jsp"><span class="STYLE1">阅毒书城</span></a></p>
									      <table width="200" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
									    
									         <td><div align="center"><a href="index.jsp">注销</a></div></td>
									     
									    </tr>
                                          </table>
								      </div>
                                       <div></div>
                                       <ul class="navigation">
										    <li class="active" ><a href="index.jsp" style="left: 0px; width: 191px;">修改删除书籍</a></li>
											<li><a href="bookAdd.jsp" style="left: 0px; width: 192px;">添加书籍</a></li>
											
											 <li ><a href="orderSearch.jsp" style="left: 0px; width: 189px;">查看订单</a></li>
											 
										 
											  <li ><a href="orderShow.action" style="left: 0px; width: 183px;">发货</a></li>
											 
									  </ul>
										<p>&nbsp;</p>
									</div>
								<div id="contentDIV" >
								
								
								<s:form id="bookUpdateForm" name="bookUpdateForm" method="post"   enctype="multipart/form-data">
     <s:textfield name="book.bname"  id="name" label="请您输入书名"/>
    <s:textfield name="book.author"  id="author" label="请您输入作者"/>
    <s:textfield name="book.press"  id="press" label="请您输入出版社"/>
    <s:textfield name="book.price"  id="price" label="请您输入价格"/>
    <s:file   name="image" id="price" label="上传封面"/>
     <s:textfield name="book.publicationDate"  id="publicationDate" label="请您输入出版日期"/>
    <s:textfield name="book.discription"  id="discription" label="请您输入书简介"/>
    <s:textfield name="book.cata"  id="cata" label="请您输入目录"/>
    <s:submit value="提交" class="btn-submit" tabindex="5" onclick="update()"/>
    	 
                                </s:form>			
								
																
															
						        </div>
						</div>
					 </div>
					 <div class="shadow">&nbsp;</div>
			  </div>  
			    
	  </div>    
	</div>
	<script language="JavaScript" type="text/javascript"> 
function update()
{
        var n = document.bookUpdateForm.name.value;
		if(n=="")
		{
		    alert("请输入书名！")
		}
		else
		{
		    //当判断信息未填写正确时，不提交表单
		    document.getElementById("bookUpdateForm").action="bookUpdate.action";  
            document.getElementById("bookUpdateForm").submit();
		}
}
</script> 
<script language="JavaScript" type="text/javascript"> 
</script> 
</body>
</html>