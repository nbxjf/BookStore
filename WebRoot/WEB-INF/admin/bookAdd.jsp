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
									    
									         <td><div align="center"><a href="index.jsp">注销</a></div></td>
									     
									    </tr>
                                          </table>
								      </div>
                                       <div></div>
                                       <ul class="navigation">
										 <li><a href="orderShow.jsp" style="left: 0px; width: 191px;">发货</a></li>
											<li  class="active" ><a href="bookAdd.jsp" style="left: 0px; width: 192px;">添加书籍</a></li>
											<li><a href="bookShow.jsp" style="left: 0px; width: 192px;">修改删除书籍</a></li>
									
											 
										 
											  <li ><a href="orderSearch.jsp" style="left: 0px; width: 183px;">查看订单</a></li>
									  </ul>
										<p>&nbsp;</p>
									</div>
								<div id="contentDIV" >
								
								<s:form id="bookAddForm" name="bookAddForm" method="post"   enctype="multipart/form-data">
     <s:textfield name="book.bname"  id="name" label="请您输入书名"/>
    <s:textfield name="book.author"  id="author" label="请您输入作者"/>
    <s:textfield name="book.press"  id="press" label="请您输入出版社"/>
    <s:textfield name="book.price"  id="price" label="请您输入价格"/>
    <s:file   name="image" id="price" label="上传封面"/>
    <s:textfield name="book.publicationDate"  id="publicationDate" label="请您输入出版日期"/>
    <s:textfield name="book.discription"  id="discription" label="请您输入书简介"/>
    <s:textfield name="book.cata"  id="cata" label="请您输入目录"/>
    <s:submit value="提交" class="btn-submit" tabindex="5" onclick="add()"/>
    	 
                                </s:form>									
															
						        </div>
						</div>
					 </div>
					 <div class="shadow">&nbsp;</div>
			  </div>  
			    
	  </div>    
	</div>
	<script language="JavaScript" type="text/javascript"> 
function add()
{
        var n = document.bookAddForm.name.value;
		if(n=="")
		{
		    alert("请输入书名！")
		}
		else
		{
		    //当判断信息未填写正确时，不提交表单
		    document.getElementById("bookAddForm").action="bookAdd.action";  
            document.getElementById("bookAddForm").submit();
		}
}
</script> 
<script language="JavaScript" type="text/javascript"> 
</script> 
</body>
</html>