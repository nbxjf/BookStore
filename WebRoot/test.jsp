<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
  <head>
    
    <title>My JSP 'textallbook.jsp' starting page</title>

  </head>
  
  <body>
								<table border="4">
								<s:iterator id="item" value="#session.allbook" status="status">  
								<tr> 
 								<td> <a href=""><img src=" ${item.picture } "></a> </td>   
    							     <td>${item.bname }&nbsp;</td> 
    							     <td>${item.author }&nbsp;</td>  
    							     <td>${item.press }&nbsp;</td> 
    							     <td>${item.publicationDate }&nbsp;</td>  
    							     <td>${item.price }&nbsp;</td>
    							     <td>${item.discription }&nbsp;</td>
    							</tr>
    							</s:iterator>									
								</table>									
  </body>
</html>
