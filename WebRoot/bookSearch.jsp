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
									
									<div>
									<form name="searchForm" id="searchForm" method="post" >
									<div>
									<select name="searchType" id="searchType" width="15">
                                         <option selected="selected" value="--搜索类型--">--搜索类型--</option>
                                          <option value="1">ISBN</option>
                                          <option value="2">书名</option> 
                                          <option value="3">作者</option>
                                          <option value="4">出版社</option>                   
                                          </select> 
                                    </div>
                                    <div>
									<p>
								              <input name="searchWord" id="searchWord" type="text" size="18"> <input type="button" onclick="searchbook()" value="搜索">
                                               </p>
									  </div>                                 
                                      </form>          
									</div>
									
 <c:if test="${searchword!=null}" var="result" scope="session">									
								<div id="contentDIV" >
								
								<table border="0">
								<tr>
								<td>图片</td>
								<td>ISBN</td>
								<td>书名</td>
								<td>作者</td>
								<td>出版社</td>
								<td>出版日期</td>
								<td>售价</td>
								<td>简述</td>
								</tr>
								<s:iterator id="item" value="#session.searchbook" status="status">  
								<tr id="<s:property value="#status.isbn"/>"> 
 								<td> <a href="book.action?book.isbn=${item.isbn}"><img src=" images//${item.picture } "width="96" height="135"></a> </td>   
    							<td width="5%">${item.isbn } &nbsp;</td>
    							<td width="10%">${item.bname }&nbsp;</td> 
    							<td width="10%">${item.author }&nbsp;</td>  
    							<td width="10%">${item.press }&nbsp;</td> 
    							<td width="10%">${item.publicationDate }&nbsp;</td>  
    							<td width="10%">${item.price }&nbsp;</td>
    							<td width="35%">${item.discription }&nbsp;</td>
    							</tr>
    							</s:iterator>									
								</table>									
						        </div>
</c:if>						        
						
						
						</div>
					 </div>
					 <div class="shadow">&nbsp;</div>
			  </div>  
			    
	  </div>    
	</div>
	
<script language="JavaScript" type="text/javascript"> 
    function searchbook()
    {
        var sel=document.getElementsByName("searchType")[0];
        var selvalue= sel.options[sel.options.selectedIndex].value
         
        var searchWord = document.searchForm.searchWord.value;
		
		if(selvalue=="--搜索类型--")
		{
		    alert("请选择搜索类型");
		    document.URL=location.href;
		}
		else if(searchWord=="")
		{ 
		    alert("请输入搜索内容");
		    document.URL=location.href;
		}
		else
		{
		    document.getElementById("searchForm").action="bookSearch.action";  
            document.getElementById("searchForm").submit();
		}
    }
</script>
</body>
</html>