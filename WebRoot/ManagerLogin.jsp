<%@ page  pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body { font:12px/1.6 arial,helvetica,sans-serif; }
a:link { color:#369;text-decoration:none; }
a:visited { color:#669;text-decoration:none; }
a:hover { color:#fff;text-decoration:none;background:#039; }
a:active { color:#fff;text-decoration:none;background:#f93; }
button { cursor:pointer;line-height:1.2; }
td {
	font-family: "宋体";
	font-size: 9pt;
}
.top {
	font-family: "宋体";
	font-size: 24pt;
	font-style: normal;
	font-weight: bold;
	color: #339900;
	text-decoration: none;
}
.STYLE1 {
	color: #000000;
	font-size: 16pt;
	font-weight: bold;
}
.btn-submit { cursor: pointer;color: #ffffff;background: #3fa156; border: 1px solid #528641; font-size: 14px; font-weight: bold; padding:6px 26px; border-radius: 3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; *width: 100px;*height:30px; }
.btn-submit:hover { background-color:#4fca6c;border-color:#6aad54; }
.btn-submit:active { background-color:#3fa156;border-color:#528641; }
.remember { cursor: pointer; font-size: 12px; display: inline; width: auto; text-align: left; float: none; margin: 0; color: #666 }
.basic-input { width: 200px; padding: 5px; height: 22pt; font-size: 14px;vertical-align:middle; -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; border: 1px solid #c9c9c9; font-size: 10px }
.STYLE2 {font-family: "Courier New", Courier, monospace; font-size: 24pt; font-style: normal; font-weight: bold; color: #886600; text-decoration: none; }
-->
</style>
<title>登录</title>
</head>
<body>




<table width="1067" border="0" cellpadding="0" cellspacing="0">
  <br><br><!--DWLayoutTable-->
      
  <tr>
    <td width="48" height="22">&nbsp;</td>
    <td width="46">&nbsp;</td>
    <td width="188">&nbsp;</td>
    <td width="266">&nbsp;</td>
    <td width="17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></td>
    <td width="23">&nbsp;</td>
    <td width="105">&nbsp;</td>
    <td width="27">&nbsp;</td>
    <td width="171">&nbsp;</td>
    <td width="53">&nbsp;</td>
    <td width="123">&nbsp;</td>
  </tr>
  <tr>
    <td height="74">&nbsp;</td>
    <td colspan="2" valign="top" class="top"></td>
    <td class=""></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="16">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="28">&nbsp;</td>
    <td colspan="2" rowspan="2" valign="top"><span class="STYLE1">登录阅读</span></td>
    <td>&nbsp;<div align="center"><a href="index.jsp">返回主页</a></div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 
  <tr>
    <td height="22">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="34">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2" rowspan="5" valign="top">
    
 <s:form id="loginForm" name="loginForm" method="post" >
     <s:textfield name="managers.mname"  id="name" label="请您输入管理员名"/>
    	<s:password name="managers.mpass"  id="psw" label="请您输入密码"/>
       <s:submit value="登录" class="btn-submit" tabindex="5" onclick="login()"/>
    	 
    </s:form>
 
 
  </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top"></td>
    <td>&nbsp;</td>
    <td valign="top"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="204">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<script language="JavaScript" type="text/javascript"> 
function login()
{
        var account = document.loginForm.name.value;
		var password = document.loginForm.psw.value;
		if(account==""||password=="")
		{
		    alert("请输入用户名和密码！")
		}
		else
		{
		    //当判断信息未填写正确时，不提交表单
		    document.getElementById("loginForm").action="managerLogin.action";  
            document.getElementById("loginForm").submit();
		}
}
</script> 

</body>
</html>

