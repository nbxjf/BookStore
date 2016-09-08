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
									    
									         <td><div align="center"><a href="../index.jsp">注销</a></div></td>
									    
								      </div>
                                       <div></div>
                                    <ul class="navigation">
										    <li><a href="orderShow.jsp" style="left: 0px; width: 191px;">发货</a></li>
											<li><a href="bookAdd.jsp" style="left: 0px; width: 192px;">添加书籍</a></li>
											<li><a href="bookShow.jsp" style="left: 0px; width: 192px;">修改删除书籍</a></li>
									
											 
										 
											  <li  class="active" ><a href="orderSearch.jsp" style="left: 0px; width: 183px;">查看订单</a></li>
											 
									  </ul>
										<p>&nbsp;</p>
									</div>
									
									<div>
									<form name="searchForm" id="searchForm" method="post" >
									<div>
									<select name="searchType" id="searchType" width="15">
                                         <option selected="selected" value="--搜索类型--">--搜索类型--</option>
                                          <option value="1">订单ID</option>
                                          <option value="2">会员号</option> 
                                          <option value="3">书号</option>              
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
								<td>订单号</td>
								<td>ISBN</td>
								<td>用户id</td>
								<td>发货情况</td>
								<td>发货时间</td>
								<td>价格</td>
								<td>数量</td>
								
								</tr>
								<s:iterator id="item" value="#session.searchOrder" status="status">  
								
 						
    							     <td>${item.oid } &nbsp;</td>
    							     <td>${item.isbn }&nbsp;</td> 
    							     <td>${item.id }&nbsp;</td>  
    							     <td>${item.shipments }&nbsp;</td> 
    							     <td>${item.date }&nbsp;</td>  
    							     <td>${item.price }&nbsp;</td>
    							     <td>${item.number }&nbsp;</td>
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
		    document.getElementById("searchForm").action="orderSearch.action";  
            document.getElementById("searchForm").submit();
		}
    }
</script> 
</body>
</html>